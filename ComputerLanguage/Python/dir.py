import os
dirname = "/home/jayleekr/workspace/00_codes/05_info_archive/InfoArchive/ComputerLanguage"
for root, dirs, files in os.walk(dirname):
    if len(dirs) > 0:
        print(len(dirs))
        for dir in dirs:
            print(os.path.join(root,dir))

