"""
    1a. Write Python code to do the following:

    i. Create list with inputs from user
    ii. Determine minimum and maximum elements in the list
    iii. Insert new element into the list
    iv. Delete an element from the list
    v. Determine if an element is present in the list.
"""

#The below line will take the input from the user, space separated values and cast them into a list.

print("\n Enter the elements of the list separated by space:\t")
list1 = list(map(int,input().split(" ")))
print(list1)

#We have the direct min and max functions to find the min and max of the list.

min_list = min(list1)
max_list = max(list1)

print("The minimum element of the list is ", min_list, " and the maximum element of the list is ", max_list)


#To insert a new element into the list we have the direct append function.
print("\n Enter the element you wanna append to the list:\t")
ele = int(input())
list1.append(ele)


#The below is to remove an elemnet from the list.
print("\n Enter the element you wanna delete from the list:\t",end="")
ele = int(input())
try:
    list1.remove(ele)
except ValueError:
    print("The said element does not occur in the list")

print(list1)

# NOw, we have to check if an element is present in the list or not.
print("\n Enter the element you wanna check:\t")
ele = int(input())

if ele not in list1:
    print("\nThe lement is not present in the list")
else:
    print("\nElement is present in the list")
