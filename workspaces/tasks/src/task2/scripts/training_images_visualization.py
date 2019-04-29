import scipy.io as sio
import numpy as np
import matplotlib.pyplot as plt

A = sio.loadmat('training_images.mat')['data']
img1 = np.reshape(A[0, :], [480, 640, 3])
plt.imshow(img1)
plt.show()

