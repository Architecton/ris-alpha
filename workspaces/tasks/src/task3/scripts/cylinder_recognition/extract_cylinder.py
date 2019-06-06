#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from task3.msg import CylinderImageFeedback

class The_Cylinder:
    def __init__(self):

        # Init service
        rospy.init_node('cylinder_detector_publisher')

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # Subscribe to the RGB image topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # Add cylinder subset publisher
        self.cylinders_pub = rospy.Publisher('cylinders', CylinderImageFeedback, queue_size=1000) 

    def image_callback(self,data):

        try:
            img = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        # Load image
        img_original = img.copy()

        # Publish cylinder subset data
        cif = CylinderImageFeedback()
        cif.timestamp = data.header.stamp
        cif.dpt = -1.0
        cif.center_x = 320
        cif.center_y = 470
        # width
        cif.minor_axis = 40
        # height
        cif.major_axis = 40
        self.cylinders_pub.publish(cif)

        # DEVONLY: Visualize camera output
        # cv2.imshow('Live feed', img_original)
        # cv2.waitKey(1)

def main():

    cylinder_publisher = The_Cylinder()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()