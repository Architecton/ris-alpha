#!/usr/bin/env python

import rospy
from task2.srv import ValidRegionsMap
from task2.msg import ValidRegionsMapResponse
from nav_msgs.msg import OccupancyGrid, MapMetaData
from geometry_msgs.msg import Point, Vector3, PoseStamped

import numpy as np
import cv2
import matplotlib.pyplot as plt
import sys

ros_map = []
info = MapMetaData()

def mapCallback(data):
    global ros_map
    global info

    ros_map = data.data
    info = data.info

def req_handler(req):
	point_m = {'x': req.input_x, 'y': req.input_y}

	width = info.width
    height = info.height
    origin = info.origin
    res = info.resolution
    
    start = {'x': -(origin.position.x / res), 'y': -(origin.position.y / res)}

    img = np.array(ros_map)
    img = img.reshape((height, width))

    visualize(img)

	resp = ValidRegionsMapResponse()
	resp.output_x = req.input_x
	resp.output_y = req.input_y

	return resp


def visualize(img):
	plt.figure()
    plt.imshow(img, cmap="gray")

    #plt.scatter(check['x'], check['y'], s=50, c='red', marker='o')
    #if resp.valid:
    #    plt.scatter(resp.output_x, resp.output_y, s=50, c='red', marker='o')

    plt.show()

def euclidian(p1, p2):
    return math.sqrt(pow(p2[0]-p1[0], 2) + pow(p2[1]-p1[1], 2))

def mapIndexToMeters(start, point, res):
    x_d = point['x'] - round(start['x'], 0)
    y_d = point['y'] - round(start['y'], 0)

    x = x_d*res
    y = y_d*res

    return {'x': x, 'y': y}

def metersToMapIndex(start, point, res):
    x = round(point['x'] / res) + round(start['x'])
    y = round(point['y'] / res) + round(start['y'])

    return {'x': x, 'y': y}

def get_valid_regions_map_server():
    rospy.init_node('get_valid_regions_map_server')

    rospy.Service('get_valid_regions_map', ValidRegionsMap, req_handler)
    rospy.Subscriber('map', OccupancyGrid, mapCallback)

    rospy.spin()

if __name__ == '__main__':
    get_valid_regions_map_server()