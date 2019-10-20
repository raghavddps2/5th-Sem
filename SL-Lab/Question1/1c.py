l1 = []

for i in range(10):
    l1.append(int(input()))

#Now we are supposed to find the max in the list.
def maxi(l1):
    if len(l1) == 1:
        #We just return the first element if the length of list is one.
        return l1[0]
    else:
        #Here, we just take the max of l1[0] and the remaining list.
        return max(l1[0],maxi(l1[1:]))

print("The maximum in the list is ", maxi(l1))