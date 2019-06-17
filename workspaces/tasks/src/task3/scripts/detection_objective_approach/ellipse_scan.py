#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import time

from task3.msg import EllipseData

class EllipseScan:
    
    def __init__(self):
        self._vel_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1)
        self._dist_to_wall = 100
        rospy.Subscriber('rings', EllipseData, self._rings_callback)
        self.MIN_AGL = -0.513185441494
        self.AGL_INCR = 0.00158543407451
	self._found = False
	self._center_x = 0
        self._dist_to_wall = 100

    
    def _rings_callback(self, data):
        if data.found == 1:
            self._found = True
            self._center_x = (data.agl[0] - self.MIN_AGL)/self.AGL_INCR

    def _scan_callback(self, data):
        self._dist_to_wall = data.ranges[len(data.ranges)//2]


    def scan_next(self):
        DURATION_ROTATION = 10.0
        msg = Twist()
        msg.angular.z = 0.1
        start_time = time.time()
        while time.time() - start_time < DURATION_ROTATION:
            self._vel_pub.publish(msg)
            if self._found:
                self._found = False
                return self.home_in()
        return -1.0

    def back_up(self, duration):
        msg = Twist()
        msg.linear.x = -0.5
        start_time = time.time()
        while time.time() - start_time < duration:
            self._vel_pub.publish(msg)

    def home_in(self):
        goal_dist = 0.01
        self._laser_sub = rospy.Subscriber("/scan", LaserScan, self._scan_callback)
        DURATION_FORWARD = 10.0
        msg = Twist()
        msg.linear.x = 0.1
        timer = time.time()
        start_time = time.time()
        while self._dist_to_wall > goal_dist and time.time() - start_time < DURATION_FORWARD:
            if not self._found:
                msg.angular.z = 0.0
            if self._center_x > 320:
                msg.angular.z = 0.1
            elif self._center_x < 320:
                msg.angular.z = -0.1
            self._vel_pub.publish(msg)
            if self._found:
               self._found = False
        self._dist_to_wall = 100
        self._laser_sub.unregister()
        return time.time() - timer


if __name__ == '__main__':
    rospy.init_node('test', anonymous=True)
    es = EllipseScan()
    duration_back_up = es.scan_next()
    if duration_back_up > 0:
        es.back_up(duration_back_up)

