#!/usr/bin/env python

from alpha2.srv import TurtleManager
import rospy

def handle_rectangular_mvm(duration):
    pass

def handle_triangular_mvm(duration):
    pass

def handle_circular_mvm(duration):
    pass

def handle_random_mvm(duration):
    pass    

def handle_movement_manager(req):
    if req.trajection == 'rectangle':
        handle_rectangular_mvm(req.duration)
    elif req.trajection == 'triangle':
        handle_triangular_mvm(req.duration)
    elif req.trajection == 'circle':
        handle_circular_mvm(req.duration)
    elif req.trajection == 'random':
        handle_random_mvm(req.duration) 

    return "placeholder"

def movement_manager_server():
    rospy.init_node('movement_manager_server')
    s = rospy.Service('movement_manager', TurtleManager, handle_movement_manager)
    print('Ready to handle requests.')
    rospy.spin()

if __name__ == '__main__':
    movement_manager_server()

# Neki ros neki rospin neki rosspinonce neki
# 
