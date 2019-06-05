#!/usr/bin/env python

import rospy
from task3.srv import TreasureLocator
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

import numpy as np
import cv2
import matplotlib.pyplot as plt

def treasure_locator_tester():
    bridge = CvBridge()

    img_cv = cv2.imread('/home/miha/test_images/test2.jpg')

    #print img_cv

    #plt.figure()
    #plt.imshow(img_cv, cmap="gray")
    #plt.show()

    img = bridge.cv2_to_imgmsg(img_cv, "bgr8")

    rospy.wait_for_service('treasure_locator')
    try:
        serv = rospy.ServiceProxy('treasure_locator', TreasureLocator) 
        ret = serv(img)
        print ret
        return ret
    except rospy.ServiceException, e:
        print "Service error: {0}".format(e.message)

if __name__ == "__main__":  
    treasure_locator_tester()