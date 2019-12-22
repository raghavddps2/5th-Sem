import matplotlib.pyplot as plt
x = [100,200,300,400,500]
y = [87,92,165,185,335]
plt.title("BANDWIDTH Vs Packets sent - TCP")
plt.xlabel("Bandwidth")
plt.ylabel("Packets sent")
plt.plot(x,y)
plt.show()