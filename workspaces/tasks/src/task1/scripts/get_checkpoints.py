#!/usr/bin/env python

import rospy
from task1.srv import Checkpoint_res
from task1.msg import Checkpoints
from nav_msgs.msg import OccupancyGrid
from geometry_msgs.msg import Point, Vector3, PoseStamped

ros_map = []

def mapCallback(data):
    global ros_map

    ros_map = data.data

def req_handler(req):


    checkpoints = Checkpoints()

    #rospy.wait_for_service('static_map')


    #checkpoints.points.append(p1)
    #checkpoints.points.append(p2)
    #checkpoints.points.append(p3)

    return checkpoints

def get_checkpoints_server():
    rospy.init_node('get_checkpoints_server')

    rospy.Service('get_checkpoints', Checkpoint_res, req_handler)
    rospy.Subscriber('map', OccupancyGrid, mapCallback)

    rospy.spin()

if __name__ == '__main__':
    get_checkpoints_server()
