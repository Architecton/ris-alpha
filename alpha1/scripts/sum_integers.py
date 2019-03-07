#!/usr/bin/env python

from alpha1.srv import *
import rospy

def handle_sum_ints(req):
	out = ' + '.join(str(num) for num in req.numbers)
	print "Returning [{0} = {1}]".format(out, sum(req.numbers))
	return SumIntegersResponse(sum(req.numbers))

def add_ints_server():
	rospy.init_node('sum_ints_server')
	s = rospy.Service('sum_ints', SumIntegers, handle_sum_ints)
	print('Ready to sum integers.')
	rospy.spin()

if __name__ == '__main__':
	add_ints_server()	