#!/usr/bin/env python

import rospy
import roslib

roslib.load_manifest('task1')
import sensor_msgs.msg
import message_filters
import tf2_ros
import tf2_geometry_msgs
from std_msgs.msg import String, Bool, ColorRGBA
from geometry_msgs.msg import PoseStamped
from task1.msg import EllipseSearch
from task1.srv import EllipseLocation

import numpy as np

# Define buffer and allocate array for storing arrays containing data about
# found ellipses.
BUFF_SIZE = 50
buff = np.empty((BUFF_SIZE, 6), dtype=object)

# Initialize coordinate transform buffer and listener.
self.tf2_buffer = tf2_ros.Buffer()
self.tf2_listener = tf2_ros.TransformListener(self.tf2_buffer) 

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
    global buff_ptr

    if data.found:
        for k in np.arange(len(data.dpt)):
            # TODO handle all found ellipses

            # Check for buffer overflow.
            if buff_ptr >= BUFF_SIZE:
                raise BufferError("Attempting to add object to full buffer")
            
            # NOTE: This may raise an exception if data not available!
            # Get transformation of point using robot position and map position when the image was taken.
            delta_time = rospy.Time.now() - rospy.Time.from_seconds(data.timestamp[k])  # get delta time.
            trans = self.tf2_buffer.lookup_transform_full(target_frame='base_link',\
                                    target_time=rospy.Time.now()-delta_time,\
                                    source_frame='map',\
                                    source_time=rospy.Time.now()-delta_time,\
                                    fixed_frame='world')

            # Get point corresponding to the ellipse.
            pos_nxt = PoseStamped()
            pos_nxt.pose.position.x = data.dpt[k]*np.cos(data.agl[k])
            pos_nxt.pose.position.y = (data.dpt[k]*np.cos(data.agl[k]))*np.tan(data.agl[k])
            pos_nxt_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt, trans)

            # NOTE: If angle is positive, reduce x, if angle is negative, increase x.

            # Solve quadratic equation to get point a specified distance perpendicular to the
            # face of the ellipse.
            
            # c -- perpendicular distance to face of ellipse
            # a -- x coordinate of the ellipse center
            # b -- y coordinate of the ellipse center
            # k -- tan of the angle of the line perpendicular to the face of the ellipse 
            # m -- y intercept of the line perpendicular to the face of the ellipse 
            
            c = 1.0
            a = pos_nxt.position.x
            b = pos_nxt.position.y
            k = data.perp_agl[k]
            m = data.perp_y_itrcpt[k]

            # Necessary change in x to achieve position 1.0 units before the ellipse face. 
            dx1 = (-np.sqrt(-(a*k - b + m)**2) + a + b*k - k*m)/(k**2 + 1)
            dx2 = (np.sqrt(-(a*k - b + m)**2) + a + b*k - k*m)/(k**2 + 1)

            # Get goal point in front of the face of the ellipse.
            pos_nxt_approach_pt = PoseStamped()
            pos_nxt_approach_pt.pose.position.x = pos_nxt.pose.position.x + dx1 if data.agl[k] < 0 else pos_nxt.pose.position.x + dx2
            pos_nxt_approach_pt.pose.position.y = pos_nxt.pose.position.y + dx1*k + m if data.agl[k] < 0 else pos_nxt.pose.position.y + dx2*k + m
            pos_nxt_approach_pt.pose.position.z = np.arctan(k)

            # Transform position to world coordinate system
            pos_nxt_approach_transformed = tf2_geometry_msgs.do_transform_pose(pos_nxt_approach_pt, trans)

            # Save resuls in buffer.
            res = np.empty(6, dtype=float)
            res[:3] = np.array([pos_nxt_transformed.pose.position.x, pos_nxt_transformed.pose.position.y, pos_nxt_transformed.pose.position.z])
            res[3:] = np.array([pos_nxt_approach_transformed.pose.position.x, pos_nxt_approach_transformed.pose.position.y, pos_nxt_approach_transformed.pose.position.z])

            # Add data to buffer and increment buffer pointer.
            buff[buff_ptr, :] = res
            buff_ptr += 1
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
        buff_ptr -= 1
    else:
        return None


def ellipse_locator_server():

    """
    function that implements a service that subscribes to the /ellipses topic broadcasted by the robot,
    stores a buffer of data about found ellipses and on call to this service returns the next object encapsulating
    the data in the buffer.
    """

    # Subscribe to /ellipses topic broadcasted by the robot.
    rospy.Subscriber('ellipses', EllipseData, callback)
    # Initialize service.
    rospy.init_node('ellipse_locator')
    rospy.Service('ellipse_locator', EllipseLocator, req_handler)
    # Wait for requests.
    rospy.spin()

if __name__ == '__main__':
    ellipse_locator_server()
