class ReverseString:

    sentence = ""
    reverse = ""
    vowels = ['a','e','i','o','u']
    vowelCount = 0

    # 3The constructor here calculates the vowels and gets the reverse as well.
    def reverse(self):
        return "".join(reversed(self.sentence.split()))

    def vowelCount(self):
        return sum(i in vowels for i in self.sentence.lower())

    def __init__(self,sentence):

        self.sentence = sentence
        "The join command joins each word with a space"
        self.reverse = " ".join(reversed(self.sentence.split(" ")))
        self.vowelCount = sum(i in self.vowels for i in self.sentence.lower())

#Now, we will tak3 3 imputs.
reverseArr = [] #This will form an array of objects.
for i in range(3):
    reverse = ReverseString(input("Enter the string:\t"))
    reverseArr.append(reverse)
    print(reverse.reverse)

#Now we will sort based on the total vowel count
list1 = sorted(reverseArr,key = lambda item: item.vowelCount,reverse=True)

#This will sort the object arrays.
print("Sentence\t\tReverse\t\tVowelCount")
for i in list1:
    print(i.sentence,"\t",i.reverse,"\t\t",i.vowelCount)