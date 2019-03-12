#!/usr/bin/env python

from alpha1.srv import SumIntegers
import rospy

# handle_sum_ints: service logic 
def handle_sum_ints(req):
	out = ' + '.join(str(num) for num in req.numbers)
	print "Returning [{0} = {1}]".format(out, sum(req.numbers))
	return SumIntegersResponse(sum(req.numbers))

# add_ints_server: service
def add_ints_server():
	rospy.init_node('sum_ints_server')  # Initialize service node.
	s = rospy.Service('sum_ints', SumIntegers, handle_sum_ints)  # Initialize functionality.
	print('Ready to sum integers.')  # Wait for requests to service.
	rospy.spin()

# If run as script
if __name__ == '__main__':
	add_ints_server()