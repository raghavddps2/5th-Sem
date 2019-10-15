import sys
import os

#We use the sys module to interact with the system arguments.
#We use the OS module to check if the particular file is present or not.

dict = {}

#We just check the length of the arguments.
if(len(sys.argv) != 2):
    print("Invalid arguments")
    sys.exit()

#We check if the text file is present or not.
if(not(os.path.exists(sys.argv[1]))):
    print("The file does not exist. Check the file path")
    sys.exit()

#We check if the file given is a text file only.
if(sys.argv[1].split(".")[-1] != 'txt'):
    print("Invalid file format")
    sys.exit()

#We now count the freq of each word in the file.
with open(sys.argv[1]) as file:
    for line in file:
        for word in line.split():
            dict[word] = dict.get(word,0) + 1

#This is just printing the same.
for i in dict:
    print(i," ----> ",dict[i])