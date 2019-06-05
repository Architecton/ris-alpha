#!/usr/bin/env python

### IMPORTS ###
import rospy
import roslib

roslib.load_manifest('task3')
import sensor_msgs.msg
import message_filters
import tf2_ros
import tf2_geometry_msgs
from std_msgs.msg import String, Bool, ColorRGBA
from geometry_msgs.msg import PoseStamped

from target_marking.targetmarker import TargetMarker

from task3.msg import CylinderData
from task3.msg import ScanFlag
from task3.msg import CheckpointProcessorResponse

from task3.srv import CylinderLocator
from task3.srv import CheckpointProcessor

import time
import numpy as np

import pdb

### /IMPORTS ###





### INITIALIZATION ###

tf2_buffer = None
tf2_listener = None
DIFF_THRESH = 0.5
scan_flag = 0
buff_ptr = 0

tm = TargetMarker()

### /INITIALIZATION ###



def changePermission(data):

    """
    callback executed when scanning permission changes.
    
    Args:
        data -- contains flag that is set to 1 if robot is in a state required to get good images
                and 0 if not.

    Returns:
        None
    """

    
    # variables from outer namespace.
    global scan_flag
    global buff
    global buff_ptr
    global buff2
    global BUFF2_SIZE
    global buff2_ptr
    global tm

    # Get scan flag.
    scan_flag = data.flag

    # If recieved signal to stop scanning and if buffer contains more than 5 elements,
    # add mediann to buffer.
    if scan_flag == 0 and buff2_ptr > 5:
        res = np.median(buff2[:buff2_ptr, :], 0)
        buff[buff_ptr] = res
        buff_ptr += 1
        buff2_ptr = 0


        ### DEBUGGING VISUALIZATION ###
        tm.push_position(res[:3])
        tm.push_position(res[3:6])
        ### /DEBUGGING VISUALIZATION ###


def callback(data):

    """
    callback for processing data retrieved from the subscribed topic

    Args:
        data -- Object representing data about the next cylinder query

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
        for cyl_idx in np.arange(len(data.dpt)):  # Go over all found cylinders.

            # Check for buffer overflow.
            if buff2_ptr >= BUFF2_SIZE:
                raise BufferError("Attempting to add object to full buffer")
            
            # Get transformation of point using robot position and map position when the image was taken.
            trans = tf2_buffer.lookup_transform(target_frame='map',\
                                    source_frame='base_link',\
                                    time=rospy.Time.from_seconds(data.timestamp[cyl_idx]),\
                                    #time=rospy.Time.now() - rospy.Duration(1.),\
                                    timeout=rospy.Duration(1.0))

            # Get point in map coordiates corresponding to the cylinder.
            pos_nxt = PoseStamped()
            pos_nxt.pose.position.x = data.dpt[cyl_idx]*np.cos(data.agl[cyl_idx])
            pos_nxt.pose.position.y = -data.dpt[cyl_idx]*np.sin(data.agl[cyl_idx])
            pos_nxt_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt, trans)

            if (lambda x: np.sqrt(np.sum(x**2)))(np.array([pos_nxt.pose.position.x, pos_nxt.pose.position.y])) > 1.8:
                break

            fixed_pos_nxt_transformed = approach_checkpoint_processor(pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y)
            if fixed_pos_nxt_transformed.valid:
                pos_nxt_transformed.pose.position.x = fixed_pos_nxt_transformed.output_x
                pos_nxt_transformed.pose.position.y = fixed_pos_nxt_transformed.output_y
            else:
                break

            # Check if cylinder already in buffer.
            """
            if buff2_ptr > 0:
                if np.any((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(np.array([pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y]), buff2[:, :2]) < DIFF_THRESH):
                    break
            else:  # No need to check if buffer empty.
                pass
            """


            # Get approach point line 

            # Get line equation
            k = pos_nxt.pose.position.y/pos_nxt.pose.position.x


            # Solve quadratic equation to get point a specified distance perpendicular to the
            # face of the cylinder.
            
            # c -- perpendicular distance to face of cylinder.
            # a -- x coordinate of the cylinder center
            # b -- y coordinate of the cylinder center
            # k -- tan of the angle of the line perpendicular to the face of the cylinder 
            # m -- y intercept of the line perpendicular to the face of the cylinder 
            
            c = 0.83
            # alternative: b = a*k + m
            #k = np.tan(data.perp_agl[cyl_idx])
            #m = pos_nxt.pose.position.y - k*pos_nxt.pose.position.y 
            # m = data.perp_y_itrcpt[cyl_idx]

            # Necessary change in x to achieve position 1.0 units before the cylinder face.
            # NOTE: two solutions to quadratic equation.
            dx1 = -(c**2/np.sqrt(k**2 + 1))
            #dx2 = c**2/np.sqrt(k**2 + 1)

            # Get goal point in front of the face of the cylinder.
            pos_nxt_approach_pt = PoseStamped()

            # Increment/Decrement x and y to get position in front of the cylinder perpendicular to its face.
            pos_nxt_approach_pt.pose.position.x = pos_nxt.pose.position.x + dx1 #if data.agl[cyl_idx] < 0 else pos_nxt.pose.position.x + dx2
            pos_nxt_approach_pt.pose.position.y = pos_nxt.pose.position.y + dx1*k #if data.agl[cyl_idx] < 0 else pos_nxt.pose.position.y + dx2*k
            pos_nxt_approach_pt.pose.position.z = data.perp_agl[cyl_idx]

            # Transform approach goal position to map coordinate system.
            pos_nxt_approach_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt_approach_pt, trans)

            # Save resuls in buffer.
            # First three elements correspond to the coordinates of the face of the cylinder and the last three correspond to the target spot in front
            # of the cylinder face, perpendicular to it.
            res = np.empty(10, dtype=float)
            res[:3] = np.array([pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y, pos_nxt_transformed.pose.position.z])
            res[3:6] = np.array([pos_nxt_approach_transformed.pose.position.x, pos_nxt_approach_transformed.pose.position.y, pos_nxt_approach_transformed.pose.position.z])
            res[6:] = np.array([trans.transform.rotation.x, trans.transform.rotation.y, trans.transform.rotation.z, trans.transform.rotation.w])
        

            ### DEBUGGING VISUALIZATION ###
            # tm.push_position(res[:3])
            # tm.push_position(res[3:])
            ### /DEBUGGING VISUALIZATION ###

            # Add data to buffer and increment buffer pointer.
            buff2[buff2_ptr, :] = res
            buff2_ptr += 1
    else:
        pass

def req_handler(req):
    """
    request handler for handling calls to this service's services.

    Args:
        req -- request parameters (None)

    Returns:
        Object representing information about the next cylinder location that is found at the top of the
        buffer (stack)
    """

    # Declare global buffer and pointer to top of buffer (stack).
    global buff
    global buff_ptr 

    # Check if buffer not empty.
    if buff_ptr > 0:
        buff_ptr -= 1  # Decrement buffer pointer.
        return buff[buff_ptr, :]
    else:
        return []  # If buffer empty, return an empty array.


def cylinder_locator_server():

    """
    function that implements a service that subscribes to the /cylinders topic broadcasted by the robot,
    stores a buffer of data about found cylinders and on call to this service returns the next object encapsulating
    the data in the buffer.
    """

    # Subscribe to /cylinders topic broadcasted by the robot's computer.
    rospy.Subscriber('cylinder_data', CylinderData, callback)

    # Subscribe to /scan_perm topic that is broadcasted by the robot controlling node
    # and contains messages that signal whether robot is in correct state for taking good
    # images.
    rospy.Subscriber('scan_perm_cyl', ScanFlag, changePermission)

    # Initialize service.
    rospy.Service('cylinder_locator', CylinderLocator, req_handler)

    # Wait for requests.
    rospy.spin()

if __name__ == '__main__':

    # Initialize buffer.
    BUFF_SIZE = 500
    buff = np.ones((BUFF_SIZE, 10), dtype=float) * 1000
    buff_ptr = 0  # Initialize buffer pointer.

    BUFF2_SIZE = 1000000
    buff2 = np.ones((BUFF2_SIZE, 10), dtype=float) * 1000
    buff2_ptr = 0

    # Initialize coordinate transform buffer and listener.
    rospy.init_node('cylinder_locator')

    try:
        approach_checkpoint_processor = rospy.ServiceProxy('checkpoint_processor', CheckpointProcessor)
    except rospy.ServiceException, e:
        print "Service error: {0}".format(e.message)


    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)
    rospy.sleep(5)  # Wait for cache to fill.

    # Initialize service.
    cylinder_locator_server()
    
