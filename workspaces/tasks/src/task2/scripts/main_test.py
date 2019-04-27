#!/usr/bin/env python

### Imports ###
import rospy
import numpy as np

import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

import tf2_ros
import tf2_geometry_msgs

from tf.transformations import quaternion_from_euler, euler_from_quaternion
from geometry_msgs.msg import Point, Vector3, PoseStamped, Twist

from task2.srv import TerminalApproach
from task2.msg import TerminalApproachFeedback
from task2.msg import ApproachImageFeedback

import pdb
### /IMPORTS ###


### TERMINAL APPROACH ###

class TerminalApproachHandler:

    def __init__(self, window_size, target_center_x):

	# set window size in which to keep center of ring.
        self._WINDOW_SIZE = window_size
	self._target_center_x = target_center_x
        self._sprint_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
        self._corr = TerminalApproachFeedback()
        rospy.wait_for_service('terminal_approach')  # Wait for service to come online.
        try:
            self._corrections_serv = rospy.ServiceProxy('terminal_approach', TerminalApproach)  # Initialize service proxy.
        except rospy.ServiceException, e:
            print "Service error: {0}".format(e.message)

    def _image_feedback_callback(self, data):
	print "here I am"
	self._corr.target_center_x = self._target_center_x
        self._corr.center_x = data.center_x
        self._corr.window_size = self._WINDOW_SIZE
        self._corrections_serv(self._corr)

    def sprint(self, sprint_duration):
        msg = Twist()  # TODO: "wiggle" while moving forward.
        sprint_loop_rate = Rospy.rate(10)  # TODO: empirically set
        msg.linear.x = 2.0
        start_time = time.time()
        while(time.time() - start_time < sprint_duration):
            self._sprint_pub.publish(msg)  # Publish angular velocity.
            sprint_loop_rate.sleep()

    def subscribe_to_feedback(self):
        self._feedback_subscriber = rospy.Subscriber('toroids', ApproachImageFeedback, self._image_feedback_callback)

    def unsubscribe_from_feedback(self):
        self._feedback_subscriber.unregister()


if __name__ == "__main__":

    # Initialize main node.
    rospy.init_node('main')

    tah = TerminalApproachHandler(10, 300)

    # Align for 7 seconds.
    tah.subscribe_to_feedback()
    rospy.sleep(60)
    tah.unsubscribe_from_feedback()
    
    # TODO: say colour of ring.
    
    # Go straight to pick up ring.
    # tah.sprint(4)

 
