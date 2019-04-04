#!/usr/bin/env python

### IMPORTS ###
import numpy as np
import roslib
roslib.load_manifest('task1')
import rospy
import sensor_msgs.msg
import message_filters
import tf2_ros
import tf2_geometry_msgs
from std_msgs.msg import String, Bool, ColorRGBA
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Point, Vector3, PoseStamped
### /IMPORTS ###


class TargetMarker():
    def __init__(self):  
        self.target_pub = rospy.Publisher('robot_trail', MarkerArray, queue_size=1)  # Initialize target publisher that publishes to /robot_trail topic.

        # Initialize buffer for storing targets to mark.
        self.target_buff = np.zeros((0, 3), dtype=float)
        
        # Define and initialize message counter.
        self.message_counter = 0

    def push_position(self, pos):
        try:
            self.target_buff = np.vstack((self.target_buff, pos))  # pos should be a numpy 1x3 array.
        except Exception as e:
            print e

        markers = MarkerArray()  # Initialize markers array.

        id_ctr = 0  # Define id counter
        for point in self.target_buff:
                marker = Marker()  # Initialize marker
                marker.header.stamp = rospy.Time.now()  # Stamp marker with time.
                marker.header.frame_id = '/map'  # Set header frame id.
                marker.pose.position = Point(point[0], point[1], point[2])  # Set position of marker.
                marker.type = Marker.CUBE  # Set marker properties.
                marker.action = Marker.ADD
                marker.frame_locked = False
                marker.lifetime = rospy.Time(0)
                marker.id = id_ctr  # Set marker's id.
                marker.scale = Vector3(0.1, 0.1, 0.1)  # Set scale of marker.
                marker.color = ColorRGBA(1, 1, 0, 1)  # Set color of marker.
                markers.markers.append(marker)  # Append marker to array of markers.
                id_ctr = id_ctr + 1  # Increment id counter.

        self.target_pub.publish(markers)  # Publish markers.
        self.message_counter = self.message_counter + 1  # Increment message counter.

