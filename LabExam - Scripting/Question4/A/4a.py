class Rectangle:
    _count = 0
    #Defining the constructor.
    def __init__(self,length,breadth):
        
        Rectangle._count += 1
        self.length = length
        self.breadth = breadth
    
    def Area(self):
        self.answer = self.length * self.breadth
        return self.answer


rect1 = Rectangle(10,20)
print(rect1.Area())

rect2 = Rectangle(10,30)
print(rect2.Area())

rect3 = Rectangle(15,20)
print(rect3.Area())

rect4 = Rectangle(5,20)
print(rect4.Area())

print(dir(Rectangle))
print(dir(rect1))
print(Rectangle._count) #THe count here is the class variable, and helps us to keep a count of the object.