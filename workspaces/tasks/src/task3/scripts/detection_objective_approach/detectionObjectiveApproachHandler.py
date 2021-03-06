#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import time

class DetectionObjectiveApproachHandler:

    """
    Approach detection objective by using data from laser scan and perform slight side by side rotation to
    increase probability of detections.
    """

    def __init__(self):
        self._vel_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1)
        self._dist_to_wall = 100 

    def _scan_callback(self, data):
        self._dist_to_wall = data.ranges[len(data.ranges)//2]
    
    def _side_scan(self, duration):
        msg = Twist()
        scan_loop_rate = rospy.Rate(2)
        msg.angular.z = 0.3
        start_time = time.time()
        while(time.time() - start_time < duration):
            self._vel_pub.publish(msg)
            scan_loop_rate.sleep()
        msg.angular.z = -0.3
        start_time = time.time()
        while(time.time() - start_time < duration*2):
            self._vel_pub.publish(msg)
            scan_loop_rate.sleep()
        msg.angular.z = 0.3
        start_time = time.time()
        while(time.time() - start_time < duration):
            self._vel_pub.publish(msg)
            scan_loop_rate.sleep()

    def _approach(self, goal_dist):
        self._laser_sub = rospy.Subscriber("/scan", LaserScan, self._scan_callback)
        DURATION_FORWARD = 6.0
        msg = Twist()
        msg.linear.x = 0.1 
        start_time = time.time()
        while self._dist_to_wall > goal_dist and time.time() - start_time < DURATION_FORWARD:
            self._vel_pub.publish(msg)
        self._dist_to_wall = 100 
        self._laser_sub.unregister()


    def _reverse(self, duration):
        msg = Twist()
        msg.linear.x = -0.5
        start_time = time.time()
        while (time.time() - start_time < duration):
            self._vel_pub.publish(msg)


    def approach_procedure(self):
        GOAL_DIST = 0.15
        SIDE_ROT_DURATION = 3.0
        REVERSE_DURATION = 0.5
        self._approach(GOAL_DIST)
        self._side_scan(SIDE_ROT_DURATION)
        self._reverse(REVERSE_DURATION)

    # approach procedure without the reversing motion at the end
    def approach_procedure_alt(self):
        GOAL_DIST = 0.15
        SIDE_ROT_DURATION = 3.0
        self._approach(GOAL_DIST)
        self._side_scan(SIDE_ROT_DURATION)

    # isolated reversing motion
    def reverse(self):
        REVERSE_DURATION = 0.7
        self._reverse(REVERSE_DURATION)

    # go forward until specified distance from obstacle
    def forward(self):
        self._laser_sub = rospy.Subscriber("/scan", LaserScan, self._scan_callback)
        goal_dist = 0.01
        DURATION_FORWARD = 6.0
        msg = Twist()
        msg.linear.x = 0.1 
        start_time = time.time()
        while self._dist_to_wall > goal_dist and time.time() - start_time < DURATION_FORWARD:
            self._vel_pub.publish(msg)
        self._dist_to_wall = 100 
        self._laser_sub.unregister()

    # slight counterclockwise rotation
    def left(self):
        DURATION = 0.5
        msg = Twist()
        msg.linear.z = 0.1 
        start_time = time.time()
        while time.time() - start_time < DURATION:
            self._vel_pub.publish(msg)

    # slight clockwise rotation
    def right(self):
        DURATION = 0.5
        msg = Twist()
        msg.linear.z = 0.1 
        start_time = time.time()
        while time.time() - start_time < DURATION:
            self._vel_pub.publish(msg)


if __name__ == '__main__':
    rospy.init_node('master')
    doah = DetectionObjectiveApproachHandler()
    doah.approach_procedure()
