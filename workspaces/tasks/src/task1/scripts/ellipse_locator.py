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

# Import message type received as data retrieved from callback.
from task1.msg import EllipseData
# Import service that is implemented by this file.
from task1.srv import EllipseLocator

import numpy as np

tf2_buffer = None
tf2_listener = None

### /IMPORTS ###

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

    # Declare global tf2 buffer and listener.
    global tf2_buffer
    global tf2_listener
    
    # If data.found flag set to 1...
    if data.found:
        print "ellipse in view"
        for k in np.arange(len(data.dpt)):  # Go over all found ellipses.

            # Check for buffer overflow.
            if buff_ptr >= BUFF_SIZE:
                raise BufferError("Attempting to add object to full buffer")
            
            # NOTE: This may raise an exception if data not available!
            # Get transformation of point using robot position and map position when the image was taken.

            delta_time = rospy.Time.now() - rospy.Time.from_seconds(data.timestamp[k])  # get delta time.
            trans = tf2_buffer.lookup_transform(target_frame='base_link',\
                                    source_frame='map',\
                                    time=rospy.Time.now()-delta_time,\
                                    timeout=rospy.Duration(0.1))

            # Get point in map coordiates corresponding to the ellipse.
            pos_nxt = PoseStamped()
            pos_nxt.pose.position.x = data.dpt[k]*np.cos(data.agl[k])
            pos_nxt.pose.position.y = data.dpt[k]*np.sin(data.agl[k])
            pos_nxt_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt, trans)

            # Check if ellipse already in buffer.
            if buff.shape[0] > 0:
                if np.any((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(np.array([pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y]), buff[:, :2]) < DIFF_THRESH):
                    print "Ellipse already in buffer! breaking..."
                    break
            else:  # No need to check if buffer empty.
                pass


            # NOTE: If angle is positive, reduce x, if angle is negative, increase x.

            # Solve quadratic equation to get point a specified distance perpendicular to the
            # face of the ellipse.
            
            # c -- perpendicular distance to face of ellipse
            # a -- x coordinate of the ellipse center
            # b -- y coordinate of the ellipse center
            # k -- tan of the angle of the line perpendicular to the face of the ellipse 
            # m -- y intercept of the line perpendicular to the face of the ellipse 
            
            c = 0.5
            # alternative: b = a*k + m
            k = np.tan(data.perp_agl[k])
            m = data.perp_y_itrcpt[k]

            # Necessary change in x to achieve position 1.0 units before the ellipse face.
            # NOTE: two solutions to quadratic equation.
            dx1 = -(c**2/np.sqrt(k**2 + 1))
            dx2 = c**2/np.sqrt(k**2 + 1)

            # Get goal point in front of the face of the ellipse.
            pos_nxt_approach_pt = PoseStamped()

            # Increment/Decrement x and y to get position in front of the ellipse perpendicular to its face.
            pos_nxt_approach_pt.pose.position.x = pos_nxt.pose.position.x + dx1 if data.agl[k] < 0 else pos_nxt.pose.position.x + dx2
            pos_nxt_approach_pt.pose.position.y = pos_nxt.pose.position.y + dx1*k + m if data.agl[k] < 0 else pos_nxt.pose.position.y + dx2*k + m
            pos_nxt_approach_pt.pose.position.z = np.arctan(k)

            # Transform approach goal position to map coordinate system.
            pos_nxt_approach_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt_approach_pt, trans)

            # Save resuls in buffer.
            # First three elements correspond to the coordinates of the face of the ellipse and the last three correspond to the target spot in front
            # of the ellipse face, perpendicular to it.
            res = np.empty(6, dtype=float)
            res[:3] = np.array([pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y, pos_nxt_transformed.pose.position.z])
            res[3:] = np.array([pos_nxt_approach_transformed.pose.position.x, pos_nxt_approach_transformed.pose.position.y, pos_nxt_approach_transformed.pose.position.z])

            print "Adding following to buffer:"
            print res

            # Add data to buffer and increment buffer pointer.
            buff[buff_ptr, :] = res
            buff_ptr += 1
    else:
        print('not found')
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
        return []  # If buffer empty, return none.


def ellipse_locator_server():

    """
    function that implements a service that subscribes to the /ellipses topic broadcasted by the robot,
    stores a buffer of data about found ellipses and on call to this service returns the next object encapsulating
    the data in the buffer.
    """

    # Set threshold for declaring a distinct ellise.
    # TODO: empirically set threshold.
    DIFF_THRESH = 0.5


    # Define buffer and allocate array for storing arrays containing data about
    # found ellipses.


    

    # Subscribe to /rings topic broadcasted by the robot's computer.
    rospy.Subscriber('rings', EllipseData, callback)
    # Initialize service.
    rospy.Service('ellipse_locator', EllipseLocator, req_handler)
    # Wait for requests.
    rospy.spin()

if __name__ == '__main__':
    # Initialize buffer.

    BUFF_SIZE = 50
    buff = np.empty((BUFF_SIZE, 6), dtype=object)
    buff_ptr = 0  # Initialize buffer pointer.
    # Initialize coordinate transform buffer and listener.
    rospy.init_node('ellipse_locator')
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)
    rospy.sleep(3)

    ellipse_locator_server()
    
