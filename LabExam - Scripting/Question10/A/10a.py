from functools import reduce

#This just maps each splitted input to integer and the converts to the list.
list1 = list(map(int,input().split()))
print(list1)

#The function now wil just multiply each element by 3.
list2 = [i*3 for i in list1]
print(list2)

sum1 = reduce(lambda x,y: x+y,list1)
sum2 = reduce(lambda x,y:x+y,list2)

print("The sum of list1 is ", sum1)
print("The sum of list2 is ",sum2)