#!/usr/bin/env python


### IMPORTS ###

import numpy as np
import roslib
roslib.load_manifest('task1')
import rospy
import sensor_msgs.msg
import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

import tf2_ros
import tf2_geometry_msgs
from geometry_msgs.msg import Point, Vector3, PoseStamped, Twist

from targetmarker import TargetMarker
from task1.srv import EllipseLocator

from task1.srv import Checkpoint_res
from task1.msg import Checkpoints

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient

import time

import pdb


import sys
### /IMPORTS ###


rotation_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)




### INITIALIZATIONS ###

# Initialize main node.
rospy.init_node('main')

# Initialize TargetMarker instance.
tm = TargetMarker()

# Initialize action clients
ac_chkpnts = actionlib.SimpleActionClient("move_base", MoveBaseAction)
ac_ellipses = actionlib.SimpleActionClient("move_base", MoveBaseAction)

# Initialize checkpoints array.
# TODO: integrate with Miha's part.

rospy.wait_for_service('get_checkpoints')

try:
    serv = rospy.ServiceProxy('get_checkpoints', Checkpoint_res)
except rospy.ServiceException, e:
    print "Service error: {0}".format(e.message)

# Call checkpoints generating service.
checkpoints_res = serv(8)

# Allocate array for storing checkpoints.
checkpoints = np.empty((0, 3), dtype=float)

NUM_ROTATIONS = 8  # Number of different angles to check
rotation_agl = 2*np.pi/NUM_ROTATIONS  # Get angle for a single rotation
agl_increments = np.array(np.arange(NUM_ROTATIONS))*rotation_agl  # Get angle increments

for point in checkpoints_res.points.points:
    # Get next checkpoints batch.
    checkpoints_nxt = np.repeat(np.array([[point.x, point.y, point.z]]), NUM_ROTATIONS, axis=0)
    checkpoints_nxt[:, -1] = checkpoints_nxt[:, -1] + agl_increments
    checkpoints = np.vstack((checkpoints, checkpoints_nxt))


#checkpoints = np.array([[-1.276, 2.121, 0.850], [0.421, 0.166, 0.597], [2.195, 0.723, 0.999], [1.832, 2.986, 0.882], [0.036, 2.124, 0.855]])


checkpoint_ctr = 0  # Initialize found ellipses counter.

# Initialize found ellipses storage.
# First two fields store the coordinates of the ellipse center. The third field stores the perpendicular angle.
resolved_ell = np.empty((0, 3), dtype=float)
resolved_ell_ctr = 0  # Initialize resolved ellipses counter.

# Set distance threshold to consider ellipse as unresolved.
# TODO: empirically determine best threshold.
DISTINCT_ELL_THRESH = 1.5

# Initialize coordinate transforms buffer.
tf2_buffer = tf2_ros.Buffer()
tf2_listener = tf2_ros.TransformListener(tf2_buffer)

# Get robot position in map coordinates.
rospy.sleep(5)  # Wait for cache to fill.
trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z]) 

# Wait for ellipse data buffer query service to come online and make a proxy function.
#rospy.wait_for_service('ellipse_locator')
#ellipse_locator = rospy.ServiceProxy('ellipse_locator', EllipseLocator)

# Initialize sound node.

#rospy.init_node('say', anonymous = True)
soundhandle = SoundClient()
rospy.sleep(1)
voice = 'voice_kal_diphone'
volume = 1.0

### /INITIALIZATIONS ###


# While there are checkpoints left **main search loop**
while checkpoints.shape[0] > 0:

    # Get index of closest checkpoint.
    idx_nxt = np.argmin((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(robot_pos, checkpoints))

    
    # Create goal for next checkpoint.
    goal_chkpt = MoveBaseGoal()
    goal_chkpt.target_pose.header.frame_id = "map"
    goal_chkpt.target_pose.header.stamp = rospy.Time.now()
    goal_chkpt.target_pose.pose.position.x = checkpoints[idx_nxt, 0]
    goal_chkpt.target_pose.pose.position.y = checkpoints[idx_nxt, 1]
    goal_chkpt.target_pose.pose.orientation.w = checkpoints[idx_nxt, 2]

    goal_chkpnt_status = GoalStatus.LOST  # Set status for next checkpoint goal.
    ac_chkpnts.send_goal(goal_chkpt) # Send checkpoint goal.
    rospy.loginfo("Resolving checkpoint {0}".format(checkpoint_ctr))

    # Loop for next checkpoint goal.
    while not goal_chkpnt_status == GoalStatus.SUCCEEDED:
        """
        # Check if any ellipses if buffer.
        try:  # Initialize resolved ellipses counter.
            # Query into ellipse data buffer.
            ellipse_data = ellipse_locator().target
            
            # If ellipse data found in buffer, create new ellipse resolution goal.
            if len(ellipse_data) > 0:

                # Check if ellipse had not yet been resolved.
                if not np.any((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(np.array([ellipse_data[0], ellipse_data[1], ellipse_data[5]]), resolved_ell) < DISTINCT_ELL_THRESH):
                 


                    ### DEBUG PLOT ###

                    # DEBUG mark goal - mark ellipse center location.
                    tm.push_position(np.array(ellipse_data[:3]))

                    rospy.loginfo("Ellipse detected")

                    # tm.push_position(np.array(ellipse_data[3:])) # if marking ellipse approach target.

                    ### /DEBUG PLOT ###


                    # Create goal to approach found ellipse.
                    goal_ell = MoveBaseGoal()
                    goal_ell.target_pose.header.frame_id = "map"
                    goal_ell.target_pose.header.stamp = rospy.Time.now()
                    goal_ell.target_pose.pose.position.x = ellipse_data[3]  # Set goal in front of face of the ellipse.
                    goal_ell.target_pose.pose.position.y = ellipse_data[4]
                    goal_ell.target_pose.pose.orientation.w = ellipse_data[5]

                    # Initialize goal status.
                    goal_nxt_ell_status = GoalStatus.LOST

                    # Send goal to action manager for resolving ellipses - preempt checkpoint search goal.
                    ac_ellipses.send_goal(goal_ell)

                    # Go to position.
                    while not goal_nxt_ell_status == GoalStatus.SUCCEEDED:
                        ac_ellipses.wait_for_result(rospy.Duration(1))
                        goal_nxt_ell_status = ac_ellipses.get_state()

                        # Handle abortions.
                        if goal_nxt_ell_status == GoalStatus.ABORTED or goal_nxt_ell_status == GoalStatus.REJECTED: 
                            rospy.loginfo("Ellipse resolution goal aborted")
                            break

                        # If ellipse resolved, speak.
                        if goal_nxt_ell_status == GoalStatus.SUCCEEDED:
                            soundhandle.say("Target number {0} resolved.".format(resolved_ell_ctr), voice, volume)
                            print "Target number {0} resolved.".format(resolved_ell_ctr)


                    # Add ellipse to array of resolved ellipses.
                    resolved_ell = np.vstack((resolved_ell, np.array([ellipse_data[0], ellipse_data[1], ellipse_data[5]])))
                    resolved_ell_ctr += 1
                    # Resend preempted checkpoint goal.
                    ac_chkpnts.send_goal(goal_chkpt)
                else:
                    pass
            else:
                pass
        except rospy.ServiceException, e:
            print "Ellipse locator service call failed: {0}".format(e)
        """
        

        ac_chkpnts.wait_for_result(rospy.Duration(0.1))

        # Get checkpoint resolution goal status.
        goal_chkpnt_status = ac_chkpnts.get_state()

        # Handle abortions
        if goal_chkpnt_status == GoalStatus.ABORTED or goal_chkpnt_status == GoalStatus.REJECTED:
            rospy.loginfo("Checkpoint resolution goal aborted")
            break

    print "initializing rotation..."
    rospy.sleep(2)
    rot = Twist()
    rot.angular.x = 0.3
    rot.angular.y = 0.3
    rot.angular.z = 0.3
    rotation_pub.publish(rot)
    rospy.sleep(2)
    rot.angular.x = 0.0
    rot.angular.y = 0.0
    rot.angular.z = 0.0
    rotation_pub.publish(rot)
    print "sleep ended"
    # Remove checkpoint from checkpoints array
    checkpoints = np.delete(checkpoints, (idx_nxt), axis=0)

    # Get robot position in map coordinates.
    trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
    robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z])
    checkpoint_ctr += 1  # Increment checkpoint counter.
