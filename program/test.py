import os
import subprocess
import time

DIRECTORY = "./tbuis/"

# List variants of WAR files
file_list = [file for file in os.listdir(DIRECTORY) if file.startswith('defect-')]
file_list.sort()

print(file_list)

# Running Docker Compose

for file in file_list:
   env = os.environ.copy() 
   env["WAR_FILE_PATH"] = file
   os.chdir(DIRECTORY)
   subprocess.run(["docker-compose", "up", "-d"], env=env)
   break

time.sleep(30)

subprocess.run(["docker-compose", "down", "--rmi", "all"])
