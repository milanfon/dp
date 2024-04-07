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
from dotenv import load_dotenv
from llmlingua import PromptCompressor
import sqlite3
import configuration as config
import glob

CONTAINER_DIRECTORY = "./tbuis/"
INPUT_FOLDER = "./input/"
RESTORE_DB_FILE = "./templates/restore_db.robot"
TEMPLATE_FILE = "./templates/template.txt"
SYSTEM_PROMPT = "./templates/system.txt"
GEN_FOLDER = "./generated"
REPORT_FOLDER = "./reports"
REPORT_DB = os.path.join(REPORT_FOLDER, "report_db.sqlite")

load_dotenv()
API_URL = os.getenv('API_URL')
API_KEY = os.getenv('API_KEY')
API_MODEL = os.getenv('API_MODEL')
DEVICE = os.getenv('DEVICE')

parser = argparse.ArgumentParser(description="Robot Framework test generator.")
parser.add_argument('-r', '--run', type=str, help='Run the generation')
parser.add_argument('-n', '--new', type=str, help='Create new input file (test)')
parser.add_argument('-i', '--input', type=str, help='Render input file (test)')
parser.add_argument('--count', type=int, help='How many variations of the test gnerate?')
parser.add_argument('--cmd', action='store_true', help='Output render to command line')
parser.add_argument('--manual_oai', action='store_true', help='Manualy copy and paste prompts into OpenAI Chat instead of using API')
parser.add_argument('--cont_count', type=int, help='Set number of containers to execute')
parser.add_argument('--compress', action='store_true', help='Compress prompt')
parser.add_argument('--name', type=str, help='Name of report')
args = parser.parse_args()

def get_file_pattern(base):
    return re.compile(rf'^{re.escape(base)}-(\d+)\.robot$')

def get_files_matching_pattern(pattern, directory):
    full_pattern = os.path.join(directory, pattern)
    return glob.glob(full_pattern)

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
    if args.compress:
        rendered_text = compress_prompt(rendered_text, 0.4)

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
    client = OpenAI(base_url=API_URL, api_key=API_KEY)
    completion = client.chat.completions.create(
      model=API_MODEL, 
      messages=[
        {"role": "system", "content": system_prompt()},
        {"role": "user", "content": rendered_text}
      ],
      temperature=0.7,
      top_p=1,
      max_tokens=-1,
      stream=False
    )
    message = completion.choices[0].message.content
    return extract_code_block(message)

def manual_prompt(rendered_text):
    concantenated = f"{system_prompt()}\n\n{rendered_text}"
    subprocess.run("pbcopy", text=True, input=concantenated) # MacOS only
    print("Prompt copied to clipboard")
    input("Copy the model output and press Enter key")
    output = subprocess.check_output('pbpaste', env={'LANG': 'en_US.UTF-8'}).decode('utf-8')
    return extract_code_block(output)

def compress_prompt(prompt, rate):
    print("Prompt compression started...")
    results = compressor.compress_prompt_llmlingua2(
                prompt,
                rate=rate,
                force_tokens=['\n', '.', '!', '?', ',', '\\'],
                chunk_end_tokens=['.', '\n'],
                return_word_label=True,
                drop_consecutive=True
            )
    print(f"Compressed with rate {results['rate']}")
    return results['compressed_prompt']

def extract_code_block(md_text):
    pattern = re.compile(r'```.*?\n(.*?)\n```', re.DOTALL)
    match = pattern.search(md_text)
    if match:
        return match.group(1).strip()
    return md_text

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
        self.name = f"{datetime.now().strftime('%Y%m%d%H%M%S')}{'-' + args.name if args.name else ''}"
        self.container_name = ""
        self.tests = {}
        db_exists = os.path.exists(REPORT_DB)
        self.conn = sqlite3.connect(REPORT_DB)
        if not db_exists:
            self.init_db()
    
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

        insert_sql = '''
            INSERT INTO runs (name, container, test_name, result, success, fail, error)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ''' 
        cursor = self.conn.cursor()
        cursor.execute(insert_sql, (self.name, self.container_name, name, str(test_result.status), test_result.passed, test_result.failed, test_result.errors))
        self.conn.commit()

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

    def init_db(self):
        print("Creating report database...")
        create_table_sql = '''
            CREATE TABLE IF NOT EXISTS runs (
                id INTEGER PRIMARY KEY,
                time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                name TEXT NOT NULL,
                container TEXT NOT NULL,
                test_name TEXT NOT NULL,
                result TEXT NOT NULL,
                success INTEGER,
                fail INTEGER,
                error INTEGER
            );
        '''
        cursor = self.conn.cursor()
        cursor.execute(create_table_sql)
        self.conn.commit()
        print("Table structure prepared.")

def run(): 
    if (not is_docker_running()):
        print("Docker is not running!")
        return
    # List variants of WAR files
    file_list = [file for file in os.listdir(CONTAINER_DIRECTORY) if file.startswith('defect-') and file in config.RUN_CONTAINERS]
    file_list.sort()

    print(file_list)

    # Running Docker Compose

    #os.chdir(DIRECTORY)
    report = Report()
    i, t = 0, 0
    for file in file_list:
       report.set_container_name(file)
       print("Deploying: "+file)
       env = os.environ.copy() 
       env["WAR_FILE_PATH"] = "./"+file
       subprocess.run(["docker-compose", "-f", os.path.join(CONTAINER_DIRECTORY, "docker-compose.yml"), "up", "-d", "--build"], env=env)
       print("Waiting 10s for container to load...")
       time.sleep(10)

       matching_files = get_files_matching_pattern(args.run, GEN_FOLDER)

       for full_path in matching_files:
           if t > 0:
               print("Restoring DB...")
               robot.run(RESTORE_DB_FILE)
           print(f"Running test file: {full_path}")
           robot.run(full_path)
           relative_path = os.path.relpath(full_path, GEN_FOLDER)
           report.add(relative_path, "output.xml")
           t += 1
       subprocess.run(["docker-compose", "down"])
       if i == args.cont_count:
            break
       i += 1

    print("Saving report...")
    report.save()

    subprocess.run(["docker-compose", "-f", os.path.join(CONTAINER_DIRECTORY, "docker-compose.yml"), "down", "--rmi", "all"])

if __name__ == "__main__":
    if args.compress:
        compressor = PromptCompressor(
                model_name="microsoft/llmlingua-2-bert-base-multilingual-cased-meetingbank",
                use_llmlingua2=True,
                device_map=DEVICE
            )

    if args.run:
        run()
    if args.new:
        new_input(args.new)
    if args.input:
        render_template(args.input)
