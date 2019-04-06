#!/usr/bin/env python

### IMPORTS ###
import rospy
import roslib

roslib.load_manifest('task1')
import sensor_msgs.msg
import message_filters
import tf2_ros
import tf2_geometry_msgs
from std_msgs.msg import String, Bool, ColorRGBA
from geometry_msgs.msg import PoseStamped

from targetmarker import TargetMarker

# Import message type received as data retrieved from callback.
from task1.msg import EllipseData
from task1.msg import ScanFlag

# Import service that is implemented by this file.
from task1.srv import EllipseLocator

import time
import numpy as np

import pdb

tf2_buffer = None
tf2_listener = None
DIFF_THRESH = 0.5
scan_flag = 0

### /IMPORTS ###

def changePermission(data):
    """
    callback executed when scanning permission changes.
    
    Args:
        data -- contains flag that is set to 1 if robot is in a state required to get good images
                and 0 if not.

    Returns:
        None
    """
    global scan_flag

    global buff
    global buff_ptr

    global buff2
    global BUFF2_SIZE
    global buff2_ptr


    scan_flag = data.flag
 
    tm = TargetMarker()

    if scan_flag == 0 and buff2_ptr > 1:
        res = np.median(buff[:buff2_ptr, :], 0)
        buff[buff_ptr] = res
        buff_ptr += 1
        buff2_ptr = 0
        ### DEBUGGING VISUALIZATION ###
        tm.push_position(res[:3])
        tm.push_position(res[3:])
        ### /DEBUGGING VISUALIZATION ###


def callback(data):

    """
    callback for processing data retrieved from the subscribed topic

    Args:
        data -- Object representing data about the next ellipses query

    Returns:
        None

    Raises:
        BufferError -- attempting to add data to a full buffer
    """

    # Declare global buffer and pointer to top of buffer (stack).
    global buff
    global BUFF_SIZE
    global buff_ptr
    global DIFF_THRESH

    global buff2
    global BUFF2_SIZE
    global buff2_ptr

    # Declare global tf2 buffer and listener.
    global tf2_buffer
    global tf2_listener

    # Declare global flag that signals if robot is in a state to get good images.
    global scan_flag

    
    # Initialize target marker.
    # If data.found flag set to 1 and robot in state to get good images...
    if data.found and scan_flag == 1:
        print "ellipse found"
        for ell_idx in np.arange(len(data.dpt)):  # Go over all found ellipses.

            # Check for buffer overflow.
            if buff_ptr >= BUFF_SIZE:
                raise BufferError("Attempting to add object to full buffer")
            
            # Get transformation of point using robot position and map position when the image was taken.

            trans = tf2_buffer.lookup_transform(target_frame='map',\
                                    source_frame='base_link',\
                                    time=rospy.Time.from_seconds(data.timestamp[ell_idx]),\
                                    #time=rospy.Time.now() - rospy.Duration(1.),\
                                    timeout=rospy.Duration(1.0))

            # Get point in map coordiates corresponding to the ellipse.
            pos_nxt = PoseStamped()
            pos_nxt.pose.position.x = data.dpt[ell_idx]*np.cos(data.agl[ell_idx])
            pos_nxt.pose.position.y = -data.dpt[ell_idx]*np.sin(data.agl[ell_idx])
            pos_nxt_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt, trans)

            # Check if ellipse already in buffer.
            """
            if buff2_ptr > 0:
                if np.any((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(np.array([pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y]), buff2[:, :2]) < DIFF_THRESH):
                    break
            else:  # No need to check if buffer empty.
                pass
            """


            # Solve quadratic equation to get point a specified distance perpendicular to the
            # face of the ellipse.
            
            # c -- perpendicular distance to face of ellipse
            # a -- x coordinate of the ellipse center
            # b -- y coordinate of the ellipse center
            # k -- tan of the angle of the line perpendicular to the face of the ellipse 
            # m -- y intercept of the line perpendicular to the face of the ellipse 
            
            c = 0.6
            # alternative: b = a*k + m
            k = np.tan(data.perp_agl[ell_idx])
            m = pos_nxt.pose.position.y - k*pos_nxt.pose.position.y 
            # m = data.perp_y_itrcpt[ell_idx]

            # Necessary change in x to achieve position 1.0 units before the ellipse face.
            # NOTE: two solutions to quadratic equation.
            dx1 = -(c**2/np.sqrt(k**2 + 1))
            # dx2 = c**2/np.sqrt(k**2 + 1)

            # Get goal point in front of the face of the ellipse.
            pos_nxt_approach_pt = PoseStamped()

            # Increment/Decrement x and y to get position in front of the ellipse perpendicular to its face.
            pos_nxt_approach_pt.pose.position.x = pos_nxt.pose.position.x + dx1 #if data.agl[ell_idx] < 0 else pos_nxt.pose.position.x + dx2
            pos_nxt_approach_pt.pose.position.y = pos_nxt.pose.position.y + dx1*k + m #if data.agl[ell_idx] < 0 else pos_nxt.pose.position.y + dx2*k + m
            pos_nxt_approach_pt.pose.position.z = data.perp_agl[ell_idx]

            # Transform approach goal position to map coordinate system.
            pos_nxt_approach_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt_approach_pt, trans)

            # Save resuls in buffer.
            # First three elements correspond to the coordinates of the face of the ellipse and the last three correspond to the target spot in front
            # of the ellipse face, perpendicular to it.
            res = np.empty(6, dtype=float)
            res[:3] = np.array([pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y, pos_nxt_transformed.pose.position.z])
            res[3:] = np.array([pos_nxt_approach_transformed.pose.position.x, pos_nxt_approach_transformed.pose.position.y, pos_nxt_approach_transformed.pose.position.z])
        

            ### DEBUGGING VISUALIZATION ###
            # tm.push_position(res[:3])
            # tm.push_position(res[3:])
            ### /DEBUGGING VISUALIZATION ###

            # Add data to buffer and increment buffer pointer.
            buff2[buff_ptr2, :] = res
            buff2_ptr += 1
    else:
        pass

def req_handler(req):
    """
    request handler for handling calls to this service's services.

    Args:
        req -- request parameters (None)

    Returns:
        Object representing information about the next ellipse location that is found at the top of the
        buffer (stack)
    """

    # Declare global buffer and pointer to top of buffer (stack).
    global buff
    global buff_ptr 

    # Check if buffer not empty.
    if buff_ptr > 0:
        return buff[buff_ptr-1, :]
        buff_ptr -= 1  # Decrement buffer pointer.
    else:
        return []  # If buffer empty, return an empty array.


def ellipse_locator_server():

    """
    function that implements a service that subscribes to the /ellipses topic broadcasted by the robot,
    stores a buffer of data about found ellipses and on call to this service returns the next object encapsulating
    the data in the buffer.
    """

    # Subscribe to /rings topic broadcasted by the robot's computer.
    rospy.Subscriber('rings', EllipseData, callback)

    # Subscribe to /scan_perm topic that is broadcasted by the robot controlling node
    # and contains messages that signal whether robot is in correct state for taking good
    # images.
    rospy.Subscriber('scan_perm', ScanFlag, changePermission)

    # Initialize service.
    rospy.Service('ellipse_locator', EllipseLocator, req_handler)

    # Wait for requests.
    rospy.spin()

if __name__ == '__main__':

    # Initialize buffer.
    BUFF_SIZE = 50
    buff = np.ones((BUFF_SIZE, 6), dtype=float) * 1000
    buff_ptr = 0  # Initialize buffer pointer.

    BUFF2_SIZE = 1000000
    buff2 = np.ones((BUFF2_SIZE, 6), dtype=float) * 1000
    buff2_ptr = 0

    # Initialize coordinate transform buffer and listener.
    rospy.init_node('ellipse_locator')
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)
    rospy.sleep(5)  # Wait for cache to fill.

    # Initialize service.
    ellipse_locator_server()
    
