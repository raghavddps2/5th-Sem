'''
8a. 
 (i) Create a dictionary that contains the atomic element symbol and its name. 
(ii) Add a unique & duplicate element into this dictionary by interacting with the user. 
    Observe the output and justify it. 
(iii) Display the number of atomic elements in this dictionary 
(iv) Ask user to enter an element to search in the dictionary. Display appropriate results. 
'''

atomicDictionary = {
    'H' : 'Hydrogen',
    'He' : 'Helium',
    'Li' : 'Lithium',
    'Be' : 'Beryllium',
    'F' : 'Flourine',
    'Xe' : 'Neon',
    'Ar' : 'Argon'
}
print(atomicDictionary)
print(type(atomicDictionary))

# Adding a unique element
#Strip basically removes white spaces if any at the beginning of the string.
symbol = input("Enter the symbol of the element").strip()
name = input("Enter the name of the element").strip()
print("The length of the dictionary is ", len(atomicDictionary))

# It searches through key basically, if not present, we can add, else it syas a;ready exists.
if symbol not in atomicDictionary:
    atomicDictionary[symbol] = name
else:
    print("The key exists in the dictionary")

print(atomicDictionary)
print("The length of the dictionary is ", len(atomicDictionary))


#Search for an element in the dictionary
search_sym = input("Enter the element symbol you want to search").strip()

#This directly searches if the key is present.
if search_sym in atomicDictionary:
    print("The symbol ",search_sym," is ",atomicDictionary[search_sym])
else:
    print("The symbol is not present in the dictionary")