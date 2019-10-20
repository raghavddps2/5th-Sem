import matplotlib.pyplot as plt
x = [100,200,300,400,500,900]
y = [39866,38480,40560,40213,39520,38826]
plt.title(" Bandwidth v/s Throughput - TELNET")
plt.xlabel("Bandwidth - Kbps") 
plt.ylabel("Throughput - Bps") #Bits sent per sec as throughput.
plt.plot(x,y)
plt.show()