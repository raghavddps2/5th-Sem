import matplotlib.pyplot as plt
x = [0.1,0.2,0.3,0.4,0.5,1.0]
y = [308,264,220,176,132,0]
plt.title(" Bandwidth v/s Packets dropped ")
plt.xlabel("Bandwidth")
plt.ylabel("Packets Dropped")
plt.plot(x,y)
plt.show()