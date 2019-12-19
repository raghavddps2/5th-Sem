from functools import reduce
l1 = [1,2,3]
l2 = [4,5,6]
l3 = [7,8,9]

ans = zip(l1,l2,l3)
print(list(ans)) 

def hi(li):
    print(li)
    li += 2

x = 2
hi(x)
print(x)

def hii(lii):
    lii[0] = 2
y = [1,2,3]
hii(y)
print(y[0])

# immutable - numbers,strings,int,tuple etc... ---- this is pass by value
# mutable - list set dictionary ... ---- this is pass by reference


def xis(*pit):
    print(len(pit))
    print(type(pit))
    print(pit[0])

xis([[1,2,3],"raghav",'123'])

listb = [1,2,3,4,5,6,7]
product = reduce(lambda x,y: x+y,listb)
print(product)

# filter is simply used when we wanna extract certail values which specify a condition
lista = [1,2,3,4,5]
df = filter(lambda x : x%2 == 0,lista)
print(list(df))

#map simply maps or applies the functions
xd = map(int,input().split(" "))
print(list(xd))

def cube(x):
    return x*x*x

x = lambda y : y*y*y
print(x(10))


from functools import reduce
# In this we will deal with 4 important functions of python. They are,
map, filter, reduce, zip

# To, go to any of that, first of all, it is very important to learn, as to what exactly is lambda functions.
def funct1(x):
    return x*x*x

print(funct1(10))

#Lambda function does the same in simple one line.
funct2 = lambda x: x*x*x 
print(funct2(10))

list0 = [2,4,6,8,10]
list1 = [1,2,3,4,5]
# 1. Map function, now let us use the map fnction to convert each into its squares.
list2 = list(map(lambda x: x*x,list1))
print(list2)

#2. Filter function, filter function is simply used to filter something from the list. We pick out odd numbers.
list3 = list(filter(lambda x: x%2 != 0,list1))
print(list3)

#3. Zip function is used to simply combine elements from 3 or more lists into a tuple.
list4 = list(zip(list1,list2))
print(list4)

#4. reduce function is used to reduce whatever iterable we have, so that we obtain a nice value, its function
    # usually takes just 2 arguments.
list5 = reduce(lambda x,y:x+y,list1)
print(list5)

#Tuples are immutable like strings and others.
#List, set, dictionary are mutable.
# () => Tuple.
# [] => list append,pop
# {:} => Dictionary
# {} => Set

#cool-> checkout frozenset in python

