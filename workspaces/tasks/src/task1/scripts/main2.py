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
from task1.msg import ScanFlag

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient

import time
import pdb
import sys

### /IMPORTS ###



### INITIALIZATIONS ###

# Initialize main node.
rospy.init_node('main')

# Initialize sound node.
soundhandle = SoundClient()
rospy.sleep(1)
voice = 'voice_kal_diphone'
volume = 1.0


soundhandle.say("Starting initialization.", voice, volume)
# /// publishers ///
# Define publisher for ellipse search rotations.
rotation_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
# Define publisher that publishes permissions to process input data.
scan_perm_pub = rospy.Publisher('/scan_perm', ScanFlag, queue_size=10)
sf = ScanFlag()
# /// /publishers ///

### ROTATION PARAMETERS ###
NUM_ROTATIONS = 8
rotation_agl = 2*np.pi/float(NUM_ROTATIONS)
ROTATION_SPEED_X = 1.0
ROTATION_SPEED_Y = 1.0
ROTATION_SPEED_Z = 1.0
rotation_dur_callib = 0.3 # Constant used to calibrate rotation duration.
# Duration for which to publish specified rotation velocity to get rotation_agl angle.
rotation_dur = (rotation_agl/ROTATION_SPEED_X)*rotation_dur_callib 
ROTATION_SLEEP_DURATION = 2
rot = Twist()
rot.angular.x = ROTATION_SPEED_X
rot.angular.y = ROTATION_SPEED_Y
rot.angular.z = ROTATION_SPEED_Z
rot_loop_rate = rospy.Rate(10)
### /ROTATION PARAMETERS ###


# Initialize TargetMarker instance.
tm = TargetMarker()

# Initialize action clients
ac_chkpnts = actionlib.SimpleActionClient("move_base", MoveBaseAction)
ac_ellipses = actionlib.SimpleActionClient("move_base", MoveBaseAction)

# Initialize checkpoints array.
rospy.wait_for_service('get_checkpoints')

try:
    checkpoint_gen = rospy.ServiceProxy('get_checkpoints', Checkpoint_res)
except rospy.ServiceException, e:
    print "Service error: {0}".format(e.message)

# Initialize coordinate transforms buffer.
tf2_buffer = tf2_ros.Buffer()
tf2_listener = tf2_ros.TransformListener(tf2_buffer)


# Set distance threshold to consider ellipse as unresolved.
# TODO: empirically determine best threshold.
DISTINCT_ELL_THRESH = 1.5

# Initialize found ellipses storage.
# First two fields store the coordinates of the ellipse center. The third field stores the perpendicular angle.
resolved_ell = np.empty((0, 3), dtype=float)
resolved_ell_ctr = 0  # Initialize resolved ellipses counter.
NUM_ELLIPSES_TO_FIND = 8

# Number of checkpoints to generate.
NUM_CHECKPOINTS = 8

soundhandle.say("Starting search.", voice, volume)

# While all ellipses not found.
while resolved_ell_ctr < NUM_ELLIPSES_TO_FIND:

    # Call checkpoints generating service.
    checkpoints_res = checkpoint_gen(NUM_CHECKPOINTS)

    # Allocate array for storing checkpoints.
    checkpoints = np.empty((0, 3), dtype=float)

    for point in checkpoints_res.points.points:
        # Get next checkpoints batch.
        checkpoints_nxt = np.array([[point.x, point.y, point.z]])
        checkpoints = np.vstack((checkpoints, checkpoints_nxt))


    #checkpoints = np.array([[-1.276, 2.121, 0.850], [0.421, 0.166, 0.597], [2.195, 0.723, 0.999], [1.832, 2.986, 0.882], [0.036, 2.124, 0.855]])

    checkpoint_ctr = 0  # Initialize visited checkpoints counter.

    # Get robot position in map coordinates.
    rospy.sleep(5)  # Wait for cache to fill.
    trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
    robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z]) 

    # Wait for ellipse data buffer query service to come online and make a proxy function.
    rospy.wait_for_service('ellipse_locator')
    ellipse_locator = rospy.ServiceProxy('ellipse_locator', EllipseLocator)

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

        soundhandle.say("Resolving checkpoint {0}".format(checkpoint_ctr), voice, volume)

        # Loop for next checkpoint goal.
        while not goal_chkpnt_status == GoalStatus.SUCCEEDED:

            ac_chkpnts.wait_for_result(rospy.Duration(1.0))

            # Get checkpoint resolution goal status.
            goal_chkpnt_status = ac_chkpnts.get_state()

            # Handle abortions
            if goal_chkpnt_status == GoalStatus.ABORTED or goal_chkpnt_status == GoalStatus.REJECTED:
                rospy.loginfo("Checkpoint resolution goal aborted")
                break

            
        # We are here if checkpoint sucessfully reached or aborted.
        # Rotate and scan for ellipses.

        ## ELLIPSE LOCATING ROTATION ##

        soundhandle.say("Starting rotation sequence.", voice, volume)
        for rot_idx in np.arange(NUM_ROTATIONS):

            # Safety sleep.
            rospy.sleep(1.0)

            ## IMAGE PROCESSING STREAM SCAN START ###
            sf.flag = 1
            scan_perm_pub.publish(sf)
            # Sleep and wait for ellipse_locator service to scan robot's image processing stream for ellipses.
            rospy.sleep(ROTATION_SLEEP_DURATION)
            # PUBLISH REVOCATION OF PERMISSION TO SCAN
            sf.flag = 0
            scan_perm_pub.publish(sf)
            ## IMAGE PROCESSING STREAM SCAN END ###

            # Safety sleep.
            rospy.sleep(1.0)

            # ROTATE
            start_rot_time = time.time()
            while(time.time() - start_rot_time < rotation_dur):
                rotation_pub.publish(rot)  # Publish angular velocity.
                rot_loop_rate.sleep()  # TODO: EMPIRICALLY SET

        ## /ELLIPSE LOCATING ROTATION ##

        ## HANDLE ELLIPSE DATA COLLECTED IN BUFFER ##
        try:
            # Query into ellipse buffer
            ellipse_data = ellipse_locator().target
            print ellipse_data
            while(len(ellipse_data) > 0):  # If data in buffer...
                if not np.any((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(np.array([ellipse_data[0], ellipse_data[1], ellipse_data[5]]), resolved_ell) < DISTINCT_ELL_THRESH):

                    ### DEBUGGING VISUALIZATION ###
                    #tm.push_position(np.array(ellipse_data[:3]))
                    #tm.push_position(np.array(ellipse_data[3:]))
                    ### /DEBUGGING VISUALIZATION ###

                    # Initialize goal to aproach new ellipse
                    goal_ell = MoveBaseGoal()
                    goal_ell.target_pose.header.frame_id = "map"
                    goal_ell.target_pose.header.stamp = rospy.Time.now()
                    goal_ell.target_pose.pose.position.x = ellipse_data[3]
                    goal_ell.target_pose.pose.position.y = ellipse_data[4]
                    goal_ell.target_pose.pose.orientation.w = ellipse_data[5]
                    goal_nxt_ell_status = GoalStatus.LOST
                    # Send ellipse resolution goal.
                    ac_ellipses.send_goal(goal_ell)

                    print goal_ell

                    while not goal_nxt_ell_status == GoalStatus.SUCCEEDED:
                        ac_ellipses.wait_for_result(rospy.Duration(0.5))
                        goal_nxt_ell_status = ac_ellipses.get_state()

                        elif goal_nxt_ell_status == GoalStatus.ABORTED or goal_nxt_ell_status == GoalStatus.REJECTED:
                            rospy.loginfo("Ellipse resolution goal aborted")
                            break
                        elif goal_nxt_ell_status == GoalStatus.SUCCEEDED:
                            print resolved_ell_ctr
                            soundhandle.say("Target number {0} resolved.".format(resolved_ell_ctr), voice, volume)
                            rospy.loginfo("Target number {0} resolved".format(resolved_ell_ctr))
                            resolved_ell = np.vstack((resolved_ell, np.array([ellipse_data[0], ellipse_data[1], ellipse_data[5]])))
                            resolved_ell_ctr += 1
                    # Get next element in service's buffer.
                    ellipse_data = ellipse_locator().target
        except rospy.ServiceException, e:
            rospy.loginfo("Ellipse locator service call failed: {0}".format(e))
        ## /HANDLE ELLIPSE DATA COLLECTED IN BUFFER ##
        # Remove checkpoint from checkpoints array
        soundhandle.say("Checkpoint number {0} resolved.".format(resolved_ell_ctr), voice, volume)
        checkpoints = np.delete(checkpoints, (idx_nxt), axis=0)

        # Get robot position in map coordinates.
        trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
        robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z])
        checkpoint_ctr += 1  # Increment checkpoint counter.
