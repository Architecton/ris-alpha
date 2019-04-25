#!/usr/bin/env python

import rospy
import cv2
import numpy as np

import pdb

from cv2 import convertScaleAbs

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
#from task2.msg import RingData
from task2.msg import ApproachImageFeedback

class Toroid:
    def __init__(self):
        rospy.init_node('toroid_detector', anonymous=True)

        self.bridge = CvBridge()

        # Subscribe to the depth image topic
        self.depth_sub = rospy.Subscriber("camera/depth/image_raw", Image, self.depth_callback)

        # Subscribe to the RGB image topic
        #self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # Add toroid publisher
        #self.toroid_pub = rospy.Publisher('toroids', RingData, queue_size=1000)
        self.toroid_pub = rospy.Publisher('toroids', ApproachImageFeedback, queue_size=1000) 
        # Max depth of scanning the depth in meters

        # TODO: Initialize search boundaries for the ellipses and their centres
        self.upp_bnd_elps = 0 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.low_bnd_elps = 480 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.upp_bnd_ctr = 0 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps
        self.low_bnd_ctr = 480 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps

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

        # Set all depths greater than MAX_DPT and smaller than MIN_DPT to 0
        depth_img = np.uint8(np.logical_and(depth_img < self.MAX_DPT, depth_img > self.MIN_DPT))

        # Perform closing operation
        kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (22, 22))
        depth_img = cv2.morphologyEx(depth_img, cv2.MORPH_CLOSE, kernel)

        # Extract the edge
        kernel = cv2.getStructuringElement(cv2.MORPH_CROSS, (3, 3))
        eroded_img = cv2.erode(depth_img, kernel, iterations=1)
        depth_img = depth_img - eroded_img

        # Extract contours
        _, contours, _ = cv2.findContours(depth_img, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        # Fit elipses to all extracted contours
        elps = []
        for cnt in contours:
            # Threshold for size of ellipses (number of pixels in contour)
            if cnt.shape[0] >= 80:
                # Checking whether the ellipse centre is within the search boundaries
                x,y,w,h = cv2.boundingRect(cnt)

                if(y+h/2 >= self.upp_bnd_ctr and y+h/2 <= self.low_bnd_ctr):
                    ellipse = cv2.fitEllipse(cnt)
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
                
                    if ((is_unique or len(candidates) == 0) and (1.2 < max(e1[1][0]/e2[1][0], e2[1][0]/e1[1][0]) < 1.5)):
                        candidates.append((e1,e2))                              

        # Build an array of detected Rings
        #rd = RingData()
        rd = ApproachImageFeedback()
        found = 0

        for c in candidates:

            # candidate structure: Box2D
            # ((center_x, center_y), (width, height), angle)

            e1 = c[0]
            e2 = c[1]

            if (e1[1][0] > e2[1][0] and e1[1][1] > e2[1][1]):
                outer_elp = e1
            else:
                outer_elp = e2     

            # DEVONLY: Draw the detections
            cv2.ellipse(depth_img[self.upp_bnd_elps:self.low_bnd_elps, 0:len(depth_img)], e1, (0, 255, 0), 2)
            cv2.ellipse(depth_img[self.upp_bnd_elps:self.low_bnd_elps, 0:len(depth_img)], e2, (0, 255, 0), 2)

            # DEVONLY: Drawing center
            # cv2.line(depth_img, (int(e1[0][0]), int(e1[0][1])), (int(e1[0][0]), int(e1[0][1])), (0, 0, 255), 10)

            # Set toroid data
            rd.center_x = outer_elp[0][0]
            rd.center_y = outer_elp[0][1]
            # rd.minor_axis = np.min(outer_elp[1])
            # rd.major_axis = np.max(outer_elp[1])
            # rd.im = np.ravel(self.bgr_img)

            found = 1
  
        if (found == 1):
            self.toroid_pub.publish(rd)

        # DEVONLY: Visualize camera output
        cv2.imshow('Live feed', depth_img)
        cv2.waitKey(1)


def main():

    toroid_finder = Toroid()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()

def test():
    depth_img = np.loadtxt('ime_fajla.txt')

    # Set all depths greater than MAX_DPT and smaller than MIN_DPT to 0
    depth_img = np.uint8(np.logical_and(depth_img < 1500.0, depth_img > 600.0))

    # Perform closing operation
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (22, 22))
    depth_img = cv2.morphologyEx(depth_img, cv2.MORPH_CLOSE, kernel)

    # Extract the edge
    kernel = cv2.getStructuringElement(cv2.MORPH_CROSS, (3, 3))
    eroded_img = cv2.erode(depth_img, kernel, iterations=1)
    depth_img = depth_img - eroded_img

    # DEVONLY: Visualize camera output
    cv2.imshow('Live feed', depth_img*255)
    cv2.waitKey(0)

    # Extract contours
    _, contours, _ = cv2.findContours(depth_img, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

    # Fit elipses to all extracted contours
    elps = []
    for cnt in contours:
        # Threshold for size of ellipses (number of pixels in contour)
        if cnt.shape[0] >= 80:
            # Checking whether the ellipse centre is within the search boundaries
            x,y,w,h = cv2.boundingRect(cnt)

            if(y+h/2 >= 0 and y+h/2 <= 480):
                ellipse = cv2.fitEllipse(cnt)
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
            
                if ((is_unique or len(candidates) == 0) and (1.2 < max(e1[1][0]/e2[1][0], e2[1][0]/e1[1][0]) < 1.5)):
                    candidates.append((e1,e2))      

    rd = ApproachImageFeedback()
    found = 0

    for c in candidates:

        # candidate structure: Box2D
        # ((center_x, center_y), (width, height), angle)

        depth_img.fill(1)

        e1 = c[0]
        e2 = c[1]

        if (e1[1][0] > e2[1][0] and e1[1][1] > e2[1][1]):
            outer_elp = e1
        else:
            outer_elp = e2     

        # DEVONLY: Draw the detections
        cv2.ellipse(depth_img[0:480, 0:len(depth_img)], e1, (0, 255, 0), 2)
        cv2.ellipse(depth_img[0:480, 0:len(depth_img)], e2, (0, 255, 0), 2)

        # DEVONLY: Drawing center
        # cv2.line(depth_img, (int(e1[0][0]), int(e1[0][1])), (int(e1[0][0]), int(e1[0][1])), (0, 0, 255), 10)

        # Set toroid data
        rd.center_x = outer_elp[0][0]
        rd.center_y = outer_elp[0][1]
        # rd.minor_axis = np.min(outer_elp[1])
        # rd.major_axis = np.max(outer_elp[1])
        # rd.im = np.ravel(self.bgr_img)

        found = 1

    print len(candidates)    

    # DEVONLY: Visualize camera output
    cv2.imshow('Live feed', depth_img*255)
    cv2.waitKey(0)                    



if __name__ == '__main__':
    # main()
    test()
