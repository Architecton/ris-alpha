#!/usr/bin/env python
from __future__ import print_function

# import time

import sys
import rospy
import cv2
import numpy as np
import tf2_geometry_msgs
import tf2_ros
from sensor_msgs.msg import Image
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import PointStamped, Vector3, Pose
from cv_bridge import CvBridge, CvBridgeError
from visualization_msgs.msg import Marker, MarkerArray
from std_msgs.msg import ColorRGBA
# from std_msgs.msg import String
# TEMPORARY
from exercise5.msg import EllipseData

class The_Ring:
    def __init__(self):
        rospy.init_node('image_converter', anonymous=True)

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # A help variable for holding the dimensions of the image
        self.dims = (0, 0, 0)

        # Subscribe to the image and/or depth topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # TODO: Subscribe to depth laser
        # self.laser_sub = rospy.Subscriber("/scan", Scan, self.scan_callback)

        #self.timePic = []

        #self.timeDepth = []

        # TODO: Add ring publisher
        self.rings_pub = rospy.Publisher('rings', EllipseData, queue_size=1000)

        # 
        self.laser_sub = rospy.Subscriber("/scan", LaserScan, self.scan_callback)

        # Object we use for transforming between coordinate frames
        self.tf_buf = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buf)  

        # TEMPORARY: Save latest laser scan
        self.scan_ranges = None
        self.scan_angle_min = 0.0
        self.scan_angle_max = 0.0
        self.scan_angle_increment = 0.0      


    def image_callback(self,data):
        timestamp = rospy.Time.now().to_time()

        #t = time.time()
        #print('[{0}]: I got a new image!'.format(t))
        #self.timePic.append(t)

        #tmpArr = []
        #ix = 0
        #while ix < len(self.timePic):
        #    if(ix != 0):
        #        tmpArr.append(self.timePic[ix] - self.timePic[ix-1])
        #    ix += 1    

        #mean = float(sum(tmpArr)) / max(len(tmpArr), 1)
        #print("Avg: {0}".format(mean))        

        try:
            img = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        #cv2.imshow('Out', img)
        #cv2.waitKey(1)

        # Load image
        img_original = img.copy()

        # Tranform image to grayscale
        img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Automatic parameter computation
        sigma = 0.33
        v = np.median(img)
        lower = int(max(0, (1.0 - sigma) * v))
        upper = int(min(255, (1.0 + sigma) * v))

        #upper, _ = cv2.threshold(img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
        #lower = 0.5 * upper

        # print("lower: {0}".format(lower))
        # print("upper: {0}".format(upper))

        # Find edges with canny
        edges = cv2.Canny(img, lower, upper)

        # Extract contours
        img2, contours, hierarchy = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        # Draw contours
        cv2.drawContours(img_original, contours, -1, (255, 0, 0), 3)

        # Fit elipses to all extracted contours
        elps = []
        for cnt in contours:
            # Threshold for size of ellipses (number of pixels in contour)
            if cnt.shape[0] >= 50:
                # Checking contour ratio
                x,y,w,h = cv2.boundingRect(cnt)
                aspect_ratio = min(float(w)/h, float(h)/w)

                if(aspect_ratio > 0.9):
                    ellipse = cv2.fitEllipse(cnt)
                    elps.append(ellipse)
                    cv2.ellipse(img, ellipse, (0, 255, 0))

        # Find two elipses with same centers
        candidates = []
        for n in range(len(elps)):
            for m in range(n + 1, len(elps)):
                e1 = elps[n]
                e2 = elps[m]
                dist = np.sqrt(((e1[0][0] - e2[0][0]) ** 2 + (e1[0][1] - e2[0][1]) ** 2))
                # print dist

                if dist < 5:
                    candidates.append((e1,e2))


        # TODO: Preprocess the candidates that are the same candidate but detected multiple times


        # Preparing to extract the depth from the image
        for c in candidates:

            # candidate structure: Box2D
            # ((center_x, center_y), (width, height), angle)

            e1 = c[0]
            e2 = c[1]

            # Draw the detections
            cv2.ellipse(img_original, e1, (0, 255, 0), 2)
            cv2.ellipse(img_original, e2, (0, 255, 0), 2)

            size = (e1[1][0]+e1[1][1])/2
            center = (e1[0][0], e1[0][1])

            print(center)

            x1 = int(center[0] - size / 2)
            x2 = int(center[0] + size / 2)
            x_min = x1 if x1>0 else 0
            x_max = x2 if x2<img.shape[0] else img.shape[0]

            y1 = int(center[1] - size / 2)
            y2 = int(center[1] + size / 2)
            y_min = y1 if y1 > 0 else 0
            y_max = y2 if y2 < img.shape[1] else img.shape[1]

            # Drawing center
            cv2.line(img_original, (int(center[0]), int(center[1])), (int(center[0]), int(center[1])), (0, 0, 255), 10)
            #cv2.line(img_original, (x_min, y_min), (x_min, y_min), (150, 30, 60), 10)
            #cv2.line(img_original, (x_max, y_min), (x_max, y_min), (150, 30, 60), 10)
            #cv2.line(img_original, (x_max, y_max), (x_max, y_max), (150, 30, 60), 10)
            #cv2.line(img_original, (x_min, y_max), (x_min, y_max), (150, 30, 60), 10)

            # print("[{0}]: {1}".format(rospy.Time.now().to_time(), agl))

            # Publish an array of detections here
            if (self.scan_ranges != None):
                agl = self.scan_angle_min + center[0] * self.scan_angle_increment
                dpt = self.scan_ranges[int(center[0])]
                ed = EllipseData()
                ed.found = 0 if np.isnan(dpt) else 1
                ed.dpt = dpt 
                ed.agl = agl
                ed.timestamp = timestamp

            self.rings_pub.publish(ed)

        print("------------------------")    

        cv2.imshow('Live feed', img_original)
        cv2.waitKey(1)

    def scan_callback(self, data):
        # TODO: tf2 scan messages with delay?
        #data.ranges[len(data.ranges)//2]
        self.scan_ranges = data.ranges
        self.scan_angle_min = data.angle_min
        self.scan_angle_max = data.angle_max
        self.scan_angle_increment = data.angle_increment

        #past = rospy.Time.now() - rospy.Duration(5.0)
        #trans = self.tf_buf.lookup_transform_full(
        #    target_frame='base_link', 
        #    target_time=rospy.Time.now(),
        #    source_frame='scan',
        #    source_time=past,
        #    fixed_frame=world,
        #    timeout=rospy.Duration(2.0)
        #)
        pass 


def main():

    ring_finder = The_Ring()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
