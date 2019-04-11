#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image

i = 0;

def callback(data):
    global i

    f = open("/home/miha/points_"+str(i)+".txt", "w+")
    f.write(data.data)
    f.close()
    i += 1

def listener():
    rospy.init_node('depth_cloud_subscriber', anonymous = True) 
    rospy.Subscriber('camera/depth/image_raw', Image, callback) 
    rospy.spin() 


if __name__ == '__main__':
    listener()
