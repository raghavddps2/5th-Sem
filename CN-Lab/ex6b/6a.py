import matplotlib.pyplot as plt
x = [0.00,0.01,0.02,0.03,0.04,0.05]
y = [37714,28160,24117,21254,16455,12537]
plt.title(" Error rate v/s Throughput - FTP")
plt.xlabel("Error rate %")
plt.ylabel("Throughput (Bytes per sec)")
plt.plot(x,y)
plt.show()