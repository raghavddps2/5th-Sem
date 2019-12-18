import os
from functools import reduce
import sys

#If the argument length os not equal to 2, we will exit.
if(len(sys.argv) != 2):
    print("The argument list is not proper")
    sys.exit()

#If the specified file does not exist, we will exit
if(not(os.path.exists(sys.argv[1]))):
    print("The specified file does not exist")
    sys.exit()

#If the file is not a text file, we will exit.
# print(sys.argv[1].split(".")[1]) #Here it gives a list, so 1 tells the extension part
if(sys.argv[1].split(".")[1] != 'txt'):
    print("No other files except the text files are supported")
    sys.exit()

wordDict = {}
#The below code will count the frequency of each word in the file, it just goes line by line.
with open(sys.argv[1]) as file:
    for line in file:
        #Here, we specify word in line.split(), explicitly telling to consider words.
        for word in line.split():
            wordDict[word] = wordDict.get(word,0) + 1

for i in wordDict:
    print(i,"--------------->",wordDict[i])

#NOw, we have to display the top 10 words with most number of occurences.
# wordDict.items() ===> This just gives me the tuples.
#NOw, to obtain the top 10, we use the sorted function.
# We specify the key, as to on what basis to sort, that is the length, the second part of tuple.
# Here, the val represent the each item.
list1 = sorted(wordDict.items(),key = lambda val:val[1],reverse=True)
#This way we obtain the words which have greater occurence.
for i in range(10):
    print(list1[i])
    
list2 = []
for i in range(len(wordDict)):
    list2.append(list1[i][1])
print(len(list2))

#Reduce function is basically a function applied on a sequence.
sum = reduce(lambda x,y: x+y,list2)
print("Avergae length: ",sum/len(list2))

#Store the square if count is odd
oddAns = [x**2 for x in list2 if x%2 != 0]
print(oddAns)
print(len(oddAns))