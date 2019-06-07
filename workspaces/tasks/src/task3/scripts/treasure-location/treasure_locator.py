#!/usr/bin/env python

import rospy
from task3.srv import TreasureLocator
from task3.msg import TreasureLocatorResponse
from nav_msgs.msg import OccupancyGrid, MapMetaData
from geometry_msgs.msg import Point, Vector3, PoseStamped
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import numpy as np
import cv2
import matplotlib.pyplot as plt
import sys
import math

ros_map = []
info = MapMetaData()

#angle = -0.3925

#w_size = 10
#w_share = 0.3

def mapCallback(data):
    global ros_map
    global info

    ros_map = data.data
    info = data.info

def req_handler(req):
    bridge = CvBridge()

    width = info.width
    height = info.height
    origin = info.origin
    res = info.resolution

    start = {'x': -(origin.position.x / res), 'y': -(origin.position.y / res)}

    img_map_ros = np.array(ros_map)
    img_map_ros = img_map_ros.reshape((height, width))

    crop = cropImage(img_map_ros)
    img_map_ros_cropped = crop['img']
    offset = crop['offset']

    img_sen = req.img
    img_map = bridge.imgmsg_to_cv2(img_sen, "bgr8")

    img_map_gray = cv2.cvtColor(img_map, cv2.COLOR_BGR2GRAY)
    ret_val, img_map_binary = cv2.threshold(img_map_gray,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
    img_map_binary = toMapColors(img_map_binary)


    crop = cropImage(img_map_binary)
    img_map_binary = crop['img']
    offset1 = crop['offset']
    
    if img_map_binary.shape[0] > img_map_binary.shape[1]:
        img_map_binary = np.transpose(img_map_binary)
        img_map_binary = cv2.flip(img_map_binary, 1)

    img_map_binary = cv2.resize(img_map_binary, (img_map_ros_cropped.shape[1], img_map_ros_cropped.shape[0]))

    img_map_binary = cv2.flip(img_map_binary, 1)
    
    #plt.figure()
    #plt.imshow(img_map_binary, cmap="gray")
    #plt.show()

    img_map_ros_cropped = removeNegative(img_map_ros_cropped)

    ret_point = findByRotating(img_map_binary, img_map_ros_cropped)

    ret_point = {'x': ret_point[0], 'y': ret_point[1]}

    ret_point_m = mapIndexToMeters(start, ret_point, res, offset)

    resp = TreasureLocatorResponse()
    resp.treasure_x = ret_point_m['x']
    resp.treasure_y = ret_point_m['y']

    return resp

def toMapColors(img):
    for i in range(0, img.shape[0]):
        for j in range(0, img.shape[1]):
            if img[i, j] == 0:
                img[i, j] = 100
            if img[i, j] == 255:
                img[i, j] = 0

    return img

def removeNegative(img):
    for i in range(0, img.shape[0]):
        for j in range(0, img.shape[1]):
            if img[i, j] < 0:
                img[i, j] = 0

    return img


def visualize(img, img_ros):
    plt.figure()
    plt.imshow(img, cmap="gray")
    plt.show()

    plt.figure()
    plt.imshow(img_ros, cmap="gray")
    plt.show()

def findByRotating(img1, img2):
    img1 = img1.astype(np.uint8)
    img2 = img2.astype(np.uint8)

    rows,cols = img1.shape

    angle = 10

    best_angle = 0
    best_similarity = 0

    while angle <= 360:
        M = cv2.getRotationMatrix2D((cols/2,rows/2),angle,1)
        rot1 = cv2.warpAffine(img1,M,(cols,rows))

        similarity = abs(correlation_coefficient(rot1, img2))
        if similarity > best_similarity:
            best_similarity = similarity
            best_angle = angle

        angle += 3

    M = cv2.getRotationMatrix2D((cols/2,rows/2),best_angle,1)
    rot1 = cv2.warpAffine(img1,M,(cols,rows))
    
    img1_org = rot1.copy()

    newImg = rot1.copy()

    ret_val, newImg = cv2.threshold(newImg,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
    kernel = np.ones((5,5),np.uint8)
    newImg = cv2.morphologyEx(newImg, cv2.MORPH_CLOSE, kernel)

    connectivity = 4  
    output = cv2.connectedComponentsWithStats(newImg, connectivity, cv2.CV_32S)
    centroids = output[3]
    stats = output[2]

    min_area = 999999
    min_indeks = -1

    for i in range(0, stats.shape[0]):
        area = stats[i, cv2.CC_STAT_AREA]
        if area < min_area:
            min_area = area
            min_indeks = i

    
    """
    f, axarr = plt.subplots(1, 2)

    axarr[0].imshow(newImg, cmap="gray")

    for cent in centroids:
        axarr[0].scatter(cent[0], cent[1], s=50, c='red', marker='o')

    axarr[1].imshow(img2, cmap="gray")
    axarr[1].scatter(centroids[min_indeks][0], centroids[min_indeks][1], s=50, c='red', marker='o')

    plt.show()
    """

    return centroids[min_indeks]


def correlation_coefficient(img1, img2):
    product = np.mean((img1 - img1.mean()) * (img2 - img2.mean()))
    stds = img1.std() * img2.std()
    if stds == 0:
        return 0
    else:
        product /= stds
        return product


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

def treasure_locator_server():
    rospy.init_node('treasure_locator_server')

    rospy.Service('treasure_locator', TreasureLocator, req_handler)
    rospy.Subscriber('map', OccupancyGrid, mapCallback)

    rospy.spin()

if __name__ == '__main__':
    treasure_locator_server()