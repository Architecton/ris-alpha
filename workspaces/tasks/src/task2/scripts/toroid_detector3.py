#!/usr/bin/env python

import rospy
import cv2
import numpy as np
import time

import pdb
from cv2 import convertScaleAbs

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from task2.msg import ApproachImageFeedback

class Toroid:
    def __init__(self):
        rospy.init_node('toroid_detector', anonymous=True)

        self.bridge = CvBridge()

        # Subscribe to the depth image topic
        self.depth_sub = rospy.Subscriber("camera/depth/image_raw", Image, self.depth_callback)

        # Add toroid publisher
        self.toroid_pub = rospy.Publisher('toroids', ApproachImageFeedback, queue_size=1000) 
        
        # Max depth of scanning the depth in meters

        # TODO: Initialize search boundaries for the ellipses and their centres
        self.upp_bnd_elps = 0 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.low_bnd_elps = 180 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.upp_bnd_ctr = 0 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps
        self.low_bnd_ctr = 180 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps

        # self.SCALING_VALUE = 10000.0
        # self.MAX_DPT = 1500.0 * 255.0/self.SCALING_VALUE
        # self.MIN_DPT = 600.0 * 255.0/self.SCALING_VALUE
        # self.bgr_img
        self.MAX_DPT = 1500.0
        self.MIN_DPT = 600.0


    # def image_callback(self, data):
    #     try:
    #         self.bgr_img = self.bridge.imgmsg_to_cv2(data)
    #     except CvBridgeError as e:
    #         print(e)

    def depth_callback(self, data):

        try:
            depth_img_original = self.bridge.imgmsg_to_cv2(data)
        except CvBridgeError as e:
            print(e)

        depth_img = depth_img_original

        depth_img_edge = np.zeros((depth_img.shape[0], depth_img.shape[1]), dtype="uint8")

        for x in range(0,6):
            # Set all depths greater than MAX_DPT and smaller than MIN_DPT to 0
            depth_img_tmp = np.uint8(np.logical_and(depth_img < (self.MAX_DPT - x * 100.0), depth_img > self.MIN_DPT))

            # Perform closing operation
            kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (13, 13))
            depth_img_tmp = cv2.morphologyEx(depth_img_tmp, cv2.MORPH_CLOSE, kernel)

            # Erode a tiny bit
            #kernel = cv2.getStructuringElement(cv2.MORPH_CROSS, (3, 3))
            #depth_img = cv2.erode(depth_img, kernel, iterations=4)

            # Extract the edge
            kernel = cv2.getStructuringElement(cv2.MORPH_CROSS, (3, 3))
            eroded_img = cv2.erode(depth_img_tmp, kernel, iterations=1)
            depth_img_edgetmp = depth_img_tmp - eroded_img
            depth_img_edge = np.uint8(np.logical_or(depth_img_edge, depth_img_edgetmp))

        # Set for future extraction of detected ring depth
        depth_img = np.uint8(np.logical_and(depth_img < self.MAX_DPT, depth_img > self.MIN_DPT))

        # Extract contours
        _, contours, _ = cv2.findContours(depth_img_edge, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        # Fit elipses to all extracted contours
        elps = []
        for cnt in contours:
            # Threshold for size of ellipses (number of pixels in contour)
            if cnt.shape[0] >= 15:
                # Checking whether the ellipse centre is within the search boundaries
                x,y,w,h = cv2.boundingRect(cnt)

                if(y+h/2 >= self.upp_bnd_ctr and y+h/2 <= self.low_bnd_ctr):
                    ellipse = cv2.fitEllipseDirect(cnt)
                    elps.append(ellipse)

        # Find two elipses with same centers
        candidates = []
        for n in range(len(elps)):
            for m in range(n + 1, len(elps)):
                e1 = elps[n]
                e2 = elps[m]
                dist = np.sqrt(((e1[0][0] - e2[0][0]) ** 2 + (e1[0][1] - e2[0][1]) ** 2))

                # Check if we detected this candidate already and the ratio between the ellipses should correspond to a ring
                is_unique = True

                if dist < 5:
                    for can in candidates:
                        dist2 = np.sqrt(((e1[0][0] - can[0][0][0]) ** 2 + (e1[0][1] - can[0][0][1]) ** 2))
                        
                        if(dist2 < 10):
                            is_unique = False
                
                    if ((is_unique or len(candidates) == 0) and (1.1 < max(e1[1][0]/e2[1][0], e2[1][0]/e1[1][0]) < 2.3)):
                        candidates.append((e1,e2))                              

        # Build an array of detected Rings
        aif = ApproachImageFeedback()
        found = 0

        # cv2.imshow('Edges', depth_img_edge*255)
        # cv2.waitKey(1)

        for c in candidates:

            # candidate structure: Box2D
            # ((center_x, center_y), (width, height), angle)

            e1 = c[0]
            e2 = c[1]

            if (e1[1][0] > e2[1][0] and e1[1][1] > e2[1][1]):
                outer_elp = e1
            else:
                outer_elp = e2  

            # DEVONLY: Visualize camera output
            x = np.uint16(round(outer_elp[0][0]))
            y = np.uint16(round(outer_elp[0][1]))
            w = np.uint16(round(outer_elp[1][0]))
            h = np.uint16(round(outer_elp[1][1]))

            # NEW >>
            depth_img_mask = np.zeros((depth_img_original.shape[0], depth_img_original.shape[1]))
            depth_img_mask[(max(y-h/2, 0)):(min(y+h/2, 480)), (max(x-w/2, 0)):(min(x+w/2, 640))] = depth_img[(max(y-h/2, 0)):(min(y+h/2, 480)), (max(x-w/2, 0)):(min(x+w/2, 640))]

            # Setting the inner part of the detected ellipse (minor axis) to 0
            # This is needed because of previous OR-ing on image edges, so we don't know which
            # interval produced the detected ellipse 
            r = min(w, h)
            y_t,x_t = np.ogrid[-y:depth_img.shape[0]-y, -x:depth_img.shape[1]-x]
            inner_mask = x_t*x_t + y_t*y_t <= r*r
            depth_img_mask[inner_mask] = 0

            depth_val_vector = depth_img_original[depth_img_mask == 1]
            depth_val_vector = depth_val_vector[np.logical_not(np.isnan(depth_val_vector))]
            # <<

            # OLD >>
            # depth_img_filtered = np.zeros((depth_img.shape[0], depth_img.shape[1]))
            # depth_img_filtered[(y-h/2):(y+h/2), (x-w/2):(x+w/2)] = depth_img[(y-h/2):(y+h/2), (x-w/2):(x+w/2)]
            # depth_img_filtered = np.ravel(depth_img_filtered)
            # depth_img_filtered = depth_img_filtered[depth_img_filtered != 0]
            # filter nan values
            # depth_img_filtered = depth_img_filtered[np.logical_not(np.isnan(depth_img_filtered))]    
            # <<

            # DEVONLY: Draw the detections
            # depth_img_edge.fill(1)
            # cv2.ellipse(depth_img_edge[self.upp_bnd_elps:self.low_bnd_elps, 0:depth_img_edge.shape[1]], e1, (0, 255, 0), 2)
            # cv2.ellipse(depth_img_edge[self.upp_bnd_elps:self.low_bnd_elps, 0:depth_img_edge.shape[1]], e2, (0, 255, 0), 2)

            # DEVONLY: Drawing center
            # cv2.line(depth_img_edge, (int(e1[0][0]), int(e1[0][1])), (int(e1[0][0]), int(e1[0][1])), (0, 0, 255), 10)

            # Set toroid data
            aif.center_x = int(np.round(outer_elp[0][0]))
            aif.center_y = int(np.round(outer_elp[0][1]))
            aif.timestamp = data.header.stamp
            #aif.minor_axis = np.min(outer_elp[1])
            aif.minor_axis = w
            #aif.major_axis = np.max(outer_elp[1])
            aif.major_axis = h
            # aif.im = np.ravel(self.bgr_img)
            aif.dpt = np.median(depth_val_vector)

            #print np.median(depth_img_filtered)

            found = 1
  
        if (found == 1):
            self.toroid_pub.publish(aif)

        # DEVONLY: Visualize camera output
        # cv2.imshow('Live feed', depth_img_edge*255)
        # cv2.waitKey(1)

def main():

    toroid_finder = Toroid()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
