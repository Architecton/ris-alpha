#!/usr/bin/env python

from alpha1.srv import MultIntegers
import rospy
import numpy as np

# req_handler: service's request handler.
def req_handler(req):
	return np.prod(req.int_list)  # Return product of the integers in the list.

# mult_integers_server: initialize node and service.
def mult_integers_server():
	rospy.init_node('mult_ints_server')  # Initialize node and name it.
	rospy.Service('mult_ints', MultIntegers, req_handler)  # Initialize service and name it.
	rospy.spin()  # Keep node alive until shut down.

# If run as main script.
if __name__ == "__main__":
	mult_integers_server()