import sys
def f_to_c(f):
    c = ((f-32)*5)/9
    temp_his.append((f,c))
    return c

def c_to_f(c):
    f = 1.8*c + 32
    temp_his.append((c,f))
    return f

def k_to_c(k):
    c = k - 273
    temp_his.append((k,c))
    return c

def c_to_k(c):
    k = c + 273
    temp_his.append((c,k))
    return k

def f_to_k(f):
    c = f_to_c(f)
    k = c_to_k(c)
    temp_his.append((f,k))
    return k

def k_to_f(k):
    c = k_to_c(k)
    f = c_to_f(c)
    temp_his.append((k,f))
    return f


temp_his = []
while True:
    print("1. F to C")
    print("2. C to F")
    print("3. K to C")
    print("4. C to K")
    print("5. F to K")
    print("6. K to F")
    print("7. History")
    print("8. Exit")

    ch = input()
    if ch == "1":
        print("\nEnter temperature:\t")
        f = float(input())
        ans = f_to_c(f)
        print("The result is ",ans)
    

    elif ch == "2":
        print("\nEnter temperature:\t")
        c = float(input())
        ans = c_to_f(c)
        print("The result is ",ans)

    
    elif ch == "3":
        print("\nEnter temperature:\t")
        k = float(input())
        ans = k_to_c(k)
        print("The result is ",ans)


    elif ch == "4":
        print("\nEnter temperature:\t")
        c = float(input())
        ans = c_to_k(c)
        print("The result is ",ans)


    elif ch == "5":
        print("\nEnter temperature:\t")
        f = float(input())
        ans = f_to_k(f)
        print("The result is ",ans)


    elif ch == "6":
        print("\nEnter temperature:\t")
        k = float(input())
        ans = k_to_f(k)
        print("The result is ",ans)


    elif ch == "7":
        print("Press 1 if you want the result sorted according to given value and 2 if according to answer")
        ch1 = input()
        if ch1 == "1":
            result_his = sorted(temp_his,key=lambda x:x[0])
            print("Result sorted acc to given values")
            for i in result_his:
                print(i[0],"------->",i[1])
        elif ch1 == "2":
            print("result sorted acc to answer values")
            result_his = sorted(temp_his,key=lambda x:x[1])
            for i in result_his:
                print(i[0],"------->",i[1])
        else:
            print("Invalid choice")

    else:
        print("Goodbye!")
        sys.exit()