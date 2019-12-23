import matplotlib.pyplot as plt
x = [100,200,300,400,500]
y = [4058,4173,4273,4386,4439]
plt.title("BANDWIDTH Vs Packets sent - UDP")
plt.xlabel("Bandwidth")
plt.ylabel("Packets sent")
plt.plot(x,y)
plt.show()