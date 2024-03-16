import os
import subprocess
import time
import robot
import argparse
import jinja2

DIRECTORY = "./tbuis/"
INPUT_FOLDER = "./input/"
TEMPLATE_FILE = "./templates/template.txt"
GEN_FOLDER = "./generated"

parser = argparse.ArgumentParser(description="Robot Framework test generator.")
parser.add_argument('-r', '--run', action='store_true', help='Run the generation')
parser.add_argument('-n', '--new', type=str, help='Create new input file (test)')
parser.add_argument('-i', '--input', type=str, help='Render input file (test)')
args = parser.parse_args()

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
    rendered_text = template.render(bla="1010")
    print(rendered_text)

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
