import matplotlib.pyplot as plt
x = [100,200,300,400,500,900]
y = [17223,372320,570266,770293,969280,1759680]
plt.title(" Bandwidth v/s Throughput - FTP")
plt.xlabel("Bandwidth - Kbps")
plt.ylabel("Throughput - Bps") #Bits sent per sec as throughput.
plt.plot(x,y)
plt.show()