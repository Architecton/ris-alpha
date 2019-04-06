#!/usr/bin/env python

import rospy
from task1.srv import CheckpointProcessor
from task1.msg import CheckpointProcessorResponse
from nav_msgs.msg import OccupancyGrid, MapMetaData
from geometry_msgs.msg import Point, Vector3, PoseStamped

import numpy as np
import cv2
import matplotlib.pyplot as plt
import math
from math import pow
import sys

ros_map = []
info = MapMetaData()

WINDOW_SIZE = 20

def mapCallback(data):
    global ros_map
    global info

    ros_map = data.data
    info = data.info

def req_handler(req):
    check_m = {'x': req.input_x, 'y': req.input_y} 

    width = info.width
    height = info.height
    origin = info.origin
    res = info.resolution
    
    start = {'x': -(origin.position.x / res), 'y': -(origin.position.y / res)}

    img = np.array(ros_map)
    img = img.reshape((height, width))

    check_p = metersToMapIndex(start, check_m, res)

    #print check_m
    #print check_p

    resp = process_checkpoint(img, check_p, WINDOW_SIZE)
    
    #visualize(img, check_p, resp)

    if resp.valid:
        new_check_p = {'x': resp.output_x, 'y': resp.output_y}
        new_check_m = mapIndexToMeters(start, new_check_p, res)

        resp.output_x = new_check_m['x']
        resp.output_y = new_check_m['y']

    #resp = CheckpointProcessorResponse()
    
    #resp.output_x = check_x
    #resp.output_y = check_y
    #resp.valid = True

    return resp


def process_checkpoint(img, check, w_size):
    resp = CheckpointProcessorResponse()

    #print check    
    #print img[int(check['y']), int(check['x'])]
    #print img[19:27, 297:304]

    if img[int(check['y']), int(check['x'])] == 100:
        resp.output_x = check['x']
        resp.output_y = check['y']
        resp.valid = True
    else :
        offset_x = int(check['x'])-w_size/2
        offset_y = int(check['y'])-w_size/2

        #window = img[int(check['y'])-w_size/2 : int(check['y'])+w_size/2, int(check['x'])-w_size/2 : int(check['x'])+w_size/2]
        window = img[offset_y : offset_y + w_size, offset_x : offset_x + w_size]

        min_point = [-1, -1]
        min_dist = sys.maxsize

        c_x = check['x'] - offset_x
        c_y = check['y'] - offset_y

        for i in range(window.shape[0]):
            for j in range(window.shape[1]):
                if window[i, j] == 100:
                    dist = euclidian([j, i], [c_x, c_y])

                    if dist < min_dist:
                        min_dist = dist
                        min_point = [j, i]

        
        if min_point[0] == -1 or min_point[1] == -1:
            resp.output_x = -1
            resp.output_y = -1
            resp.valid = False

        else:
            resp.output_x = min_point[0] + offset_x
            resp.output_y = min_point[1] + offset_y
            resp.valid = True

            #window[min_point[1], min_point[0]] = 8


    return resp

def euclidian(p1, p2):
    return math.sqrt(pow(p2[0]-p1[0], 2) + pow(p2[1]-p1[1], 2))

def visualize(img, check, resp):
    plt.figure()
    plt.imshow(img, cmap="gray")

    plt.scatter(check['x'], check['y'], s=50, c='red', marker='o')
    if resp.valid:
        plt.scatter(resp.output_x, resp.output_y, s=50, c='red', marker='o')


    plt.show()

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

def checkpoint_processor_server():
    rospy.init_node('checkpoint_processor_server')

    rospy.Service('checkpoint_processor', CheckpointProcessor, req_handler)
    rospy.Subscriber('map', OccupancyGrid, mapCallback)

    rospy.spin()

if __name__ == '__main__':
    checkpoint_processor_server()