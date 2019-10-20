l1 = list()

#The function below is simply used to take input fpr the list. We now restrict it to 5 elements.
def create_list():
    for i in range(5):
        l1.append(int(input()))

#This function will simply use the property of sets to remove the duplicate elemnts from the list.
def removeDup():
    #Set of l1 will give all unique lements in a set, then we will convert it into a list.
    return list(set(l1))

create_list()
print(removeDup())

#Now, it asks to create a one line list comprehension to create a list of 28 even numbers.
l2 = [i for i in range(56) if i%2 == 0]
print(l2)

#Traversing from behind, will give the list in reverse order.
l3 = ['This','is','raghav','and','i','am','happy']
print(l3[::-1])