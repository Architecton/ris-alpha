#!/usr/bin/env python
from __future__ import print_function

import roslib
# roslib.load_manifest('exercise4')
import sys
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from std_msgs.msg import ColorRGBA
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
params.adaptiveThreshConstant = 25
adaptiveThreshWinSizeStep = 2


class The_Rectifier:
    def __init__(self):
        rospy.init_node('image_converter', anonymous=True)

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # Subscribe to the image and/or depth topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_color", Image, self.image_callback)

    def image_callback(self,data):
        # print('Iam here!')

        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        # Set the dimensions of the image
        self.dims = cv_image.shape

        # Tranform image to gayscale
        gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)

        # Do histogram equlization
        img = cv2.equalizeHist(gray)

        # Binarize the image
        ret, thresh = cv2.threshold(img, 50, 255, 0)

        # Extract contours
        _, contours, hierarchy = cv2.findContours(thresh, 2, 2)

        # Example how to draw the contours
        # cv2.drawContours(img, contours, -1, (255, 0, 0), 3)

        # Fit elipses to all extracted contours
        elps = []
        for cnt in contours:
            #     print cnt
            #     print cnt.shape
            if cnt.shape[0] >= 40:
                ellipse = cv2.fitEllipse(cnt)
                elps.append(ellipse)


        # Find two elipses with same centers
        candidates = []
        for n in range(len(elps)):
            for m in range(n + 1, len(elps)):
                e1 = elps[n]
                e2 = elps[m]
                dist = np.sqrt(((e1[0][0] - e2[0][0]) ** 2 + (e1[0][1] - e2[0][1]) ** 2))
                #             print dist
                if dist < 5:
                    candidates.append((e1,e2))
                    
                    
        ###########################################
        #### THIS IS THE CODE THAT IT IS RELEVANT TO YOU
        #### IT SHOULD BE INCLUDED IN YOUR OWN FUNCTION FOR RING DETECTION
        ###########################################
        
        if len(candidates)==1:
            print('Ring detected! (hopefully)')
            corners, ids, rejected_corners = cv2.aruco.detectMarkers(cv_image,dictm,parameters=params)
            
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
                    print('4 Markers detected')
            
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
                    img_out = cv2.warpPerspective(cv_image, h, (img_out.shape[1],img_out.shape[0]))
                    
                    ################################################
                    #### Extraction of digits starts here
                    ################################################
                    
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
                    cv2.imshow('Warped image',img_out)
                    cv2.waitKey(1)
            
                    # Extract text from image
                    text = pytesseract.image_to_string(img_out, config = config)
                    
                    # Check and extract data from text
                    print('Extracted>>',text)
                    
                    # Remove any whitespaces from the left and right
                    text = text.strip()
                    
                    # If the extracted text is of the right length
                    if len(text)==2:
                        x=int(text[0])
                        y=int(text[1])
                        print('The extracted datapoints are x=%d, y=%d' % (x,y))
                    else:
                        print('The extracted text has is of length %d. Aborting processing' % len(text))
                    
                else:
                    print('The number of markers is not ok:',len(ids))
            else:
                 print('No markers found')
            
        elif len(candidates)==0:
            print('No contours detected')
        else:
            print('Some contours detected, not sure if it is a ring',len(candidates))
            for elps in candidates:
                e1 = elps[0]
                e2 = elps[0]
                cv2.ellipse(cv_image,e1,(0,255,0),3)
                cv2.ellipse(cv_image,e2,(0,255,0),3)
            #cv2.imshow('Image',cv_image)
            #cv2.waitKey(1)


def main(args):

    ring_rectifier = The_Rectifier()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main(sys.argv)
