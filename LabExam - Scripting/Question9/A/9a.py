class Student:

    count = 0
    name = ""
    age = ""
    marks = []

    def __init__(self):
        Student.count += 1
        print("Object created and count: ", Student.count)
        # self.acceptDetails()

    def acceptDetails(self):
        print("\nEnter the name of the student: ",end=" ")
        self.name = input()
        print("\nEnter the age of the student: ",end=" ")
        self.age = int(input())
        print("\nEnter marks in three subjects separated by space")
        arr = list(map(int,input().split(" ")))
        self.marks = arr

    def display(self):
        print("The name of the student is ", self.name)
        print("The age of the student is ",self.age)
        print("The marks in subject1 is ",self.marks[0])
        print("The marks in subject2 is ",self.marks[1])
        print("The marks in subject3 is ",self.marks[2])

s1 = Student()
s2 = Student()

s1.acceptDetails()
s2.acceptDetails()

s1.display()
s2.display()