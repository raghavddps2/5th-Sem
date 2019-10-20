import sys
import os
from functools import reduce

dict = {}

if(len(sys.argv) != 2):
    print("Invalid arguments")
    sys.exit()

if(not(os.path.exists(sys.argv[1]))):
    print("File doesn't exist, please provide correct location")
    sys.exit()

if(sys.argv[1].split(".")[-1] != 'txt'):
    print("Invalid file format")
    sys.exit()

with open(sys.argv[1]) as file:
    for line in file:
        for word in line.split():
            dict[word] = dict.get(word,0)+1
            
for i in dict:
    print(i,"---->",dict[i])

#dict.items() basically gives you the items in the form of a tuples.

s1 = []
print()
print("Top 10 in descending order")
# sorted(what we wanna store finally,key=on what basis we wanna store here we have a lambda function x:x[1],reverse=True)
s1 = sorted(dict.items(),key = lambda x:x[1],reverse=True)
for i in range(10):
    print(s1[i][0],"------>",s1[i][1])

#This will store the length of each variable in the word list.
word = []
for i,j in s1[:10]:
    word.append(len(i))

print(word)

#Reduce is a very special function, all it does is basically applies a function or operation on entire sequence.
sum1 = reduce((lambda x,y:x+y),word)
print('The average length is ', sum1/len(word))

list2 = [i*i for i in word if i%2 != 0]
print("All the squares of odd len words are: ",list2)
