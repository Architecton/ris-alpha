#!/usr/bin/env python

import cv2
import numpy as np
from matplotlib import pyplot as plt

# Load image
img = cv2.imread('../imgs/live_err3.png', 1)
img_original = img.copy()

# Tranform image to grayscale
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Show grayscale image
cv2.imshow("Image window", img)
cv2.waitKey(0)

# Automatic parameter computation
#sigma = 0.33
#v = np.median(img)
#lower = int(max(0, (1.0 - sigma) * v))
#upper = int(min(255, (1.0 + sigma) * v))

upper, _ = cv2.threshold(img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
lower = 0.5 * upper

print("lower: {0}".format(lower))
print("upper: {0}".format(upper))

# Find edges with canny
edges = cv2.Canny(img, lower, upper)

# Show edges
cv2.imshow("Image window", edges)
cv2.waitKey(0)

# Extract contours
img2, contours, hierarchy = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

# Draw contours
cv2.drawContours(img_original, contours, -1, (255, 0, 0), 3)

# Show contours
cv2.imshow("Image window", img_original)
cv2.waitKey(0)

# Fit elipses to all extracted contours
elps = []
for cnt in contours:
    # Threshold for size of ellipses (number of pixels in contour)
    if cnt.shape[0] >= 50:
        # Checking contour ratio
        x,y,w,h = cv2.boundingRect(cnt)
        aspect_ratio = min(float(w)/h, float(h)/w)

        if(aspect_ratio > 0.9):
            ellipse = cv2.fitEllipse(cnt)
            elps.append(ellipse)
            cv2.ellipse(img, ellipse, (0, 255, 0))
            print(aspect_ratio)

cv2.imshow("Image window", img)
cv2.waitKey()

# Find two elipses with same centers
candidates = []
for n in range(len(elps)):
    for m in range(n + 1, len(elps)):
        e1 = elps[n]
        e2 = elps[m]
        dist = np.sqrt(((e1[0][0] - e2[0][0]) ** 2 + (e1[0][1] - e2[0][1]) ** 2))
        # print dist
        if dist < 5:
            candidates.append((e1,e2))


# Preparing to extract the depth from the image
for c in candidates:

    e1 = c[0]
    e2 = c[1]

    # Draw the detections
    cv2.ellipse(img_original, e1, (0, 255, 0), 2)
    cv2.ellipse(img_original, e2, (0, 255, 0), 2)

    size = (e1[1][0]+e1[1][1])/2
    center = (e1[0][1], e1[0][0])

    x1 = int(center[0] - size / 2)
    x2 = int(center[0] + size / 2)
    x_min = x1 if x1>0 else 0
    x_max = x2 if x2<img.shape[0] else img.shape[0]

    y1 = int(center[1] - size / 2)
    y2 = int(center[1] + size / 2)
    y_min = y1 if y1 > 0 else 0
    y_max = y2 if y2 < img.shape[1] else img.shape[1]

    ### Here is the code for looking in the depth image


cv2.imshow("Image window", img_original)
cv2.waitKey(0)

cv2.destroyAllWindows()