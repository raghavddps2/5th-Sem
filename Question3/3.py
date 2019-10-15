class SentenceReverser:

    sentence = ""
    reverse = ""
    vowels = ['a','e','i','o','u']
    getVowelCount = 0
    
    def __init__(self):
        self.sentence = input("Enter the sentence here:  ")
        #We call the reverse method.
        self.reverse()

    def reverse(self):
        #This will just reverse the sentence with a space between all words.
        #We have the reversed function that does it all like an iteratror.
        self.reverse = " ".join(reversed(self.sentence.split(" ")))
    
    def getVowelCount(self):
        #This is basically sum(when s is in vowels for each s in sentence lowered)
        self.getVowelCount = sum(s in self.vowels for s in self.sentence.lower())
        return self.getVowelCount

reverseArr = []
for i in range(0,3):
    reverse = SentenceReverser()
    #We apend all the objects to an array.
    reverseArr.append(reverse)
    #We print the reverse property for the same.
    print(reverse.reverse)

#This takes the whole object array, takes the key as the vowelCount and puts reverse as true.
l1 = sorted(reverseArr,key=lambda item:item.getVowelCount(),reverse=True)
for i in l1:
    print(i.getVowelCount,"----->",i.reverse)