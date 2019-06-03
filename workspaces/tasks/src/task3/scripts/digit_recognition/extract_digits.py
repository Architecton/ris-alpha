#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from task3.srv import DigitDetector
from cv_bridge import CvBridge
from std_msgs.msg import ColorRGBA
from collections import defaultdict
import pytesseract


dictm = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_6X6_250)

# The object that we will pass to the markerDetect function
params =  cv2.aruco.DetectorParameters_create()

print(params.adaptiveThreshConstant) 
print(params.adaptiveThreshWinSizeMax)
print(params.adaptiveThreshWinSizeMin)
print(params.minCornerDistanceRate)
print(params.adaptiveThreshWinSizeStep)

# To see description of the parameters
# https://docs.opencv.org/3.3.1/d1/dcd/structcv_1_1aruco_1_1DetectorParameters.html

# You can set these parameters to get better marker detections
params.adaptiveThreshConstant = 10
adaptiveThreshWinSizeStep = 2

class The_Digit:
    def __init__(self):

        # Init service
        rospy.init_node('digit_detector_server')

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # Subscribe to the RGB image topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # Set flag
        self.flg = 0

        # Set urls dictionary
        self.digits = defaultdict(int)

        s = rospy.Service('digit_detector', DigitDetector, self.toggle_output)

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
            image_size=(351,248,3)
            marker_side=50

            img_out = np.zeros(image_size, np.uint8)
            out_pts = np.array([[marker_side/2,img_out.shape[0]-marker_side/2],
                                [img_out.shape[1]-marker_side/2,img_out.shape[0]-marker_side/2],
                                [marker_side/2,marker_side/2],
                                [img_out.shape[1]-marker_side/2,marker_side/2]])

            src_points = np.zeros((4,2))
            cens_mars = np.zeros((4,2))

            if not ids is None:
                if len(ids)==4:
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
                    img_out = img_out[125:221,50:195,:]
                    
                    # Convert the image to grayscale
                    img_out = cv2.cvtColor(img_out, cv2.COLOR_BGR2GRAY)
                    
                    # Option 1 - use ordinairy threshold the image to get a black and white image
                    #ret,img_out = cv2.threshold(img_out,100,255,0)

                    # Option 1 - use adaptive thresholding
                    img_out = cv2.adaptiveThreshold(img_out,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY,11,5)
                    
                    # Use Otsu's thresholding
                    #ret,img_out = cv2.threshold(img_out,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
                    
                    # Pass some options to tesseract
                    config = '--psm 13 outputbase nobatch digits'
                    
                    # Visualize the image we are passing to Tesseract
                    # cv2.imshow('Warped image',img_out)
                    # cv2.waitKey(1)
            
                    # Extract text from image
                    text = pytesseract.image_to_string(img_out, config = config)
                    
                    # Check and extract data from text
                    # print('Extracted>>',text)
                    
                    # Remove any whitespaces from the left and right
                    text = text.strip()
                    
                    # If the extracted text is of the right length
                    if len(text)==2:
                        if (text[0].isdigit() and text[1].isdigit()):
                            # x=int(text[0])
                            # y=int(text[1])
                            self.digits[text] += 1

                            # print('The extracted datapoints are x=%d, y=%d' % (x,y))
                    # else:
                    #     print('The extracted text has is of length %d. Aborting processing' % len(text))

            # DEVONLY: Visualize camera output
            # cv2.imshow('Live feed', img_original)
            # cv2.waitKey(1)

    def toggle_output(self, req):
        self.flg = req.flg

        if (req.flg == 0):
            if(len(self.digits) > 0):
                text = max(self.digits, key=self.digits.get)
                return np.array([int(text[0]), int(text[1])])
            else:
                return []    
        elif (req.flg == 1):
            self.digits = defaultdict(int)
            return []
                

def main():

    digit_service = The_Digit()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()