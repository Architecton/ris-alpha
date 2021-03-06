mport rospy
import numpy as np
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
        self._dist_to_wall_front = 100

    def _scan_callback(self, data):
        print data.ranges[len(data.ranges)//2]
        self._dist_to_wall_front = data.ranges[len(data.ranges)//2]

    def _side_scan(self, duration):
        msg = Twist()
        scan_loop_rate = rospy.Rate(2)
        msg.angular.z = 0.1 
        start_time = time.time()
        while(time.time() - start_time < duration):
            self._vel_pub.publish(msg)
            scan_loop_rate.sleep()
        msg.angular.z = -0.1
        start_time = time.time()
        while(time.time() - start_time < duration*2):
            self._vel_pub.publish(msg)
            scan_loop_rate.sleep()
        msg.angular.z = 0.1
        start_time = time.time()
        while(time.time() - start_time < duration):
            self._vel_pub.publish(msg)
            scan_loop_rate.sleep()

    def _approach(self, goal_dist):
        self._laser_sub = rospy.Subscriber("/scan", LaserScan, self._scan_callback)
        msg = Twist()
        msg.linear.x = 0.1 
        start_time = time.time()
        while self._dist_to_wall_front > goal_dist:
            self._vel_pub.publish(msg)
        self._dist_to_wall = 100 
        self._laser_sub.unregister()
        return time.time() - start_time


    def _reverse(self, duration):
        msg = Twist()
        msg.linear.x = -1.0
        start_time = time.time()
        while (time.time() - start_time < duration):
            self._vel_pub.publish(msg)


    def approach_procedure(self):
        GOAL_DIST = 0.1
        SIDE_ROT_DURATION = 2.0
        self._approach(GOAL_DIST)
        self._side_scan(SIDE_ROT_DURATION)

    def approach_procedure_side_scan(self):
        SIDE_ROT_DURATION = 2.0
        self._side_scan(SIDE_ROT_DURATION)
        self._reverse(0.5)


if __name__ == '__main__':
    rospy.init_node('master')
    doah = DetectionObjectiveApproachHandler()
    doah.approach_procedure()
    doah.approach_procedure_side_scan()
                                             
