#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from task3.srv import MapDetector
from task3.srv import TreasureLocator
from task3.msg import TreasureLocatorResponse
from cv_bridge import CvBridge
from std_msgs.msg import ColorRGBA
from collections import defaultdict
import pytesseract


dictm = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_6X6_250)

# The object that we will pass to the markerDetect function
params =  cv2.aruco.DetectorParameters_create()

params.adaptiveThreshConstant = 10
adaptiveThreshWinSizeStep = 2

class The_Map:
    def __init__(self):

        # Init service
        rospy.init_node('map_detector_server')

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # Subscribe to the RGB image topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # Set flag
        self.flg = 0

        # Set urls dictionary
        #self.digits = defaultdict(int)

        self.points = [];


        self.point = {'x': 0.0, 'y': 0.0}

        s = rospy.Service('map_detector', MapDetector, self.toggle_output)

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

                    #height,width = img_out.shape
                    #mask = np.zeros((height,width), np.uint8)
                    #cv2.circle(mask,(i[0],i[1]),i[2],(255,255,255),thickness=-1)
                    
                    #print(img_out.shape)

                    img_out = img_out[60:290,:,:]

                    


                    #cv2.imshow('Live feed', img_out)
                    #cv2.waitKey(1)

                    img_map_gray = cv2.cvtColor(img_out, cv2.COLOR_BGR2GRAY)
                    ret_val, img_map_binary = cv2.threshold(img_map_gray,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
                    #img_map_binary = toMapColors(img_map_binary)

                    #cv2.imshow('Live feed', img_map_binary)
                    #cv2.waitKey(1)

                    #print(img_map_binary.shape)

                    height,width = img_map_binary.shape
                    
                    mask = np.zeros((height,width), np.uint8)
                    cv2.circle(mask,(125,115),85,(255,255,255),thickness=-1)
                    masked_data = cv2.bitwise_and(img_map_binary, img_map_binary, mask=mask)

                    mask1 = np.ones((height,width), np.uint8)*255
                    cv2.circle(mask1,(125,115),85,(0,0,0),thickness=-1)
                    img_map_binary = cv2.bitwise_or(masked_data, mask1)

                    """
                    for i in range(0, img_map_binary.shape[0]):
                        for j in range(0, img_map_binary.shape[1]):
                            if img_map_binary[i, j] == 0:
                                img_map_binary[i, j] = 100
                            if img_map_binary[i, j] == 255:
                                img_map_binary[i, j] = 0
                    """

                    #image = image.astype('uint8')

                    """
                    nb_components, output, stats, centroids = cv2.connectedComponentsWithStats(img_map_binary, connectivity=4)
                    sizes = stats[:, -1]

                    max_label = 1
                    max_size = sizes[1]
                    for i in range(2, nb_components):
                        if sizes[i] > max_size:
                            max_label = i
                            max_size = sizes[i]
                    
                    img_map_binary[output == max_label] = 0

                    for i in range(0, img_map_binary.shape[0]):
                        for j in range(0, img_map_binary.shape[1]):
                            if img_map_binary[i, j] == 0:
                                img_map_binary[i, j] = 255
                            if img_map_binary[i, j] == 100:
                                img_map_binary[i, j] = 0
                    """
            

                    img_out = cv2.cvtColor(img_map_binary, cv2.COLOR_GRAY2BGR)

                    """
                    cv2.imshow('Live feed', img_map_binary)
                    cv2.waitKey(1)
                    """

                    img = self.bridge.cv2_to_imgmsg(img_out, "bgr8")

                    rospy.wait_for_service('treasure_locator')
                    try:
                        serv = rospy.ServiceProxy('treasure_locator', TreasureLocator) 
                        ret = serv(img)
                        #print(ret)
                        
                        #self.point['x'] = ret.treasure_x
                        #self.point['y'] = ret.treasure_y

                        self.points.append((ret.treasure_x, ret.treasure_y))

                    except rospy.ServiceException, e:
                        print("Service error: {0}".format(e.message))

    def toggle_output(self, req):
        self.flg = req.flg

        if (req.flg == 1):
            self.points = [];

            return -999, -999

        elif (req.flg == 0):

            if len(self.points) == 0:
                return -999, -999

            points_np = np.array(self.points)

            ind = np.lexsort((points_np[:,1],points_np[:,0]))

            points_sorted = points_np[ind]

            #print(points_sorted)

            self.point = points_sorted[len(points_sorted)/2]

            return self.point[0], self.point[1]
                

def main():

    map_service = The_Map()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
