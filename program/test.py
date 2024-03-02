import os
import subprocess
import time
import robot

DIRECTORY = "./tbuis/"

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
