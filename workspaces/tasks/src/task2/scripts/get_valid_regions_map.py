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
import math

ros_map = []
info = MapMetaData()

angle = -0.3925

w_size = 10
w_share = 0.3

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

    crop = cropImage(img)
    new_img = crop['img']
    offset = crop['offset']

    new_img = rotateImage(new_img, angle)

    point_p = metersToMapIndex(start, point_m, res, offset)
    point_p = rotate_point(point_p, angle, new_img.shape[1], new_img.shape[0])

    new_img = find_valid_region(new_img, point_p)

    new_img = rotateImage(new_img, -angle)
    point_p = rotate_point(point_p, -angle, new_img.shape[1], new_img.shape[0])

    kernel = np.ones((2,2),np.uint8)

    new_img = cv2.morphologyEx(new_img, cv2.MORPH_CLOSE, kernel)

    img[offset['y']:offset['y']+new_img.shape[0], offset['x']:offset['x']+new_img.shape[1]] = new_img
    point_p['x'] += offset['x']
    point_p['y'] += offset['y']

    visualize(img, point_p)

    resp = ValidRegionsMapResponse()
    resp.output_x = req.input_x
    resp.output_y = req.input_y

    return resp

def fill_region(img, point, possible_dirs, new_v):
    x = point['x']
    y = point['y']

    if x >= 0 and x < img.shape[1] and y >= 0 and y < img.shape[0] and img[y, x] != 100 and img[y, x] != new_v:
        img[y, x] = new_v

        if 0 in possible_dirs:
            fill_region(img, {'x': x, 'y': y+1}, possible_dirs, new_v)
        if 1 in possible_dirs:
            fill_region(img, {'x': x+1, 'y': y}, possible_dirs, new_v)
        if 2 in possible_dirs:
            fill_region(img, {'x': x, 'y': y-1}, possible_dirs, new_v)
        if 3 in possible_dirs:
            fill_region(img, {'x': x-1, 'y': y}, possible_dirs, new_v)


def find_valid_region(img, point):
    offset_x = int(point['x'])-w_size/2
    offset_y = int(point['y'])-w_size/2

    window = img[offset_y : offset_y + w_size, offset_x : offset_x + w_size]

    directions = [0, 0, 0, 0]

    share_size = int(w_size*w_share)
    #w_share

    for y in range(0, window.shape[0]):
        for x in range(0, window.shape[1]):
            if window[y, x] == 100:
                #levo
                if x < share_size:
                    directions[3] += 1
                #gor
                if y < share_size:
                    directions[2] += 1
                #desno
                if x >= w_size-share_size:
                    directions[1] += 1 
                #dol
                if y >= w_size-share_size:
                    directions[0] += 1 


    max_dir = 0
    max_sum = 0

    for i in range(4):
        if directions[i] > max_sum:
            max_sum = directions[i]
            max_dir = i


    new_dir1 = max_dir + 1 if (max_dir + 1 < 4) else 0

    new_v = 50
    offset = 5

    start_point = {'x': point['x'], 'y': point['y']}

    possible_dirs = []

    if new_dir1 == 0:
        possible_dirs = [0, 1, 3]
        start_point['y'] += offset

    if new_dir1 == 1:
        possible_dirs = [0, 1, 2]
        start_point['x'] += offset

    if new_dir1 == 2:
        possible_dirs = [1, 2, 3]
        start_point['y'] -= offset

    if new_dir1 == 3:
        possible_dirs = [0, 2, 3]
        start_point['x'] -= offset


    fill_region(img, start_point, possible_dirs, new_v)

    return img


def visualize(img, point):
    plt.figure()
    plt.imshow(img, cmap="gray")

    plt.scatter(point['x'], point['y'], s=50, c='red', marker='o')

    plt.show()

def euclidian(p1, p2):
    return math.sqrt(pow(p2[0]-p1[0], 2) + pow(p2[1]-p1[1], 2))

def mapIndexToMeters(start, point, res, offset):
    x_d = (point['x'] + offset['x']) - round(start['x'], 0)
    y_d = (point['y'] + offset['y']) - round(start['y'], 0)

    x = x_d*res
    y = y_d*res

    return {'x': x, 'y': y}

def metersToMapIndex(start, point, res, offset):
    x = round(point['x'] / res) + round(start['x']) - offset['x']
    y = round(point['y'] / res) + round(start['y']) - offset['y']

    return {'x': x, 'y': y}

def cropImage(img):
    x_min = img.shape[1]
    x_max = 0
    y_min = img.shape[0]
    y_max = 0

    for i in range(0, img.shape[0]):
        for j in range(0, img.shape[1]):
            if img[i, j] == 100:
                if j < x_min:
                    x_min = j
                if j > x_max:
                    x_max = j
                if i < y_min:
                    y_min = i
                if i > y_max:
                    y_max = i

    new_img = img[y_min:y_max, x_min:x_max]
    offset = {'x': x_min, 'y': y_min}

    return {'img': new_img, 'offset': offset}

def rotateImage(img, angle):
    new_img = np.zeros(img.shape)

    width = img.shape[1] 
    height = img.shape[0] 

    for y in range(0, height):
        for x in range(0, width):
            if img[y, x] == 100 or img[y, x] == 50:
                value = img[y, x]

                rotated_point = rotate_point({'x': x, 'y':y}, angle, width, height)

                if (rotated_point['x'] > 0 and rotated_point['x'] < img.shape[1]) and (rotated_point['y'] > 0 and rotated_point['y'] < img.shape[0]):
                    new_img[int(rotated_point['y']), int(rotated_point['x'])] = value; 

    return new_img

def rotate_point(point, angle, width, height):
    off_x = int(width/2)
    off_y = int(height/2)

    new_x = math.cos(angle) * (point['x']-off_x) - math.sin(angle) * (point['y']-off_y) + off_x
    new_y = math.sin(angle) * (point['x']-off_x) + math.cos(angle) * (point['y']-off_y) + off_y

    return {'x': int(new_x), 'y':int(new_y)}

def get_valid_regions_map_server():
    rospy.init_node('get_valid_regions_map_server')

    rospy.Service('get_valid_regions_map', ValidRegionsMap, req_handler)
    rospy.Subscriber('map', OccupancyGrid, mapCallback)

    rospy.spin()

if __name__ == '__main__':
    get_valid_regions_map_server()