import os
import subprocess
import time
import robot
import argparse
import jinja2
import re
from openai import OpenAI

DIRECTORY = "./tbuis/"
INPUT_FOLDER = "./input/"
TEMPLATE_FILE = "./templates/template.txt"
SYSTEM_PROMPT = "./templates/system.txt"
GEN_FOLDER = "./generated"

parser = argparse.ArgumentParser(description="Robot Framework test generator.")
parser.add_argument('-r', '--run', action='store_true', help='Run the generation')
parser.add_argument('-n', '--new', type=str, help='Create new input file (test)')
parser.add_argument('-i', '--input', type=str, help='Render input file (test)')
parser.add_argument('--count', type=int, help='How many variations of the test gnerate?')
parser.add_argument('--cmd', action='store_true', help='Output render to command line')
parser.add_argument('--manual_oai', action='store_true', help='Manualy copy and paste prompts into OpenAI Chat instead of using API')
args = parser.parse_args()

def system_prompt():
    with open(SYSTEM_PROMPT, 'r') as sp_file:
        return sp_file.read()

def save_test(text, name):
    if not os.path.exists(GEN_FOLDER):
        os.makedirs(GEN_FOLDER)
    base = os.path.splitext(name)[0]
    pattern = re.compile(rf'^{re.escape(base)}-(\d+)\.robot$')
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

def run(): 
    # List variants of WAR files
    file_list = [file for file in os.listdir(DIRECTORY) if file.startswith('defect-')]
    file_list.sort()

    print(file_list)

    # Running Docker Compose

    os.chdir(DIRECTORY)
    i = 0
    for file in file_list:
       print("Deploying: "+file)
       env = os.environ.copy() 
       env["WAR_FILE_PATH"] = "./"+file
       subprocess.run(["docker-compose", "up", "-d", "--build"], env=env)
       time.sleep(10)
       robot.run("../rf-test/TBUIS1.robot")
       subprocess.run(["docker-compose", "down"])
       if i == 2:
            break
       i += 1

    subprocess.run(["docker-compose", "down", "--rmi", "all"])

if __name__ == "__main__":
    if args.run:
        run()
    if args.new:
        new_input(args.new)
    if args.input:
        render_template(args.input)
