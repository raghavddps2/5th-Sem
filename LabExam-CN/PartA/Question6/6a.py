import matplotlib.pyplot as plt
x = [0.01,0.02,0.03,0.04,0.05]
y = [74693,73903,73354,73016,72725]
plt.title("Error rate vs throughput CBR")
plt.xlabel("Error rate %")
plt.ylabel("Throughput(bps)")
plt.plot(x,y)
plt.show()