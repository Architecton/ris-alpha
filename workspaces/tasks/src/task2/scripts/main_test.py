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

from task2.srv import TerminalApproach
from task2.msg import TerminalApproachFeedback
from task2.msg import ApproachImageFeedback

# from colour_detector import ColourDetector

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
        try:
            self._corrections_serv = rospy.ServiceProxy('terminal_approach', TerminalApproach)  # Initialize service proxy.
        except rospy.ServiceException, e:
            print "Service error: {0}".format(e.message)

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

    def sprint(self, sprint_duration, forward):
        """
        perform movement in straight line for specified duration.
        """

        msg = Twist()
        sprint_loop_rate = rospy.Rate(2)
        msg.linear.x = 0.1 if forward else -0.5  # Set speed.
        # msg.angular.z = 0.1
        start_time = time.time()
        while(time.time() - start_time < sprint_duration):
            self._sprint_pub.publish(msg)  # Publish angular velocity.
            # msg.angular.z = -msg.angular.z
            sprint_loop_rate.sleep()

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
        self._detection_counter = 0  # Counter of detected rings.

        # publisher of Twist messages.
        self._rot_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1)

        # Load classifier.
        #self._clf = load('ring_colour_classifier.joblib')
        # Instantiate ColourDetector instance
        #self._cdt = ColourDetector(self._clf, 100)


    def detect_ring(self):
        """
        try to detect ring in current position
        """

        self._subscribe()  # Subscribe to toroids topic and wait.
        rospy.sleep(3)
        self._subs.unregister()
        if self._detection_counter > 10:  # If detected more than 10 rings, declare ring found.
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
            if self._detection_counter >= 1:  # If found ring 3 or more times, declare ring found.
                self._detection_counter = 0
                self._subs.unregister()
                return True
            scan_loop_rate.sleep()
        self._detection_counter = 0
        self._subs.unregister()
        return False


    def perform_terminal_approach(self):
        """
        perform terminal approach to the ring.
        """
        self._tah.subscribe_to_feedback()
        # self._cdt.subscribe()
        rospy.sleep(self._terminal_approach_duration)
        
        # TODO: say colour of ring.
        # print self._cdt.get_ring_color()
        
        # Go straight to pick up ring.
        self._tah.sprint(10, forward=True)  # Final run to pick up the ring.
        self._tah.unsubscribe_from_feedback()
        self._tah.sprint(3.4, forward=False)  # Reverse (to check if ring picked up).

    def _callback(self, data):
        """
        callback called when topic published on /toroids. Used to count ring detections.
        """
        self._detection_counter += 1  # Increment counter of detected rings.

    def _subscribe(self):
        """
        subscribe to /toroid topic to listen for ring detections.
        """
        self._subs = rospy.Subscriber('toroids', ApproachImageFeedback, self._callback)


if __name__ == "__main__":

    ## PARAMETERS ##
    WINDOW_SIZE = 7
    TARGET_CENTER_X = 423
    TERMINAL_APPROACH_DURATION = 10
    ################

    # Initialize main node.
    rospy.init_node('main')

    # Initialize sound node.
    soundhandle = SoundClient()
    rospy.sleep(1)
    voice = 'voice_kal_diphone'
    volume = 1.0

    # Initialize action client
    ac_chkpnts = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    # Define array of checkpoints.
    checkpoints = np.array(
        [[0.105893270894, 0.136317363463],
        [-0.0343030632612, 2.70417335956],
        [1.31084515827, 1.51287972294],
        [2.81970682896, 1.79192063586],
        [1.91655018277, 0.858679839984], 
        [0.863168808613, 2.11869023203],
        [2.09860654436, 3.02047163568],
        [1.97930727727, 2.97823109257]])

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
    
    # Create instance of Utils class.
    ut = Utils(window_size=WINDOW_SIZE, target_center_x=TARGET_CENTER_X, terminal_approach_duration=TERMINAL_APPROACH_DURATION)

    # Initialize counter of collected rings.
    collected_rings_counter = 0

    # Initialize coordinate transforms buffer.
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)
    
    # Wait for map cache to fill.
    rospy.sleep(5)

    # While there are unresolved checkpoints.
    while checkpoints.shape[0] > 0:
        
        # Get robot's current position.

        trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
        robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y])
        
        # Get index of closest checkpoint.
        idx_nxt = np.argmin((lambda x1, x2 : np.sum(np.abs(x1 - x2)**2.0, 1)**(1.0/2.0))(robot_pos, checkpoints))
	print "resolving next checkpoint"
    
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
            
                while not position_resolved_flg:
                    # See if ring detected in initial position.
                    print "detecting ring"
                    detected_flg = ut.detect_ring()
                    if detected_flg:
                        ut.perform_terminal_approach()
                        terminal_approach_performed_flg = True
                    else:
                        print "performing scan"
                        scan_res = ut.ring_scan(2)
                        if scan_res:
                            ut.perform_terminal_approach()
                            terminal_approach_performed_flg = True
                        else:
                            position_resolved_flg = True
                            if terminal_approach_performed_flg:
                                # TODO say that ring was successfully picked up.
                                collected_rings_counter += 1

                checkpoints = np.delete(checkpoints, (idx_nxt), axis=0)
                checkpoint_orientations = np.delete(checkpoint_orientations, (idx_nxt), axis=0)
                ##############################

