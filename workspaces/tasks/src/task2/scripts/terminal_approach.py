#!/usr/bin/env python

import rospy
import numpy as np
from geometry_msgs.msg import Twist
from task2.msg import TerminalApproachFeedback
from task2.srv import TerminalApproach

class TerminalApproachHandler:

    # Constructor.
    def __init__(self, callib_coeff_agl, callib_coeff_lin):
        self.callib_coeff_ang = callib_coeff_agl  # Set velocity callibration coefficients.
        self.callib_coeff_lin = callib_coeff_lin

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

        # Compute offset from window 
        x_offset = (data.target_center_x - data.center_x) - window_size if data.target_center_x > data.center_x else (data.target_center_x - data.center_x) + window_size
        
        # Set angular velocity as a function of the offset (larger offset, larger linear velocity).
        self.mov.angular.z = x_offset*self.callib_coeff_agl**2
        # Set linear velocity as a function of the offset (larger offset, smaller linear velocity).
        self.mov.linear.x = (1/np.abs(x_offset))*self.callib_coeff_lin**2

        # publish velocity message.
        self.vel_pub.publish(mov)

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
    CALLIB_COEFF_AGL = 0.001
    CALLIB_COEFF_LIN = 0.001

    # Start service.
    ta = TerminalApproachHandler(CALLIB_COEFF_AGL, CALLIB_COEFF_LIN)
    ta.start_server()
