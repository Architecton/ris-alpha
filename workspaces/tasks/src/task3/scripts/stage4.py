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
from task3.srv import EllipseLocator
from task3.srv import QRDetector
from task3.srv import DigitDetector

from task3.srv import Checkpoint_res
from task3.msg import Checkpoints
from task3.msg import ScanFlag

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient

from classification.classification import UrlDataClassifier
from detection_objective_approach.detectionObjectiveApproachHandler import DetectionObjectiveApproachHandler

import time
import pdb
import sys

import pdb

### /IMPORTS ###


"""
Description:

Stage one performs search for circles. On locating a circle with the QR code it trains a classifier.
On locating a circle with the test example, it classifies it and initializes stage two.

If the circle with the classification example is located before the one with the QR code, the pattern is saved.

params:
    None
"""


def stage_four():

    ### INITIALIZATIONS ###

    # Initialize main node.
    # rospy.init_node('main')

    # Initialize sound node.
    soundhandle = SoundClient()
    rospy.sleep(1)
    voice = 'voice_kal_diphone'
    volume = 1.0

    # Notify start of initialization.
    soundhandle.say("Starting initialization of stage one.", voice, volume)


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
    ROTATION_SLEEP_DURATION = 1.0
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

    # Initialize detection objective approach handler instance.
    doah = DetectionObjectiveApproachHandler()

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

    rospy.wait_for_service('digit_detector')
    try:
        digit_detection_serv = rospy.ServiceProxy('digit_detector', DigitDetector)
    except rospy.ServiceException, e:
        rospy.logerr("Service error: {0}".format(e.message))
    ### /SERVICE PROXY INITIALIZATION ###



    # Initialize coordinate transforms buffer.
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)

    # Set distance threshold to consider ellipse as unresolved.
    DISTINCT_ELL_THRESH = 0.7
    DISTINCT_AGL_THRESH = 0.5

    # Initialize found ellipses storage.
    # First two fields store the coordinates of the ellipse center. The third field stores the perpendicular angle.
    resolved_ell = np.empty((0, 6), dtype=float)
    resolved_ell_ctr = 0  # Initialize resolved ellipses counter.
    NUM_ELLIPSES_TO_FIND = 3
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

    # Wait for ellipse data buffer query service to come online and make a proxy function.
    rospy.wait_for_service('ellipse_locator')
    ellipse_locator = rospy.ServiceProxy('ellipse_locator', EllipseLocator)

    ### /INITIALIZATIONS ###



    ### FLAGS ###

    classifier_built = False
    found_pattern = None
    qr_detected = None

    ### /FLAGS ##

    ### CLASSIFIER ###

    clf = UrlDataClassifier()

    ### /CLASSIFIER ###


    # Loop until return hit.
    while True:

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


            ## ELLIPSE LOCATING ROTATION ##

            soundhandle.say("Initiating rotation sequence.", voice, volume)
            for rot_idx in np.arange(NUM_ROTATIONS):

                # Safety sleep.
                rospy.sleep(0.2)


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
                rospy.sleep(0.2)

                # ROTATE
                start_rot_time = time.time()
                while(time.time() - start_rot_time < rotation_dur):
                    rotation_pub.publish(rot)  # Publish angular velocity.
                    rot_loop_rate.sleep()

            ## /ELLIPSE LOCATING ROTATION ##


            ## HANDLE ELLIPSE DATA COLLECTED IN BUFFER ##

            try:
                # Query into ellipse buffer
                ellipse_data = ellipse_locator().target
                while(len(ellipse_data) > 0):  # If data in buffer...
                    if not np.any((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(np.array([ellipse_data[0], ellipse_data[1]]), resolved_ell[:, :2]) < DISTINCT_ELL_THRESH):

                        ### DEBUGGING VISUALIZATION ###
                        tm.push_position(np.array(ellipse_data[:3]))
                        tm.push_position(np.array(ellipse_data[3:]))
                        ### /DEBUGGING VISUALIZATION ###

                        # Initialize goal to aproach new ellipse
                        goal_ell = MoveBaseGoal()
                        goal_ell.target_pose.header.frame_id = "map"
                        goal_ell.target_pose.header.stamp = rospy.Time.now()
                        goal_ell.target_pose.pose.position.x = ellipse_data[3]
                        goal_ell.target_pose.pose.position.y = ellipse_data[4]
                        goal_ell.target_pose.pose.orientation.x = ellipse_data[6]
                        goal_ell.target_pose.pose.orientation.y = ellipse_data[7]
                        goal_ell.target_pose.pose.orientation.z = ellipse_data[8]
                        goal_ell.target_pose.pose.orientation.w = ellipse_data[9]
                        goal_nxt_ell_status = GoalStatus.LOST
                        # Send ellipse resolution goal.
                        ac_ellipses.send_goal(goal_ell)

                        while not goal_nxt_ell_status == GoalStatus.SUCCEEDED:
                            ac_ellipses.wait_for_result(rospy.Duration(0.5))
                            goal_nxt_ell_status = ac_ellipses.get_state()

                            if goal_nxt_ell_status == GoalStatus.ABORTED or goal_nxt_ell_status == GoalStatus.REJECTED:
                                rospy.loginfo("Ellipse resolution goal aborted")
                                break
                            elif goal_nxt_ell_status == GoalStatus.SUCCEEDED:


                                ### TODO TODO TODO ##########################################################################

                                # If nor QR code nor pattern yet found...
                                if not classifier_built and not found_pattern:

                                    # Try to detect both the QR code and the pattern.
                                    qr_detection_serv(1)
                                    digit_detection_serv(1)
                                    doah.approach_procedure()
                                    qr_detected = qr_detection_serv(0).res
                                    found_pattern = digit_detection_serv(0).result
                                    
                                    # If QR code detected, build classifier.
                                    if qr_detected != '':
                                        data_url = qr_detected
                                        clf = clf.fit(data_url)
                                        classifier_built = True
                                    elif found_pattern:
                                        # If pattern found, flag is set.
                                        print "pattern found"
                                    else:
                                        print "map found"
                               
                                # If QR not yet found...
                                elif not classifier_built:
                                    qr_detection_serv(1)
                                    doah.approach_procedure()
                                    qr_detected = qr_detection_serv(0)


                                    # If QR code detected:..
                                    if qr_detected:

                                        # Build classifier and classify pattern.
                                        data_url = qr_detected
                                        clf = clf.fit(data_url)
                                        classifier_built = True
                                        return clf.predict(found_pattern)

                                # if pattern not yet found...
                                elif not found_pattern:
                                    digit_detection_serv(1)
                                    doah.approach_procedure()
                                    found_pattern = digit_detection_serv(0)
                                    
                                    # If pattern detected:
                                    if found_pattern:

                                        # classify patern.
                                        return clf.predict(found_pattern)


                                ### TODO TODO TODO ##########################################################################



                                # Notify that ellipse has been resolved.
                                soundhandle.say("Target number {0} resolved.".format(resolved_ell_ctr), voice, volume)
                                rospy.loginfo("Target number {0} resolved".format(resolved_ell_ctr))

                                # Sleep
                                rospy.sleep(1.0)

                                # Add found ellipse to matrix of resolved ellipses.
                                resolved_ell = np.vstack((resolved_ell, np.array([ellipse_data[0], ellipse_data[1], ellipse_data[3], ellipse_data[4], ellipse_data[5], ellipse_data[6]])))
                                resolved_ell_ctr += 1

                        # Get next element in service's buffer.
                        ellipse_data = ellipse_locator().target
                    else:
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


        # HERE IF ALL CHECKPOINTS RESOLVED

        # Call checkpoints generating service to get generated checkpoints.
        checkpoints_res = checkpoint_gen(NUM_CHECKPOINTS)

        # Add checkpoints to matrix.
        for point in checkpoints_res.points.points:
            checkpoints_nxt = np.array([[point.x, point.y, point.z]])
            checkpoints = np.vstack((checkpoints, checkpoints_nxt))

        checkpoint_ctr = 0  # Initialize visited checkpoints counter.


