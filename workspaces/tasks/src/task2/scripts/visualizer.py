#!/usr/bin/env python

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class Visualizer:
    def __init__(self):
        rospy.init_node('visualizer', anonymous=True)

        self.bridge = CvBridge()

        # Subscribe to the depth image topic
        self.depth_sub = rospy.Subscriber("/camera/depth/image_raw", Image, self.depth_callback)

        # Subscribe to the RGB image topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        self.dctr = 0;
        self.ictr = 0;

    def depth_callback(self, data):

    	try:
            depth_img = self.bridge.imgmsg_to_cv2(data)
        except CvBridgeError as e:
            print(e)

        self.dctr += 1
        print "depth counter: %d".format(self.dctr)

        #cv2.namedWindow('Depth image')
        #cv2.imshow('Depth image', depth_img)


    def image_callback(self, data):

        try:
            bgr_img = self.bridge.imgmsg_to_cv2(data)
        except CvBridgeError as e:
            print(e)

        self.ictr += 1    
        print "image counter: %d".format(self.ictr)

        # cv2.namedWindow('BGR image')
        # cv2.imshow('BGR image', bgr_img)     
        # cv2.waitKey(1)


def main():

    visualizer = Visualizer()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
