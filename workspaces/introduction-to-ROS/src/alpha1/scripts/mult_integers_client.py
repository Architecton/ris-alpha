#!/usr/bin/env python

import rospy
from alpha1.srv import MultIntegers

# mult_integers_client: client that requests result of multiplication of a list of integers.
def mult_integers_client(int_list):
    print "Waiting for service..."  # Wait for service with specified name.
    rospy.wait_for_service('mult_ints')
    try:
        print "Service found!"

        # You call a service by creating a rospy.ServiceProxy with the name of the service 
        # you wish to call. You often will want to call rospy.wait_for_service() to block until a service is available.
        serv = rospy.ServiceProxy('mult_ints', MultIntegers)  # Initialize service proxy.
        return serv(int_list).result # Return result of service call.
    except rospy.ServiceException, e:
        print 'Service call failed: {0}'.format(e)

if __name__ == "__main__":
    result = mult_integers_client([1, 2, 3])  # Use client to get results of service call.
    print result