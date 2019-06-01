#!/usr/bin/env python

### IMPORTS ###

import numpy as np
import roslib
roslib.load_manifest('task3')
import rospy
import sensor_msgs.msg
import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

import tf2_ros
import tf2_geometry_msgs
from tf.transformations import quaternion_from_euler, euler_from_quaternion
from geometry_msgs.msg import Point, Vector3, PoseStamped, Twist

from locators.target_marking.targetmarker import TargetMarker
from task3.srv import CylinderLocator

from task3.srv import Checkpoint_res
from task3.msg import Checkpoints
from task3.msg import ScanFlag

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient

from classification.classification import UrlDataClassifier

import time
import pdb
import sys

### /IMPORTS ###

"""
Description:

Stage two performs search for cylinders of color obtained from first stage. Upon locating the
correct cylinder, it obtains another color from the QR code on it.

params:
    cylinder_color: int -- color of cylinder to find
"""


def stage_two(cylinder_color_goal):

    ### INITIALIZATIONS ###

    # Initialize main node.
    rospy.init_node('main')

    # Initialize sound node.
    soundhandle = SoundClient()
    rospy.sleep(1)
    voice = 'voice_kal_diphone'
    volume = 1.0

    # Notify start of initialization.
    soundhandle.say("Starting initialization of stage two.", voice, volume)


    # /// publishers ///
    # Define publisher for cylinder search rotations.
    rotation_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
    # Define publisher that publishes permissions to process input data.
    scan_perm_pub_cyl = rospy.Publisher('/scan_perm_cyl', ScanFlag, queue_size=10)
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
    ac_cylinders = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    
    ### SERVICE PROXY INITIALIZATION ###
    
    rospy.wait_for_service('get_checkpoints')
    try:
        checkpoint_gen = rospy.ServiceProxy('get_checkpoints', Checkpoint_res)
    except rospy.ServiceException, e:
        rospy.logerr("Service error: {0}".format(e.message))

    rospy.wait_for_service('qr_detector')
    try:
        qr_detection_serv = rospy.ServiceProxy('qr_detector', QRDetector)
    except rospy.ServiceException, e:
        rospy.logerr("Service error: {0}".format(e.message))

    ### /SERVICE PROXY INITIALIZATION ###


    # Initialize coordinate transforms buffer.
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)

    # Set distance threshold to consider cylinder as unresolved.
    DISTINCT_ELL_THRESH = 0.7
    DISTINCT_AGL_THRESH = 0.5

    # Initialize found cylinders storage.
    # First two fields store the coordinates of the cylinder center. The third field stores the perpendicular angle.
    resolved_cyl = np.empty((0, 6), dtype=float)
    resolved_cyl_ctr = 0  # Initialize resolved cylinders counter.
    NUM_CYLINDERS_TO_FIND = 3
    end_search = False  # Flag to indicate end of search.

    # Number of checkpoints to generate.
    NUM_CHECKPOINTS = 8

    # Notify that search has started.
    soundhandle.say("Starting search.", voice, volume)

    # Call checkpoints generating service to get generated checkpoints.
    checkpoints_res = checkpoint_gen(NUM_CHECKPOINTS)

    # Allocate array for storing checkpoints.
    checkpoints = np.empty((0, 3), dtype=float)

    # Add checkpoints to matrix.
    for point in checkpoints_res.points.points:
        checkpoints_nxt = np.array([[point.x, point.y, point.z]])
        checkpoints = np.vstack((checkpoints, checkpoints_nxt))

    checkpoint_ctr = 0  # Initialize visited checkpoints counter.

    # Get robot position in map coordinates.
    rospy.sleep(5)  # Wait for cache to fill.
    trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
    robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z]) 

    # Wait for cylinders data buffer query service to come online and make a proxy function.
    rospy.wait_for_service('cylinder_locator')
    cylinder_locator = rospy.ServiceProxy('cylinder_locator', CylinderLocator)

    ### /INITIALIZATIONS ###




    # While there are unresolved checkpoints left
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


        ## CYLINDER LOCATING ROTATION ##

        soundhandle.say("Initiating rotation sequence.", voice, volume)
        for rot_idx in np.arange(NUM_ROTATIONS):


            # Safety sleep.
            rospy.sleep(0.5)


            ## IMAGE PROCESSING STREAM SCAN START ###
            sf.flag = 1
            scan_perm_pub_cyl.publish(sf)
            # Sleep and wait for cylinder_locator service to scan robot's image processing stream for cylinders.
            rospy.sleep(ROTATION_SLEEP_DURATION)
            # PUBLISH REVOCATION OF PERMISSION TO SCAN
            sf.flag = 0
            scan_perm_pub_cyl.publish(sf)
            ## IMAGE PROCESSING STREAM SCAN END ###


            # Safety sleep.
            rospy.sleep(0.5)


            # ROTATE
            start_rot_time = time.time()
            while(time.time() - start_rot_time < rotation_dur):
                rotation_pub.publish(rot)  # Publish angular velocity.
                rot_loop_rate.sleep()  # TODO: EMPIRICALLY SET

        ## /CYLINDER LOCATING ROTATION ##


        ## HANDLE CYLINDER DATA COLLECTED IN BUFFER ##

        try:
            # Query into cylinder buffer
            cylinder_data = cylinder_locator().target
            while(len(cylinder_data) > 0):  # If data in buffer...
                comp_dists = (lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(np.array([cylinder_data[0], cylinder_data[1]]), resolved_cyl[:, :2]) < DISTINCT_ELL_THRESH
                comp_agl = euler_from_quaternion(np.array([cylinder_data[6], cylinder_data[7], cylinder_data[8], cylinder_data[9]]))
                euler_resolved = np.apply_along_axis(euler_from_quaternion, 1, resolved_cyl[:, 2:])[:, -1]
                comp_agls = lambda x1, x2 : np.abs(x1 - x2)(comp_agl, euler_resolved) < np.pi/3

                if not np.any(np.logical_and(comp_dists, comp_agls)):

                    ### DEBUGGING VISUALIZATION ###
                    tm.push_position(np.array(cylinder_data[:3]))
                    tm.push_position(np.array(cylinder_data[3:]))
                    ### /DEBUGGING VISUALIZATION ###

                    # Initialize goal to aproach new cylinder
                    goal_cyl = MoveBaseGoal()
                    goal_cyl.target_pose.header.frame_id = "map"
                    goal_cyl.target_pose.header.stamp = rospy.Time.now()
                    goal_cyl.target_pose.pose.position.x = cylinder_data[3]
                    goal_cyl.target_pose.pose.position.y = cylinder_data[4]
                    goal_cyl.target_pose.pose.orientation.x = cylinder_data[6]
                    goal_cyl.target_pose.pose.orientation.y = cylinder_data[7]
                    goal_cyl.target_pose.pose.orientation.z = cylinder_data[8]
                    goal_cyl.target_pose.pose.orientation.w = cylinder_data[9]
                    goal_nxt_cyl_status = GoalStatus.LOST
                    # Send cylinder resolution goal.
                    ac_cylinders.send_goal(goal_cyl)

                    while not goal_nxt_cyl_status == GoalStatus.SUCCEEDED:
                        ac_cylinders.wait_for_result(rospy.Duration(0.5))
                        goal_nxt_cyl_status = ac_cylinders.get_state()

                        if goal_nxt_cyl_status == GoalStatus.ABORTED or goal_nxt_cyl_status == GoalStatus.REJECTED:
                            rospy.logerr("Cylinder resolution goal aborted")
                            break
                        elif goal_nxt_cyl_status == GoalStatus.SUCCEEDED:


                            ### TODO TODO TODO ##########################################################################

                            # Get color of cylinder
                            cylinder_color = 0  ## TODO detect
                            if cylinder_color == cylinder_color_goal:
                                qr_detection_serv(1)
                                rospy.sleep(2)
                                qr_detected = qr_detection_serv(0)
                                color_res = qr_detected
                                return color_res


                            ### TODO TODO TODO ##########################################################################


                            # Notify that cylinder has been resolved.
                            soundhandle.say("Target number {0} resolved.".format(resolved_cyl_ctr), voice, volume)
                            rospy.loginfo("Target number {0} resolved".format(resolved_cyl_ctr))

                            # Sleep
                            rospy.sleep(2.0)

                            # Add found cylinder to matrix of resolved cylinders.
                            resolved_cyl = np.vstack((resolved_cyl, np.array([cylinder_data[0], cylinder_data[1], cylinder_data[3], cylinder_data[4], cylinder_data[5], cylinder_data[6]])))
                            resolved_cyl_ctr += 1

                    # Get next element in service's buffer.
                    cylinder_data = cylinder_locator().target
                else:
                    cylinder_data = cylinder_locator().target
        except rospy.ServiceException, e:
            rospy.logerr("Cylinder locator service call failed: {0}".format(e))

        ## /HANDLE CYLINDER DATA COLLECTED IN BUFFER ##

        # Remove checkpoint from checkpoints array
        soundhandle.say("Checkpoint number {0} resolved.".format(resolved_cyl_ctr), voice, volume)
        checkpoints = np.delete(checkpoints, (idx_nxt), axis=0)

        # Get robot position in map coordinates.
        trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
        robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z])
        checkpoint_ctr += 1  # Increment checkpoint counter.


    soundhandle.say("All checkpoints visited.", voice, volume)
