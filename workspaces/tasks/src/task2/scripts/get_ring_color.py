#!/usr/bin/env python

import rospy
from task2.srv import GetRingColor

from colour_detector import ColourDetector
from joblib import load

import numpy as np
import cv2

classifier = None
cDetector = None

def req_handler(req):
    global cDetector
    global classifier

    start = req.start

    if start:
        cDetector.subscribe()

    else:
        color = cDetector.get_ring_color()
        print color 

        return color

    return -1

def get_ring_color_server():
    global cDetector
    global classifier

    rospy.init_node('get_ring_color_server')

    classifier = load('ring_colour_classifier.joblib')
    cDetector = ColourDetector(classifier, 100)

    rospy.Service('get_ring_color', GetRingColor, req_handler)

    rospy.spin()

if __name__ == '__main__':
    get_ring_color_server()