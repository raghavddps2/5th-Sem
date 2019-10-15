def f_to_c():
    f = int(input("Enter in fahrenheit"))
    c = ((f-32)*5)/9
    print("The temp in celcius is: ", c)

def c_to_f():
    c = int(input("Enter in celcius"))
    f = (9*c)/5 + 32
    print("The temp in fahrenheit is: ", f)

def k_to_c():
    k = int(input("Enter in kelvin"))
    c = k-273
    print("The temp in celcius is: ", c)

def c_to_k():
    c = int(input("Enter in celcius"))
    k = 273 + c
    print("The temp in kelvin is: ", k)

tup = ((1,'fahrenheit','celcius'),(2,'celcius','fahreheit'),(3,'kelvin','celcius'),(4,'celius','kelvin'))
while(True):
    print(tup)
    ch = int(input("Enter choice"))

    if ch == 1:
        f_to_c()
    elif ch == 2:
        c_to_f()
    elif ch == 3:
        k_to_c()
    elif ch == 4:
        c_to_k()
    else:
        print("Invalid choice")
    
    c = input("Continue? (y/n)")
    if c == 'n':
        break