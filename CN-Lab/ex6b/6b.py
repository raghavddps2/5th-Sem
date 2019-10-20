import matplotlib.pyplot as plt
x = [0.00,0.01,0.02,0.03,0.04,0.05]
y = [74678,74453,73665,73118,72781,72491]
plt.title(" Error rate v/s Throughput - CBR")
plt.xlabel("Error rate %")
plt.ylabel("Throughput (Bytes per sec)")
plt.plot(x,y)
plt.show()