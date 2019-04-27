#!/usr/bin/env python

import rospy
import numpy as np
from geometry_msgs.msg import Twist
from task2.msg import TerminalApproachFeedback
from task2.srv import TerminalApproach

import pdb

class TerminalApproachHandler:

    """
    Class representing a service that guides the robot on the terminal approach to the ring.
    """

    # Constructor.
    def __init__(self, callib_coeff_agl):
        self.callib_coeff_agl = callib_coeff_agl  # Set velocity callibration coefficients.

        # Define velocity publisher.
        self.vel_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=100)
        self.mov = Twist()  # Define velocity message instance.



    def apply_corrections(self, data):
        """
        Apply corrections to keep ring center withing square with center at (center_y, center_x) of size window_size.

        Args:
            data -- TerminalApproachFeedback message instance
        Returns:
            None
        """
        print "Here I am also"
        # Compute offset from window 
        x_offset = (data.feedback.target_center_x - data.feedback.center_x) -\
        data.feedback.window_size if data.feedback.target_center_x > data.feedback.center_x else\
        (data.feedback.target_center_x - data.feedback.center_x) + data.feedback.window_size
        
        # Set angular velocity as a function of the offset (larger offset, larger linear velocity).
        self.mov.angular.z = (x_offset*self.callib_coeff_agl)**2

        # publish velocity message.
        self.vel_pub.publish(self.mov)

        return []

    def start_server(self):
        """
        start service server
        Args:
            None
        Returns:
            None
        """
        
        # Initialize node and service.
        rospy.init_node('terminal_approach', anonymous = True)
        rospy.Service('terminal_approach', TerminalApproach, self.apply_corrections)

        # Wait for requests.
        rospy.spin()


if __name__ == '__main__':

    # Define velocity callibration coefficients.
    CALLIB_COEFF_AGL = 0.03

    # Start service.
    ta = TerminalApproachHandler(CALLIB_COEFF_AGL)
    ta.start_server()
