#!/usr/bin/env python

import sys
import random
import rospy
from alpha1.srv import *

###
# Sum all the integers passed as arguments
##
#def sum_ints_client(numbers):
#	rospy.wait_for_service('sum_ints')
#	try:
#		sum_ints = rospy.ServiceProxy('sum_ints', SumIntegers)
#		resp1 = sum_ints(numbers)
#		return resp1.sum
#	except rospy.ServiceException, e:
#		print 'Service call failed: {0}'.format(e)
#
#def usage():
#	return '{0} [x1 x2 ... xn]'.format(sys.argv[0])	
#
#if __name__ == '__main__':
#	if len(sys.argv) > 1:
#		sum_req_str = ' + '.join(nbr for nbr in sys.argv[1:])
#		numbers = [int(x) for x in sys.argv[1:]]
#		print 'Requesting {0}'.format(sum_req_str)
#		print '{0} = {1}'.format(sum_req_str, sum_ints_client(numbers))			
#	else:
#		print usage()
#		sys.exit(1)	
###
			
###
# Create a list of random numbers and sum them
##
def sum_ints_client(numbers):
	rospy.wait_for_service('sum_ints')
	try:
		sum_ints = rospy.ServiceProxy('sum_ints', SumIntegers)
		resp1 = sum_ints(numbers)
		return resp1.sum
	except rospy.ServiceException, e:
		print 'Service call failed: {0}'.format(e)

def usage():
	return '{0} [Noargs]'.format(sys.argv[0])

if __name__ == '__main__':
	if len(sys.argv) == 1:
		numbers = random.sample(range(100), 10)			
		sum_req_str = ' + '.join(str(nbr) for nbr in numbers)
		print 'Requesting {0}'.format(sum_req_str)
		print '{0} = {1}'.format(sum_req_str, sum_ints_client(numbers))			
	else:
		print usage()
		sys.exit(1)			
###			