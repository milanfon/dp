from datetime import datetime
from enum import Enum
import os
import subprocess
import time
import robot
import argparse
import jinja2
import re
from openai import OpenAI
import xml.etree.ElementTree as ElementTree
from tabulate import tabulate

CONTAINER_DIRECTORY = "./tbuis/"
INPUT_FOLDER = "./input/"
TEMPLATE_FILE = "./templates/template.txt"
SYSTEM_PROMPT = "./templates/system.txt"
GEN_FOLDER = "./generated"
REPORT_FOLDER = "./reports"

parser = argparse.ArgumentParser(description="Robot Framework test generator.")
parser.add_argument('-r', '--run', type=str, help='Run the generation')
parser.add_argument('-n', '--new', type=str, help='Create new input file (test)')
parser.add_argument('-i', '--input', type=str, help='Render input file (test)')
parser.add_argument('--count', type=int, help='How many variations of the test gnerate?')
parser.add_argument('--cmd', action='store_true', help='Output render to command line')
parser.add_argument('--manual_oai', action='store_true', help='Manualy copy and paste prompts into OpenAI Chat instead of using API')
args = parser.parse_args()

def get_file_pattern(base):
    return re.compile(rf'^{re.escape(base)}-(\d+)\.robot$')

def system_prompt():
    with open(SYSTEM_PROMPT, 'r') as sp_file:
        return sp_file.read()

def parse_code_blocks(markdown_text):
    pattern = re.compile(r'```(?:.*?)\n(.*?)```', re.DOTALL)
    return pattern.findall(markdown_text)

def save_test(text, name):
    if not os.path.exists(GEN_FOLDER):
        os.makedirs(GEN_FOLDER)
    base = os.path.splitext(name)[0]
    pattern = get_file_pattern(base)
    highest_num = 0
    for file in os.listdir(GEN_FOLDER):
        match = pattern.match(file)
        if match:
            num = int(match.group(1))
            if num > highest_num:
                highest_num = num

    highest_num = highest_num + 1
    new_name = f"{base}-{highest_num}.robot"
    test_path = os.path.join(GEN_FOLDER, new_name)

    with open(test_path, 'w') as file:
        file.write(text)
    print(f"Test saved to '{test_path}'")

def new_input(input_name):
    if not os.path.exists(INPUT_FOLDER):
        os.makedirs(INPUT_FOLDER)
    if not input_name.endswith('.txt'):
        input_name += '.txt'
    input_file_path = os.path.join(INPUT_FOLDER, input_name)
    with open(input_file_path, 'w') as new_file:
        if os.path.exists(TEMPLATE_FILE):
            with open(TEMPLATE_FILE, 'r') as template:
                new_file.write(template.read())
            print(f"New input file '{input_file_path}' created from template.")
        else:
            print(f"Template file '{TEMPLATE_FILE}' not found. Empty file created.")

def render_template(input_name):
    if not input_name.endswith('.txt'):
        input_name += '.txt'
    env = jinja2.Environment(loader=jinja2.FileSystemLoader(INPUT_FOLDER))
    template = env.get_template(input_name)
    rendered_text = template.render()
    if args.cmd:
        print(rendered_text)
        return

    print("Test generation started...")

    if args.count and args.count > 1:
        for _ in range(args.count):
            response = prompt_model(rendered_text)
            save_test(response, input_name)
    else:
        response = prompt_model(rendered_text)
        save_test(response, input_name)

def prompt_model(rendered_text):
    if args.manual_oai:
        return manual_prompt(rendered_text)
    client = OpenAI(base_url="http://localhost:1234/v1", api_key="not-needed")
    completion = client.chat.completions.create(
      model="local-model", 
      messages=[
        {"role": "system", "content": system_prompt()},
        {"role": "user", "content": rendered_text}
      ],
      temperature=0,
    )
    return completion.choices[0].message.content

def manual_prompt(rendered_text):
    concantenated = f"{system_prompt()}\n\n{rendered_text}"
    subprocess.run("pbcopy", text=True, input=concantenated) # MacOS only
    print("Prompt copied to clipboard")
    input("Copy the model output and press Enter key")
    output = subprocess.check_output('pbpaste', env={'LANG': 'en_US.UTF-8'}).decode('utf-8')
    return output

def is_docker_running():
    try:
        subprocess.run(["docker", "info"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
        return True
    except subprocess.CalledProcessError:
        return False

class TestStatus(Enum):
    PASS = 1
    FAIL = 2
    ERROR = 3

    def __str__(self) -> str:
        return self.name

class TestResult():
    def __init__(self, passed, failed, errors):
        self.passed = passed
        self.failed = failed
        self.errors = errors
        if errors > 0:
            self.status = TestStatus.ERROR
        elif failed > 0:
            self.status = TestStatus.FAIL
        else: 
            self.status = TestStatus.PASS

class Report():
    def __init__(self):
        self.name = datetime.now().strftime("%Y%m%d%H%M%S")
        self.container_name = ""
        self.tests = {}
    
    def set_container_name(self, name: str):
        self.container_name = name
        self.tests[self.container_name] = {}

    def add(self, name, file):
        tree = ElementTree.parse(file)
        root = tree.getroot()
        stats = root.find('.//statistics/total/stat')
        if stats is not None:
            passed = int(stats.get('pass'))
            failed = int(stats.get('fail'))

            errors = root.findall('.//errors/msg[@level="ERROR"]')
            error_count = len(errors)
            test_result = TestResult(passed, failed, error_count)
        else:
            print("Statistics not found!")
            test_result = TestResult(0, 0, 1)

        self.tests[self.container_name][name] = test_result

    def save(self):
        report_text = f"Report name: {self.name}\n\n"
        for container_name, _ in self.tests.items():
            report_text += f"\nContainer name: {container_name}\n"
            table_data = []
            for name, test in self.tests[container_name].items():
                table_data.append([name, test.status, test.passed, test.failed, test.errors])
            headers = ["Name", "Status", "Passed", "Failed", "Errored"]
            table = tabulate(table_data, headers, tablefmt="grid")
            report_text += table
        if not os.path.exists(REPORT_FOLDER):
            os.makedirs(REPORT_FOLDER)
        file = open(os.path.join(REPORT_FOLDER, self.name), "w")
        file.write(report_text)
        file.close()

def run(): 
    if (not is_docker_running()):
        print("Docker is not running!")
        return
    # List variants of WAR files
    file_list = [file for file in os.listdir(CONTAINER_DIRECTORY) if file.startswith('defect-')]
    file_list.sort()

    print(file_list)

    # Running Docker Compose

    #os.chdir(DIRECTORY)
    report = Report()
    i = 0
    for file in file_list:
       report.set_container_name(file)
       print("Deploying: "+file)
       env = os.environ.copy() 
       env["WAR_FILE_PATH"] = "./"+file
       subprocess.run(["docker-compose", "-f", os.path.join(CONTAINER_DIRECTORY, "docker-compose.yml"), "up", "-d", "--build"], env=env)
       print("Waiting 10s for container to load...")
       time.sleep(10)
       pattern = get_file_pattern(args.run)
       for file in os.listdir(GEN_FOLDER):
           match = pattern.match(file)
           if match:
                print(f"Running test file: {file}")
                robot.run(os.path.join(GEN_FOLDER, file))
                report.add(file, "output.xml")
       subprocess.run(["docker-compose", "down"])
       if i == 2:
            break
       i += 1

    print("Saving report...")
    report.save()

    subprocess.run(["docker-compose", "-f", os.path.join(CONTAINER_DIRECTORY, "docker-compose.yml"), "down", "--rmi", "all"])

if __name__ == "__main__":
    if args.run:
        run()
    if args.new:
        new_input(args.new)
    if args.input:
        render_template(args.input)
