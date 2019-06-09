#!/usr/bin/env python

### Imports ###

import rospy
import numpy as np

import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient

import tf2_ros
import tf2_geometry_msgs

from geometry_msgs.msg import Point, Vector3, PoseStamped, Twist

from task3.srv import TerminalApproach
from task3.srv import ReconfigParams
from task3.msg import TerminalApproachFeedback, ApproachImageFeedback, SayCommand

from locators.target_marking.targetmarker import TargetMarker
from color_classification.colour_detector2 import ColourDetector

from sound.sound_client import SoundClient

from joblib import load

import time

import pdb

### /IMPORTS ###


### TERMINAL APPROACH ###

class TerminalApproachHandler:


    def __init__(self, window_size, target_center_x):

	# set window size in which to keep center of ring.
        self._WINDOW_SIZE = window_size
	self._target_center_x = target_center_x

        # Initialize publisher for Twist messages.
        self._sprint_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1)

        # Initialize corrections message.
        self._corr = TerminalApproachFeedback()
        rospy.wait_for_service('terminal_approach')  # Wait for service to come online.
        self._corrections_serv = rospy.ServiceProxy('terminal_approach', TerminalApproach)  # Initialize service proxy.

        self._timeout_reset = False
        self._detection_counter = 0


    def _image_feedback_callback(self, data):
        """
        callback called when feedback about ring center from /toroids topic received.
        """

        # Initialize corrections message.
	self._corr.target_center_x = self._target_center_x
        self._corr.center_x = data.center_x
        self._corr.window_size = self._WINDOW_SIZE

        # Call service to apply correction.
        self._corrections_serv(self._corr)
        self._detection_counter += 1
        if self._detection_counter > 5:
            self._timeout_reset = True  # If received feedback from image, reset sprint timeout.


    def sprint(self, sprint_duration, forward):
        """
        perform movement in straight line for specified duration.
        """

        msg = Twist()
        sprint_loop_rate = rospy.Rate(2)
        msg.linear.x = 0.1 if forward else -0.5  # Set speed.
        msg.angular.z = 0.1
        start_time = time.time()
        while(time.time() - start_time < sprint_duration):
            self._sprint_pub.publish(msg)  # Publish angular velocity.
            msg.angular.z = -msg.angular.z
            sprint_loop_rate.sleep()
            
            # TODO uncomment to enable retracking feature.
            # if self._timeout_reset:  # If _timeout_reset flag set to true, reset timeout.
            #     start_time = time.time()
            #     self._timeout_reset = False
            #     self._detection_counter = 0


    def subscribe_to_feedback(self):
        """
        Subscribe to feedback about ring center location.
        """

        self._feedback_subscriber = rospy.Subscriber('toroids', ApproachImageFeedback, self._image_feedback_callback)


    def unsubscribe_from_feedback(self):
        """
        Unsubscribe to feedback about ring center location.
        """

        self._feedback_subscriber.unregister()


class Utils:

    """
    Various methods used to control the robot in the main script.
    """

    def __init__(self, window_size, target_center_x, terminal_approach_duration):
        self._terminal_approach_duration = terminal_approach_duration  # Set duration of the terminal approach homing phase.
        self._tah = TerminalApproachHandler(window_size, target_center_x)  # Terminal approach handler instance.
        self._tm = TargetMarker()
        self._detection_counter = 0  # Counter of detected rings.
        self.offset_px = 0  # offset from center accumulator. After successful detection of ring, holds mean offset of detected rings.
        self.depth = 0  # Depth to ring. After successful detection of ring, holds mean depth of detected rings.

        # Initialize parameter setting service.
        rospy.wait_for_service('reconfig_params')  # Wait for service to come online.
        self._params_serv = rospy.ServiceProxy('reconfig_params', ReconfigParams)  # Initialize service proxy.

        self._MIN_TRANS_VEL_DEF_VAL = 0.1
        self._TRANS_STOPPED_VEL_DEF_VAL = 0.1
        self._MIN_ROT_VEL_DEF_VAL = 0.4
        self._ROT_STOPPED_VEL_DEF_VAL = 0.4



        self._OFFSET_AGL_INCREMENT = 0.0017098772515631948
        self._DEPTH_COEFF = 1347.0/1.1

        # publisher of Twist messages.
        self._rot_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1)

        # publisher of voice commands.
        self._say_pub = SoundClient()

    def _set_params_for_approach(self):
        self._params_serv('min_trans_vel', 0.01)
        self._params_serv('min_rot_vel', 0.01)
        self._params_serv('trans_stopped_vel', 0.01)
        self._params_serv('rot_stopped_vel', 0.01)

    def _reset_params(self):
        self._params_serv('min_trans_vel', self._MIN_TRANS_VEL_DEF_VAL)
        self._params_serv('min_rot_vel', self._MIN_ROT_VEL_DEF_VAL)
        self._params_serv('trans_stopped_vel', self._TRANS_STOPPED_VEL_DEF_VAL)
        self._params_serv('rot_stopped_vel', self._ROT_STOPPED_VEL_DEF_VAL)


    def detect_ring(self):
        """
        try to detect ring in current position
        """

        self._subscribe()  # Subscribe to toroids topic and wait.
        rospy.sleep(2)
        self._subs.unregister()
        if self._detection_counter > 15:  # If detected more than 5 rings, declare ring found.
            self.offset_px /= self._detection_counter
            self.depth /= self._detection_counter
            self._detection_counter = 0
            return True
        else:
            self._detection_counter = 0
            return False


    def ring_scan(self, ring_scan_duration):
        """
        perform a slow rotational search for rings
        """

        msg = Twist()
        scan_loop_rate = rospy.Rate(2)
        msg.angular.z = 0.1
        start_time = time.time()
        self._subscribe()

        # Rotate left and check for detected rings.
        while(time.time() - start_time < ring_scan_duration):
            self._rot_pub.publish(msg)  # Publish angular velocity.
            if self._detection_counter >= 30:  # If found ring 3 or more times, declare ring found.
                self.offset_px /= self._detection_counter
                self.depth /= self._detection_counter
                self._detection_counter = 0
                self._subs.unregister()
                return True
            scan_loop_rate.sleep()
        self._detection_counter = 0
        self._subs.unregister()
        return False

    def sidestep(self):
        """
        perform a slow rotational movement while classifying color
        """

        msg = Twist()
        scan_loop_rate = rospy.Rate(2)

        DURATION = 0.5

        msg.angular.z = 0.1
        start_time = time.time()
        while(time.time() - start_time < DURATION):
            self._rot_pub.publish(msg)  # Publish angular velocity.
            scan_loop_rate.sleep()

        msg.angular.z = -0.1
        while(time.time() - start_time < DURATION*2):
            self._rot_pub.publish(msg)  # Publish angular velocity.
            scan_loop_rate.sleep()

        msg.angular.z = 0.1
        while(time.time() - start_time < DURATION):
            self._rot_pub.publish(msg)  # Publish angular velocity.
            scan_loop_rate.sleep()


    def perform_terminal_approach(self):

        """
        perform terminal approach to the ring.
        """

        self._set_params_for_approach()

        self._tah.subscribe_to_feedback()
        rospy.sleep(self._terminal_approach_duration)
        
        # Go straight to pick up ring.
        SPRINT_DURATION = 7
        self._tah.sprint(SPRINT_DURATION, forward=True)  # Final run to pick up the ring.
        self._tah.unsubscribe_from_feedback()
        self.say('verifying')
        self._tah.sprint(3.0, forward=False)  # Reverse (to check if ring picked up).
        self.offset_px = 0  # Reset mean offset and depth values.
        self.depth = 0
        self._reset_params()


    def mark_ring(self, trans, depth, offset_px):
        """
        Mark position of detected ring.
        """ 
        # robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y]) 
        # Initialize PosStamped instance.
        pos_ring = PoseStamped()

        # Increment/Decrement x and y to get position of ring.
	depth = depth / self._DEPTH_COEFF

        dx = depth**2/np.sqrt(np.tan(offset_px*self._OFFSET_AGL_INCREMENT)**2 + 1)

        pos_ring.pose.position.x = dx
        pos_ring.pose.position.y = dx*np.tan(offset_px*self._OFFSET_AGL_INCREMENT)
        # pos_ring.pose.orientation.w = 1.0

        # Transform approach goal position to map coordinate system.
        pos_ring_transformed = tf2_geometry_msgs.do_transform_pose(pos_ring, trans)

        self._tm.push_position(np.array([pos_ring_transformed.pose.position.x, pos_ring_transformed.pose.position.y]), 'green')


    def mark_trail(self, trans):
        """
        Mark trail of robot.
        """
        self._tm.push_position(np.array([trans.transform.translation.x, trans.transform.translation.y]), 'blue')

    def say(self, text):
        """
        Say text. See sound_player.py for supported commands.
        """
	self._say_pub.say(text) 

    def _callback(self, data):
        """
        callback called when topic published on /toroids. Used to count ring detections.
        """
        self.offset_px += data.center_x - 640/2
        self.depth += data.dpt
        self._detection_counter += 1  # Increment counter of detected rings.


    def _subscribe(self):
        """
        subscribe to /toroid topic to listen for ring detections.
        """
        self._subs = rospy.Subscriber('toroids', ApproachImageFeedback, self._callback)

"""
Stage three handles detection, classification and collection of rings. Ring with specified
color is collected.

params:
    goal_color : int - color of ring to collect
"""

def stage_three(goal_color):

    ## PARAMETERS ##
    WINDOW_SIZE = 7
    TARGET_CENTER_X = 423
    TERMINAL_APPROACH_DURATION = 10
    NUM_RINGS_TO_COLLECT = 3
    NUM_ATTEMPTS = 3
    ################

    # Initialize ring colour detector instance.
    clf = load('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/color_classification/ring_colour_classifier.joblib')
    NUM_BINS = 10
    cdt = ColourDetector(clf, NUM_BINS)

    # Initialize action client
    ac_chkpnts = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    # Define array of checkpoints.
    checkpoints = np.array(
        [[0.105893270894, 0.136317363463],
        [0.0073, 2.55],
        [1.31084515827, 1.51287972294],
        [2.81970682896, 1.79192063586],
        [1.91655018277, 0.858679839984], 
        [0.863168808613, 2.11869023203],
        [2.09860654436, 3.02047163568],
        [1.97930727727, 2.97823109257]])

    checkpoints_backup = checkpoints.copy()

    # Define array of orientations for
    checkpoint_orientations = np.array(
        [[0.858581771733, 0.512676643946],
        [-0.468302282172, 0.883568317966],
        [-0.996140868632, 0.0877688432288],
        [-0.99516226678, 0.098244912165],
        [0.787886357936, 0.615820661377],
        [0.0828900295388, 0.996558700229],
        [-0.588117419044, 0.808775556887],
        [-0.982367777334, 0.186958685423]])

    checkpoint_orientations_backup = checkpoint_orientations.copy()


    # Initialize sound client.
    sound_client = SoundClient()

    
    # Create instance of Utils class.
    ut = Utils(window_size=WINDOW_SIZE, target_center_x=TARGET_CENTER_X, terminal_approach_duration=TERMINAL_APPROACH_DURATION)

    # Initialize counter of collected rings.
    collected_rings_counter = 0

    # Initialize coordinate transforms buffer.
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)

    sound_client.say('3starting_search')

    # Wait for map cache to fill.
    rospy.sleep(5)

    while True:
        # While there are unresolved checkpoints.
        while checkpoints.shape[0] > 0:
            
            # Get robot's current position.
            trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
            robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y])
            
            # Get index of closest checkpoint.
            idx_nxt = np.argmin((lambda x1, x2 : np.sum(np.abs(x1 - x2)**2.0, 1)**(1.0/2.0))(robot_pos, checkpoints))
            rospy.loginfo("resolving next checkpoint")
        
            # Initialize next goal from closest checkpoint and visit it.
            goal_chkpt = MoveBaseGoal()
            goal_chkpt.target_pose.header.frame_id = "map"
            goal_chkpt.target_pose.header.stamp = rospy.Time.now()
            goal_chkpt.target_pose.pose.position.x = checkpoints[idx_nxt, 0]
            goal_chkpt.target_pose.pose.position.y = checkpoints[idx_nxt, 1]
            goal_chkpt.target_pose.pose.orientation.z = checkpoint_orientations[idx_nxt, 0]
            goal_chkpt.target_pose.pose.orientation.w = checkpoint_orientations[idx_nxt, 1]

            goal_chkpnt_status = GoalStatus.LOST  # Set status for next checkpoint goal.
            ac_chkpnts.send_goal(goal_chkpt)  # Send checkpoint goal.

            # Loop for next checkpoint goal.
            while not goal_chkpnt_status == GoalStatus.SUCCEEDED:
                
                # Wait 1 second for results.
                ac_chkpnts.wait_for_result(rospy.Duration(1.0))

                # mark robot trail.
                #trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
                #ut.mark_trail(trans)

                # Get checkpoint resolution goal status.
                goal_chkpnt_status = ac_chkpnts.get_state()

                # Handle abortions.
                if goal_chkpnt_status == GoalStatus.ABORTED or goal_chkpnt_status == GoalStatus.REJECTED:
                    rospy.loginfo("Checkpoint resolution goal aborted")
                    checkpoints = np.delete(checkpoints, (idx_nxt), axis=0)
                    checkpoint_orientations = np.delete(checkpoint_orientations, (idx_nxt), axis=0)
                    break

                if goal_chkpnt_status == GoalStatus.SUCCEEDED:

                    ## RING DETECTION AND COLLECTION PROCEDURE ##
                    terminal_approach_performed_flg = False
                    position_resolved_flg = False
                    attempt_counter = 0
                
                    while not position_resolved_flg and attempt_counter < NUM_ATTEMPTS:

                        # See if ring detected in initial position.
                        rospy.loginfo("detecting ring")

                        detected_flg = ut.detect_ring()
                        if detected_flg:

                            # Signal detected ring.
                            sound_client.say('3detected')
                            
                            # Mark ring.
                            trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
                            ut.mark_ring(trans, ut.depth, ut.offset_px)

                            ## CLASSIFY COLOR OF RING ###

                            cdt.subscribe()
                            ut.sidestep()
                            color_classification_res == cdt.get_ring_color()
                            sound_client.say('3' + color_classification_res)

                            # If correct color, perform terminal approach, else break 
                            if color_classification_res == goal_color:
                                # Perform terminal approach.
                                ut.perform_terminal_approach()
                            else:
                                break
                            terminal_approach_performed_flg = True
                            attempt_counter += 1  # Increment attempt counter.
                        else:
                            rospy.loginfo("performing scan")
                            scan_res = ut.ring_scan(2)
                            if scan_res:

				# Signal detected ring.
				sound_client.say('3detected')

                                # Mark ring.
                                trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
                                ut.mark_ring(trans, ut.depth, ut.offset_px)

                                ## CLASSIFY COLOR OF RING ###
    
                                cdt.subscribe()
                                ut.sidestep()
                                color_classification_res == cdt.get_ring_color()
                                sound_client.say('3' + color_classification_res)

                                # If correct color, perform terminal approach, else break
                                if color_classification_res == goal_color:
                                    ut.perform_terminal_approach()
                                else:
                                    break
                                terminal_approach_performed_flg = True
                                attempt_counter += 1  # Increment attempt counter.
                            else:
                                position_resolved_flg = True
                                if terminal_approach_performed_flg:
                                    collected_rings_counter += 1
                                    rospy.loginfo("ring collected")
                                    return

                    # Remove resolved checkpoint.
                    checkpoints = np.delete(checkpoints, (idx_nxt), axis=0)
                    checkpoint_orientations = np.delete(checkpoint_orientations, (idx_nxt), axis=0)
                    ##############################

        # restore checkpoints.
        checkpoints = checkpoints_backup.copy()
        checkpoint_orientations = checkpoint_orientations_backup.copy()

