import os

# List variants of WAR files
file_list = [file for file in os.listdir("./tbuis/") if file.startswith('defect-')]
file_list.sort()

print(file_list)
