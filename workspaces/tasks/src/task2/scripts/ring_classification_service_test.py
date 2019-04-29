#!/usr/bin/env python

import rospy

from task2.srv import FeatureBuilder

class Tester:

    def __init__(self):
        rospy.wait_for_service('feature_builder')  # Wait for service to come online.
	print "here"
        try:
            self._feature_builder_srv = rospy.ServiceProxy('feature_builder', FeatureBuilder)  # Initialize service proxy.
        except rospy.ServiceException, e:
            print 'Service call failed: {0}'.format(e)


    def run_test(self, duration):

        """
        Run test of the classification service chain. 
        """

        self._feature_builder_srv(1)  # Start building feature matrix.
        rospy.sleep(duration)  # sleep for specified number of minutes.
        return self._feature_builder_srv(0)  # classify built features matrix and return prediction with most votes.


if __name__ == "__main__":
    tester = Tester()  # Initialize tester instance and run test.
    res = tester.run_test(duration=3)
    print res

