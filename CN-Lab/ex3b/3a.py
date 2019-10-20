import matplotlib.pyplot as plt
x = [100,200,300,400,500,900]
y = [21,21,23,21,23,23]
plt.title(" Bandwidth v/s Packets dropped -TCP")
plt.xlabel("Bandwidth")
plt.ylabel("Packets Dropped")
plt.plot(x,y)
plt.show()