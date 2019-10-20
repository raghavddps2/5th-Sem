import matplotlib.pyplot as plt
x = [100,200,300,400,500,900]
y = [1373,1193,1003,808,612,20]
plt.title(" Bandwidth v/s Packets dropped - UDP")
plt.xlabel("Bandwidth")
plt.ylabel("Packets Dropped")
plt.plot(x,y)
plt.show()