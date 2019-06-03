#!/usr/bin/env python

import rospy
import cv2
import numpy as np
import pyzbar.pyzbar as pyzbar
from sensor_msgs.msg import Image
from task3.srv import QRDetector
from cv_bridge import CvBridge, CvBridgeError
from collections import defaultdict

dictm = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_6X6_250)

# The object that we will pass to the markerDetect function
params =  cv2.aruco.DetectorParameters_create()

# print(params.adaptiveThreshConstant) 
# print(params.adaptiveThreshWinSizeMax)
# print(params.adaptiveThreshWinSizeMin)
# print(params.minCornerDistanceRate)
# print(params.adaptiveThreshWinSizeStep)

# To see description of the parameters
# https://docs.opencv.org/3.3.1/d1/dcd/structcv_1_1aruco_1_1DetectorParameters.html

# You can set these parameters to get better marker detections
params.adaptiveThreshConstant = 10
adaptiveThreshWinSizeStep = 2

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

            # Detect AruCo markers
            corners, ids, rejected_corners = cv2.aruco.detectMarkers(img_original, dictm, parameters=params)
            
            # Increase proportionally if you want a larger image
            image_size = (351,248,3)
            marker_side = 50

            img_out = np.zeros(image_size, np.uint8)
            out_pts = np.array([[marker_side/2,img_out.shape[0]-marker_side/2],
                                [img_out.shape[1]-marker_side/2,img_out.shape[0]-marker_side/2],
                                [marker_side/2,marker_side/2],
                                [img_out.shape[1]-marker_side/2,marker_side/2]])

            src_points = np.zeros((4,2))
            cens_mars = np.zeros((4,2))

            if not ids is None:
                if len(ids) == 4:
                    # print('4 Markers detected')
            
                    for idx in ids:
                        # Calculate the center point of all markers
                        cors = np.squeeze(corners[idx[0]-1])
                        cen_mar = np.mean(cors,axis=0)
                        cens_mars[idx[0]-1]=cen_mar
                        cen_point = np.mean(cens_mars,axis=0)
                
                    for coords in cens_mars:
                        #  Map the correct source points
                        if coords[0]<cen_point[0] and coords[1]<cen_point[1]:
                            src_points[2]=coords
                        elif coords[0]<cen_point[0] and coords[1]>cen_point[1]:
                            src_points[0]=coords
                        elif coords[0]>cen_point[0] and coords[1]<cen_point[1]:
                            src_points[3]=coords
                        else:
                            src_points[1]=coords

                    h, status = cv2.findHomography(src_points, out_pts)
                    img_out = cv2.warpPerspective(img_original, h, (img_out.shape[1],img_out.shape[0]))

                    # Cut out everything but the numbers
                    img_out = img_out[110:242,57:195,:]
                    
                    # Convert the image to grayscale
                    img_out = cv2.cvtColor(img_out, cv2.COLOR_BGR2GRAY)

                    # Option 1 - use adaptive thresholding
                    img_out = cv2.adaptiveThreshold(img_out,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY,11,5)

                    # Find a QR code in the image
                    decodedObjects = pyzbar.decode(img_out)

                    if len(decodedObjects) == 1:
                        dObject = decodedObjects[0]
                        
                        # If it is a QR code, we get a vector of 4 points
                        # If there are more points, we need to draw a convex hull which is the outer boundary of the barcode

                        # Increase the counter in the corresponding url
                        self.urls[dObject.data] += 1

                        # Visualize the detected QR code in the image
                        # points  = dObject.polygon
                        # if len(points) > 4 : 
                        #     hull = cv2.convexHull(np.array([point for point in points], dtype=np.float32))
                        #     hull = list(map(tuple, np.squeeze(hull)))
                        # else : 
                        #     hull = points;
                         
                        ## Number of points in the convex hull
                        # n = len(hull)
                     
                        ## Draw the convext hull
                        # for j in range(0,n):
                        #     cv2.line(img_original, hull[j], hull[ (j+1) % n], (0,255,0), 2)

                        # DEVONLY: Visualize cropped image
                        # cv2.imshow('Warped', img_out)
                        # cv2.waitKey(1)    

                    # DEVONLY: Visualize camera output
                    # cv2.imshow('Live feed', img_original)
                    # cv2.waitKey(1)

    def toggle_output(self, req):
        self.flg = req.flg

        if (req.flg == 0):
            if(len(self.urls) > 0):
                # print(self.urls)
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

# 46 detections
# 93 detections (warped)
