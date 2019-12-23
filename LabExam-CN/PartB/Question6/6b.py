import matplotlib.pyplot as plt
x = [0.01,0.02,0.03,0.04,0.05]
y = [27933,23923,21082,16322,12436]
plt.title("Error rate vs throughput FTP")
plt.xlabel("Error rate %")
plt.ylabel("Throughput(bps)")
plt.plot(x,y)
plt.show()