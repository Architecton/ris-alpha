#!/usr/bin/env python

"""

Simple test client for the movement_manager service

"""

import rospy
from alpha2.srv import TurtleManager
import datetime

# turtle_manager_test_client: client that consumes the movement_manager service
def movement_manager_test_client(trajection, duration):
    rospy.wait_for_service('movement_manager')  # Wait for service to come online.
    try:
        serv = rospy.ServiceProxy('movement_manager', TurtleManager)  # Initialize service proxy.
        return serv(trajection, duration)  # Return result of service call.
    except rospy.ServiceException, e:
        print "Service error: {0}".format(e.message)

if __name__ == "__main__":
    # Define list of test commands.
    test_req = [["circle", 10], ["rectangle", 10], ["triangle", 10], ["random", 10]]
    for req in test_req:
        print "Requesting movement '{0}' for duration:={1}.".format(req[0], req[1])
        last_move = movement_manager_test_client(*req).lastmovement
        print "Received ACK for movement '{0}' @ {1}.".format(last_move,\
                                        datetime.datetime.now().isoformat())