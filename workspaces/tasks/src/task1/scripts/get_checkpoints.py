#!/usr/bin/env python

import rospy
from task1.srv import Checkpoint_res
from task1.msg import Checkpoints
from nav_msgs.msg import OccupancyGrid, MapMetaData
from geometry_msgs.msg import Point, Vector3, PoseStamped

import numpy as np
import cv2
import matplotlib.pyplot as plt

ros_map = []
info = MapMetaData()

def mapCallback(data):
    global ros_map
    global info

    ros_map = data.data
    info = data.info

def req_handler(req):


    checkpoints = Checkpoints()

    #rospy.wait_for_service('static_map')

    #print(info);
    img = np.array(ros_map) 
    img = img.reshape((info.height, info.width))

    print info
    #img = np.random.random((100, 100))

    plt.imshow(img, cmap="gray")
    plt.show()

    #cv2.imshow("image", ros_map);
    #cv2.waitKey();

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
