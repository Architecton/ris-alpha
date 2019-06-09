#!/usr/bin/env python

### IMPORTS ###

import sys

sys.path.append('..')

import numpy as np
import roslib
roslib.load_manifest('task3')
import rospy
import sensor_msgs.msg
import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

from joblib import load

import color_classification.colour_detection

import tf2_ros
import tf2_geometry_msgs
from tf.transformations import quaternion_from_euler, euler_from_quaternion
from geometry_msgs.msg import Point, Vector3, PoseStamped, Twist

from locators.target_marking.targetmarker import TargetMarker
from task3.srv import QRDetector2
from task3.srv import CylinderLocation

from task3.srv import Checkpoint_res
from task3.msg import Checkpoints

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient

from detection_objective_approach.detectionObjectiveApproachHandler import DetectionObjectiveApproachHandler

from color_classification.colour_detector_cyl2 import ColourDetectorCyl

from sound.sound_client import SoundClient

from joblib import load

import time

import pdb

### /IMPORTS ###


"""
Description:

Stage two performs search for cylinders. On locating a cylinder with the correct code it trains a classifier.
On locating a cylinder of correct color, it reads the QR code located on it and returns the color encoded in it.

params:
    goal_color: int - color of cylinder from which to read the QR code
"""


def stage_two(goal_color):

    ### INITIALIZATIONS ###


    # Initialize sound node.
    soundhandle = SoundClient()
    rospy.sleep(1)
    voice = 'voice_kal_diphone'
    volume = 1.0


    # Initialize cylinder colour detector.
    NUM_BINS = 100
    clf = load('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/color_classification/cylinder_colour_classifier.joblib')
    cdt = ColourDetectorCyl(clf, NUM_BINS)


    # /// publishers ///
    # Define publisher for cylinder search rotations.
    rotation_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
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
    ac_cylinders = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    # Initialize detection objective approach handler instance.
    doah = DetectionObjectiveApproachHandler()

    ### SERVICE PROXY INITIALIZATION ###
    rospy.wait_for_service('get_checkpoints')
    checkpoint_gen = rospy.ServiceProxy('get_checkpoints', Checkpoint_res)

    rospy.wait_for_service('qr_detector')
    qr_detection_serv = rospy.ServiceProxy('qr_detector2', QRDetector2)

    rospy.wait_for_service('cylinder_detector')
    cylinder_detection_serv = rospy.ServiceProxy('cylinder_detector', CylinderLocation)
    ### /SERVICE PROXY INITIALIZATION ###

    # Initialize sound client.
    sound_client = SoundClient()


    # Initialize coordinate transforms buffer.
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)

    # Set distance threshold to consider cylinder as unresolved.
    DISTINCT_CYL_THRESH = 0.7
    DISTINCT_AGL_THRESH = 0.5

    # Initialize found cylinders storage.
    # First two fields store the coordinates of the cylinder center. The third field stores the perpendicular angle.
    resolved_cyl = np.empty((0, 2), dtype=float)
    resolved_cyl_ctr = 0  # Initialize resolved cylinders counter.

    # Number of checkpoints to generate.
    NUM_CHECKPOINTS = 8

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

    
    ### CYLINDER LOCATION BUFFER ###
    cyl_buff_ptr = -1
    cyl_buff = np.empty((100, 6), dtype=float)
    ### /CYLINDER LOCATION BUFFER ###

    cylinders = np.array([
                    [-0.9631, 1.6747, 0.0, 0.0, 0.6751, 0.7377],
                    [0.9946, 0.4093, 0.0, 0.0, -0.7097, 0.7045],
                    [2.4220, 0.9757, 0.0, 0.0, -0.2740, 0.9617]
                ])


    ### /INITIALIZATIONS ###



    # Loop until return:
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

            sound_client.say('2next_checkpoint')

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
            
            sound_client.say('2rotation')
            for rot_idx in np.arange(NUM_ROTATIONS):


                # Safety sleep.
                rospy.sleep(0.2)

                ## IMAGE PROCESSING STREAM SCAN START ### 
                # Start scanning for cylinders.
                cylinder_detection_serv(1)
                # Sleep and wait for service to scan robot's image processing stream for cylinders.
                rospy.sleep(ROTATION_SLEEP_DURATION)
                cylinder_detection_res = cylinder_detection_serv(0)
                """
                if cylinder_detection_res.found == 1:
                    trans_scan_pos = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
                    cyl_approach_goal_nxt = np.array([cylinder_detection_res.x_a, 
                                                      cylinder_detection_res.y_a, 
                                                      trans_scan_pos.transform.rotation.x, 
                                                      trans_scan_pos.transform.rotation.y, 
                                                      trans_scan_pos.transform.rotation.z, 
                                                      trans_scan_pos.transform.rotation.w])
                    cyl_buff[cyl_buff_ptr+1, :] = cyl_approach_goal_nxt
                    cyl_buff_ptr += 1
                """
            
                ## IMAGE PROCESSING STREAM SCAN END ###

                # Safety sleep.
                rospy.sleep(0.2)

                # ROTATE
                start_rot_time = time.time()
                while(time.time() - start_rot_time < rotation_dur):
                    rotation_pub.publish(rot)  # Publish angular velocity.
                    rot_loop_rate.sleep()

            ## /CYLINDER LOCATING ROTATION ##



            ## HANDLE CYLINDER DATA COLLECTED IN BUFFER ##



            cylinders_xy = cylinders[:, 0:2]

            RAD = 5.0
            trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
            robot_pos_ref = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z])
            idx_nxt_cyl = np.argmin((lambda x1, x2: np.sqrt(np.sum(np.abs(x1 - x2)**2, 1)))(robot_pos_ref[0:2], cylinders_xy))

            cyl_buff[cyl_buff_ptr+1, :] = cylinders[idx_nxt_cyl, :]
            cyl_buff_ptr += 1
             
            import pdb
            pdb.set_trace()
            # Query into cylinder buffer
            while cyl_buff_ptr >= 0 :  # If data in buffer...
                cylinder_data = cyl_buff[cyl_buff_ptr, :]
                cyl_buff_ptr -= 1
                cyl_buff = np.delete(cyl_buff, (idx_nxt_cyl), axis=0)

                ### DEBUGGING VISUALIZATION ###
                # tm.push_position(np.array(cylinder_data[:3]))
                ### /DEBUGGING VISUALIZATION ###

                # Initialize goal to aproach new cylinder
                goal_cyl = MoveBaseGoal()
                goal_cyl.target_pose.header.frame_id = "map"
                goal_cyl.target_pose.header.stamp = rospy.Time.now()
                goal_cyl.target_pose.pose.position.x = cylinder_data[0]
                goal_cyl.target_pose.pose.position.y = cylinder_data[1]
                goal_cyl.target_pose.pose.orientation.x = cylinder_data[2]
                goal_cyl.target_pose.pose.orientation.y = cylinder_data[3]
                goal_cyl.target_pose.pose.orientation.z = cylinder_data[4]
                goal_cyl.target_pose.pose.orientation.w = cylinder_data[5]
                goal_nxt_cyl_status = GoalStatus.LOST

                # Send cylinder resolution goal.
                ac_cylinders.send_goal(goal_cyl)

                while not goal_nxt_cyl_status == GoalStatus.SUCCEEDED:
                    ac_cylinders.wait_for_result(rospy.Duration(0.5))
                    goal_nxt_cyl_status = ac_cylinders.get_state()

                    if goal_nxt_cyl_status == GoalStatus.ABORTED or goal_nxt_cyl_status == GoalStatus.REJECTED:
                        rospy.loginfo("Cylinder resolution goal aborted")
                        break
                    elif goal_nxt_cyl_status == GoalStatus.SUCCEEDED:


                        ### TODO TODO TODO ##########################################################################

                        # Detect cylinder color.

                        sound_client.say('2detecting')

                        cdt.subscribe()
                        doah.approach_procedure_alt()
                        detected_cylinder_color = cdt.get_cylinder_color()

                        if detected_cylinder_color == 'red':
                            sound_client.say('2red_cyl')
                        if detected_cylinder_color == 'green':
                            sound_client.say('2green_cyl')
                        if detected_cylinder_color == 'blue':
                            sound_client.say('2blue_cyl')
                        if detected_cylinder_color == 'yellow':
                            sound_client.say('2yellow_cyl')
                        
                        # If detected correct color:
                        if detected_cylinder_color == goal_color:
                            sound_client.say('2detecting_qr_code')

                            res = ''
                            while res == '':

                                # Try to detect qr code on cylinder.
                                qr_detection_serv(1)
                                doah.approach_procedure()
                                res = qr_detection_serv(0).res

                                # If detected, return found color.
                                if res != '':
                                    if res == 'red':
                                        sound_client.say('2red')
                                    elif res == 'green':
                                        sound_client.say('2green')
                                    elif res == 'blue':
                                        sound_client.say('2blue')
                                    elif res == 'black':
                                        sound_client.say('2black')

                                    return res



                            ### TODO TODO TODO ##########################################################################


                            # Sleep
                            rospy.sleep(1.0)

                            # Add found cylinder to matrix of resolved cylinders.
                            resolved_cyl = np.vstack((resolved_cyl, np.array([cylinder_data[0], cylinder_data[1]])))

            ## /HANDLE CYLINDER DATA COLLECTED IN BUFFER ##

            # Remove checkpoint from checkpoints array
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

        checkpoint_ctr = 0  # Reinitialize visited checkpoints counter.

