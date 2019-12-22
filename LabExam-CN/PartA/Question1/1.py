import matplotlib.pyplot as plt
x = [0.1,0.2,0.3,0.4,0.5,1.0]
y = [619,526,433,248,210,0]
plt.title("Bandwidth v/s packets dropped")
plt.xlabel("Bandwidth")
plt.ylabel("Packets Dropped")
plt.plot(x,y)
plt.show()

