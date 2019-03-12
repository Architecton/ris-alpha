#!/usr/bin/env python

# Imports
import sys
import random
import rospy
from alpha1.srv import SumIntegers

# sum_ints_client: client that sums integers.
def sum_ints_client(numbers):
    rospy.wait_for_service('sum_ints')  # Wait for specified service.
    try:
        sum_ints = rospy.ServiceProxy('sum_ints', SumIntegers)
        resp1 = sum_ints(numbers)
        return resp1.sum  # Return response sum.
    except rospy.ServiceException, e:
        print 'Service call failed: {0}'.format(e)

def usage():
    return '{0} [Noargs]'.format(sys.argv[0])

if __name__ == '__main__':
    if len(sys.argv) == 1:
        numbers = random.sample(range(100), 10)  # Take a random sample of numbers.
        sum_req_str = ' + '.join(str(nbr) for nbr in numbers)  # Request display string.
        print 'Requesting {0}'.format(sum_req_str)
        print '{0} = {1}'.format(sum_req_str, sum_ints_client(numbers))  # Call service to sum numbers.
    else:
        print usage()
        sys.exit(1)
