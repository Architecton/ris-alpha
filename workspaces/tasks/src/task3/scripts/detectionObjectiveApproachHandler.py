#!usr/bin/env python

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
    
    def _side_scan(self):
        msg = Twist()
        scan_loop_rate = rospy.Rate(2)
        msg.angular.z = 0.1 
        start_time = time.time()
        while(time.time() - start_time < sprint_duration):
            self._vel_pub.publish(msg)
            sprint_loop_rate.sleep()
        msg.angular.z = -0.1
        while(time.time() - start_time < sprint_duration):
            self._vel_pub.publish(msg)
            sprint_loop_rate.sleep()

    def _approach(self):
        self._laser_sub = rospy.Subscriber("/scan", LaserScan, self._scan_callback)
        msg = Twist()
        msg.linear.x = 0.1 
        start_time = time.time()
        while self._dist_to_wall > 0.1:
            self._vel_pub(msg)
        self._dist_to_wall = 100 
        self._laser_sub.unregister()
        return time.time() - start_time


    def _reverse(self, duration):
        msg = Twist()
        msg.linear.x = -0.1
        start_time = time.time()
        while (time.time() - start_time < duration):
            self._vel_pub(msg)


¸   def approach_procedure():
        approach_duration = self._approach()
        self._side_scan()
        self._reverse()
        pass


if __name__ == '__main__':
    doah = DetectionObjectiveApproachHandler()
    doah.approach_procedure()
