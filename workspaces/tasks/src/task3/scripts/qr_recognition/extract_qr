#!/usr/bin/env python

import rospy
import cv2
import numpy as np
import pyzbar.pyzbar as pyzbar
from sensor_msgs.msg import Image
from task3.srv import QRDetector
from cv_bridge import CvBridge, CvBridgeError
from collections import defaultdict

class The_QR:
    def __init__(self):

        # Init service
        rospy.init_node('qr_detector_server')

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # Subscribe to the RGB image topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # Set flag
        self.flg = 0

        # Set urls dictionary
        self.urls = defaultdict(int)

        s = rospy.Service('qr_detector', QRDetector, self.toggle_output)

    def image_callback(self,data):

        if self.flg == 1:

            try:
                img = self.bridge.imgmsg_to_cv2(data, "bgr8")
            except CvBridgeError as e:
                print(e)

            # Load image
            img_original = img.copy()

            # Find a QR code in the image
            decodedObjects = pyzbar.decode(img_original)

            if len(decodedObjects) == 1:
                dObject = decodedObjects[0]
                
                # If it is a QR code, we get a vector of 4 points
                # If there are more points, we need to draw a convex hull which is the outer boundary of the barcode

                # Increase the counter in the corresponding url
                self.urls[dObject.data] += 1

                # Visualize the detected QR code in the image
                points  = dObject.polygon
                if len(points) > 4 : 
                    hull = cv2.convexHull(np.array([point for point in points], dtype=np.float32))
                    hull = list(map(tuple, np.squeeze(hull)))
                else : 
                    hull = points;
                 
                ## Number of points in the convex hull
                n = len(hull)
             
                ## Draw the convext hull
                for j in range(0,n):
                    cv2.line(img_original, hull[j], hull[ (j+1) % n], (0,255,0), 2)

            # DEVONLY: Visualize camera output
            cv2.imshow('Live feed', img_original)
            cv2.waitKey(1)

    def toggle_output(self, req):
        self.flg = req.flg

        if (req.flg == 0):
            if(len(self.urls) > 0):
                print(self.urls)
                return max(self.urls, key=self.urls.get)
            else:
                return ""    
        elif (req.flg == 1):
            self.urls = defaultdict(int)
            return ""
                

def main():

    qr_service = The_QR()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()


### Flag 0 -> 1
# Start collecting the readings to a list ex.: "vicosString": 8, "wrongString": 1
### Flag 1 -> 0
# Publish the string with most readings and clear the list


# 18 detections: bilateral (rectified)
# 23 detections: nothing (rectified)
# 46 detections: nothing (non-rectified)
# x detections: binary (rectified)


# (25, 2): 130 markers
# (8, 4): 136 markers
# (14, 2): 137 markers
# (10, 2): 140 markers