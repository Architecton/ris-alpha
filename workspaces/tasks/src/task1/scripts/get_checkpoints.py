#!/usr/bin/env python

import rospy
from task1.srv import Checkpoint_res
from task1.msg import Checkpoints
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

def mapCallback(data):
    global ros_map
    global info

    ros_map = data.data
    info = data.info

def req_handler(req):


    checkpoints = Checkpoints()

    num_of_checkpoints = req.num_of_checkpoints

    #rospy.wait_for_service('static_map')

    #print(info);

    width = info.width
    height = info.height

    origin = info.origin

    res = info.resolution

    start = {}
    start['x'] = -(origin.position.x / res);
    start['y'] = -(origin.position.y / res);

    img = np.array(ros_map) 
    img = img.reshape((info.height, info.width))

    crop = cropImage(img)
    new_img = crop['img']
    offset = crop['offset']

    print start
    #print mapIndexToMeters(start, {'x': 244, 'y': 20}, res, offset)
    print mapIndexToMeters(start, {'x': 40, 'y': 10}, res, offset)



    #img = np.random.random((100, 100))

    #points = getRandomPoints(new_img, 400, 5)

    points = k_means(new_img, 400, num_of_checkpoints, 4)
    means = get_means(points)

    for clas, point in means.items():
        if new_img[point['y'], point['x']] == 0:
            pointMeters = mapIndexToMeters(start, point, res, offset)
            p = Point()
            p.x = pointMeters['x']
            p.y = pointMeters['y']
            p.z = 0.850
            checkpoints.points.append(p)
    
    #visualize(new_img, points, means)

    #cv2.imshow("image", ros_map);
    #cv2.waitKey();

    #checkpoints.points.append(p1)
    #checkpoints.points.append(p2)
    #checkpoints.points.append(p3)

    return checkpoints

def visualize(img, points, means):
    plt.figure()
    plt.imshow(img, cmap="gray")
    
    colors = ['red', 'blue', 'green', 'yellow', 'orange', 'olive', 'aqua', 'seagreen', 'pink', 'purple', 'plum', 'maroon', 'khaki', 'silver']

    for clas in means:
        if img[means[clas]['y'], means[clas]['x']] == 0:
            plt.scatter(means[clas]['x'], means[clas]['y'], s=50, c=colors[int(clas)], marker='o')

    #for clas in points:
    #   plt.scatter(points[clas]['x'], points[clas]['y'], s=50, c=colors[int(clas)], marker='o')
        

    plt.show()

def k_means(img, n, k, iterations):
    #for i in range(it):
    points = getRandomPoints(img, n, k)

    for it in range(iterations):
        means = get_means(points)

        new_points = {}

        for clas in points:
            for i in range(len(points[clas]['x'])):
                index = ''
                min_dist = sys.maxsize
                for r in means:
                    #print means
                    dist = euclidian([points[clas]['x'][i], points[clas]['y'][i]], [means[r]['x'], means[r]['y']])
                    if dist < min_dist:
                        min_dist = dist
                        index = str(r)

                if index not in new_points:
                    new_points[index] = {}
                if 'x' not in new_points[index]:
                    new_points[index]['x'] = []    
                if 'y' not in new_points[index]:
                    new_points[index]['y'] = []    
                if 'r' not in new_points[index]:
                    new_points[index]['r'] = []    

                new_points[index]['x'].append(points[clas]['x'][i])
                new_points[index]['y'].append(points[clas]['y'][i])
                new_points[index]['r'].append(index)
        points = new_points

    return points

def euclidian(p1, p2):
    return math.sqrt(pow(p2[0]-p1[0], 2) + pow(p2[1]-p1[1], 2))

def get_means(points):

    means = {}

    #print points

    for clas in points:
        mean_x = np.mean(np.array(points[clas]['x']))
        mean_y = np.mean(np.array(points[clas]['y']))

        if clas not in means:
            means[clas] = []

        means[clas] = {'x': mean_x, 'y': mean_y}

    return means

def getRandomPoints(img, n, k):
    offset_x = 0.1*img.shape[1]
    offset_y = 0.1*img.shape[0]

    x = []
    y = []
    c = []

    #x = np.random.randint(low=offset_x, high=img.shape[1]-offset_x, size=n)
    #y = np.random.randint(low=offset_y, high=img.shape[0]-offset_y, size=n)
    #c = np.random.randint(low=0, high=k, size=n)

    for i in range(n):
        xi = np.random.randint(low=offset_x, high=img.shape[1]-offset_x, size=1)[0]
        yi = np.random.randint(low=offset_y, high=img.shape[0]-offset_y, size=1)[0]
        ci = np.random.randint(low=0, high=k, size=1)[0]
        if img[yi, xi] == 0:
            x.append(xi)
            y.append(yi)
            c.append(ci)

    ret = {}

    for i in range(len(c)):
        if str(c[i]) not in ret:
            ret[str(c[i])] = {}
        if 'x' not in ret[str(c[i])]:
            ret[str(c[i])]['x'] = []    
        if 'y' not in ret[str(c[i])]:
            ret[str(c[i])]['y'] = []    
        if 'r' not in ret[str(c[i])]:
            ret[str(c[i])]['r'] = []    
        #ret[str(c[i])].append({'x': x[i], 'y': y[i], 'r': c[i]})
        ret[str(c[i])]['x'].append(x[i])
        ret[str(c[i])]['y'].append(y[i])
        ret[str(c[i])]['r'].append(c[i])


    #colors = ['red', 'blue', 'green', 'yellow', 'orange']
    #cs = []
    #for b in c:
    #    cs.append(colors[b])

    #return {'x': x, 'y': y, 'r': c, 'c': cs}
    #return {'x': x, 'y': y, 'r': c}
    return ret

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


def mapIndexToMeters(start, point, res, offset):
    x_d = (point['x'] + offset['x']) - round(start['x'], 0)
    y_d = (point['y'] + offset['y']) - round(start['y'], 0)

    x = x_d*res
    y = y_d*res

    return {'x': x, 'y': y}

def get_checkpoints_server():
    rospy.init_node('get_checkpoints_server')

    rospy.Service('get_checkpoints', Checkpoint_res, req_handler)
    rospy.Subscriber('map', OccupancyGrid, mapCallback)

    rospy.spin()

if __name__ == '__main__':
    get_checkpoints_server()
