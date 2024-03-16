import os
import subprocess
import time
import robot
import argparse

DIRECTORY = "./tbuis/"
INPUT_FOLDER = "./input/"
SYSTEM_PROMPT = "./templates/system.txt"

parser = argparse.ArgumentParser(description="Robot Framework test generator.")
parser.add_argument('-r', '--run', action='store_true', help='Run the generation')
parser.add_argument('-i', '--input', type=str, help='Create new input file (test)')
args = parser.parse_args()

def new_input(input_name):
    if not os.path.exists(INPUT_FOLDER):
        os.makedirs(INPUT_FOLDER)
    input_file_path = os.path.join(INPUT_FOLDER, input_name)
    with open(input_file_path, 'w') as new_file:
        if os.path.exists(SYSTEM_PROMPT):
            with open(SYSTEM_PROMPT, 'r') as system_prompt:
                new_file.write(system_prompt.read())
            print(f"New input file '{input_file_path}' created!")
        else:
            print(f"System prompt '{SYSTEM_PROMPT}' not found!")

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
    if args.input:
        new_input(args.input)
