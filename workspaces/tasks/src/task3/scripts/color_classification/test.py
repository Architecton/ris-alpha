from matplotlib import pyplot as plt
import numpy as np
import time

I = np.load('burek.npy')
plt.ion()
time.sleep(1)
plt.imshow(I)
plt.show()
plt.pause(0.01)
time.sleep(1)
plt.clf()
plt.pause(1)
plt.imshow(I)
plt.show()
plt.pause(0.01)
time.sleep(1)
plt.clf()
