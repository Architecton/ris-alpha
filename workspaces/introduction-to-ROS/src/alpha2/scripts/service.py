#!/usr/bin/env python

import rospy
from alpha2.srv import TurtleManager
from geometry_msgs.msg import Twist

def handle_rectangular_mvm(step):
    twist = Twist()
    twist.linear.x = 0.1
    step = step % 20

    if step % 5 == 0:
        twist.linear.x = 0
        twist.angular.z = 1.57 #(90 / 360) * 2 * 3.14

    return twist

def handle_triangular_mvm(step):
    pass

def handle_circular_mvm(step):
    twist = Twist()
    twist.linear.x = 0.07

    if step % 2 == 0:
        twist.linear.x = 0
        twist.angular.z = 0.157

    return twist

def handle_random_mvm(step):
    pass    

def handle_movement_manager(req):

    pub = rospy.Publisher('turtle1/cmd_vel', Twist, queue_size = 1000)

    step = 0.0

    beginTime = rospy.get_time() # to vraca sekunde
    endTime = beginTime + req.duration # predvidevamo da je tudi req.duration v sekundah

    print 'Got request' 
    print 'Begin time: %f' % beginTime
    print 'End time: %f' % endTime

    rate = rospy.Rate(1)

    while rospy.get_time() < endTime:
        if req.trajection == 'rectangle':
            twist = handle_rectangular_mvm(step)
        elif req.trajection == 'triangle':
            twist = handle_triangular_mvm(step)
        elif req.trajection == 'circle':
            twist = handle_circular_mvm(step)
        elif req.trajection == 'random':
            twist = handle_random_mvm(step) 
        
        pub.publish(twist)
        step = step + 1.0
        rate.sleep()


    return req.trajection

def movement_manager_server():
    rospy.init_node('movement_manager_server')
    s = rospy.Service('movement_manager', TurtleManager, handle_movement_manager)

    print('Ready to handle requests.')

    rospy.spin()

if __name__ == '__main__':
    movement_manager_server()

# Neki ros neki rospin neki rosspinonce neki
# 
