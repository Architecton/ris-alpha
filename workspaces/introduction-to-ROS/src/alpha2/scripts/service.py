#!/usr/bin/env python

import rospy
from alpha2.srv import TurtleManager
from geometry_msgs.msg import Twist
import math
import random

# //////// Movement Handlers ////////


# Handle rectangular movement
def handle_rectangular_mvm(pub, duration, rate):
    twist = Twist()
    begin_time = rospy.get_time()
    step = 0
    while rospy.get_time() - begin_time < duration:
        twist.linear.x = 1.5
        twist.angular.z = 0
        if step % 3 == 0:
            twist.linear.x = 0
            twist.angular.z = math.pi/2.0
        pub.publish(twist)
        rate.sleep()
        step += 1


# Handle triangular movement
def handle_triangular_mvm(pub, duration, rate):
    twist = Twist()
    begin_time = rospy.get_time()
    step = 0
    while rospy.get_time() - begin_time < duration:
        twist.linear.x = 1.5
        twist.angular.z = 0
        if step % 3 == 0:
            twist.linear.x = 0
            twist.angular.z = math.pi - math.pi/3.0
        pub.publish(twist)
        rate.sleep()
        step += 1


# Handle circular movement
def handle_circular_mvm(pub, duration, rate):
    twist = Twist()
    begin_time = rospy.get_time()
    while rospy.get_time() - begin_time < duration:
        twist.linear.x = 1.5
        twist.angular.z = 1.0
        pub.publish(twist)
        rate.sleep()


# Handle random movement
def handle_random_mvm(pub, duration, rate):
    twist = Twist()
    begin_time = rospy.get_time()
    while rospy.get_time() - begin_time < duration:
        twist.linear.x = random.uniform(-2, 2)
        twist.angular.z = random.uniform(-2, 2)
        pub.publish(twist)
        rate.sleep()

# //////// /Movement Handlers ////////


# handle_movement_manager: service request handler function
def handle_movement_manager(req):
    # Initialize publisher that publishes to the turtle1 velocity topic.
    pub = rospy.Publisher('turtle1/cmd_vel', Twist, queue_size = 1000)

    # Handle requests
    if req.trajection == 'rectangle':
        twist = handle_rectangular_mvm(pub, req.duration, rospy.Rate(1))
    elif req.trajection == 'triangle':
        twist = handle_triangular_mvm(pub, req.duration, rospy.Rate(1))
    elif req.trajection == 'circle':
        twist = handle_circular_mvm(pub, req.duration, rospy.Rate(1))
    elif req.trajection == 'random':
        twist = handle_random_mvm(pub, req.duration, rospy.Rate(1)) 

    return req.trajection


# movement_manager_server: node and service initialization
def movement_manager_server():
    # initialize node and service.
    rospy.init_node('movement_manager_server')
    rospy.Service('movement_manager', TurtleManager, handle_movement_manager)

    print('movement_manager online')

    # Wait for requests.
    rospy.spin()

if __name__ == '__main__':
    movement_manager_server()

