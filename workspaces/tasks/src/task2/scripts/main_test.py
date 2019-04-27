#!/usr/bin/env python

### Imports ###
import rospy
import numpy as np

import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

import tf2_ros
import tf2_geometry_msgs

from tf.transformations import quaternion_from_euler, euler_from_quaternion
from geometry_msgs.msg import Point, Vector3, PoseStamped, Twist

from task2.srv import TerminalApproach
from task2.msg import TerminalApproachFeedback
from task2.msg import ApproachImageFeedback

import time

import pdb
### /IMPORTS ###


### TERMINAL APPROACH ###

class TerminalApproachHandler:

    def __init__(self, window_size, target_center_x):

	# set window size in which to keep center of ring.
        self._WINDOW_SIZE = window_size
	self._target_center_x = target_center_x
        self._sprint_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1)
        self._corr = TerminalApproachFeedback()
        rospy.wait_for_service('terminal_approach')  # Wait for service to come online.
        try:
            self._corrections_serv = rospy.ServiceProxy('terminal_approach', TerminalApproach)  # Initialize service proxy.
        except rospy.ServiceException, e:
            print "Service error: {0}".format(e.message)

    def _image_feedback_callback(self, data):
	self._corr.target_center_x = self._target_center_x
        self._corr.center_x = data.center_x
        self._corr.window_size = self._WINDOW_SIZE
        self._corrections_serv(self._corr)
        # rospy.sleep(0.5)

    def sprint(self, sprint_duration, forward):
        msg = Twist()
        sprint_loop_rate = rospy.Rate(2)
        msg.linear.x = 0.1 if forward else -0.5
        # msg.angular.z = 0.1
        start_time = time.time()
        while(time.time() - start_time < sprint_duration):
            self._sprint_pub.publish(msg)  # Publish angular velocity.
            # msg.angular.z = -msg.angular.z
            sprint_loop_rate.sleep()

    def subscribe_to_feedback(self):
        self._feedback_subscriber = rospy.Subscriber('toroids', ApproachImageFeedback, self._image_feedback_callback)

    def unsubscribe_from_feedback(self):
        self._feedback_subscriber.unregister()


class Utils:
    def __init__(self, window_size, target_center_x, terminal_approach_duration):
        self._terminal_approach_duration
        self._tah = TerminalApproachHandler(window_size, target_center_x)
        self._detection_counter = 0
        self._rot_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1)

    def detect_ring(self):
        self._subscribe()
        rospy.sleep(1)
        self._subs.unregister()
        if self._detection_counter > 10:
            self._detection_counter = 0
            return True
        else:
            self._detection_counter = 0
            return False

    def ring_scan(ring_scan_duration):
        msg = Twist()
        scan_loop_rate = rospy.Rate(2)
        msg.angular.z = 0.1
        start_time = time.time()
        self._subscribe()
        while(time.time() - start_time < ring_scan_duration):
            self._rot_pub.publish(msg)  # Publish angular velocity.
            if self._detection_counter >= 4:
                self._detection_counter = 0
                return True
            scan_loop_rate.sleep()
        self._detection_counter = 0
        return False


    def perform_terminal_approach(self):
        self._tah.subscribe_to_feedback()
        rospy.sleep(self._terminal_approach_duration)
        
        # TODO: say colour of ring.
        
        # Go straight to pick up ring.
        self._tah.sprint(10, forward=True)
        self._tah.sprint(20, forward=False)

    def _callback(data):
        self._detection_counter += 1

    def _subscribe(self):
        self._subs = rospy.Subscriber('toroids', ApproachImageFeedback, self._callback)


if __name__ == "__main__":

    WINDOW_SIZE = 7
    TARGET_CENTER_X = 423
    TERMINAL_APPROACH_DURATION = 10

    # Initialize main node.
    rospy.init_node('main')

    # Initialize sound node.
    soundhandle = SoundClient()
    rospy.sleep(1)
    voice = 'voice_kal_diphone'
    volume = 1.0

    # Initialize action client
    ac_chkpnts = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    # Set array of checkpoints.
    checkpoints = np.array([[-1.276, 2.121, 0.850], [0.421, 0.166, 0.597], 
                            [2.195, 0.723, 0.999], [1.832, 2.986, 0.882], [0.036, 2.124, 0.855]])
    
    # Create instance of Utils class.
    ut = Utils(window_size=WINDOW_SIZE, target_center_x=TARGET_CENTER_X, terminal_approach_duration=TERMINAL_APPROACH_DURATION)

    # Initialize counter of collected rings.
    collected_rings_counter = 0
    
    # Wait for map cache to fill.
    rospy.sleep(5)

    # While there are unresolved checkpoints.
    while checkpoints.shape[0] > 0:
        
        # Get robot's current position.
        trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
        robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z])
        
        # Get index of closest checkpoint.
        idx_nxt = np.argmin((lambda x1, x2 : np.sum(np.abs(x1 - x2)**2.0, 1)**(1.0/2.0))(robot_pos, checkpoints))
    
        # Initialize next goal from closest checkpoint and visit it.
        goal_chkpt = MoveBaseGoal()
        goal_chkpt.target_pose.header.frame_id = "map"
        goal_chkpt.target_pose.header.stamp = rospy.Time.now()
        goal_chkpt.target_pose.pose.position.x = checkpoints[idx_nxt, 0]
        goal_chkpt.target_pose.pose.position.y = checkpoints[idx_nxt, 1]
        goal_chkpt.target_pose.pose.orientation.z = checkpoints[idx_nxt, 2]

        goal_chkpnt_status = GoalStatus.LOST  # Set status for next checkpoint goal.
        ac_chkpnts.send_goal(goal_chkpt)  # Send checkpoint goal.

        # Loop for next checkpoint goal.
        while not goal_chkpnt_status == GoalStatus.SUCCEEDED:

            ac_chkpnts.wait_for_result(rospy.Duration(1.0))

            # Get checkpoint resolution goal status.
            goal_chkpnt_status = ac_chkpnts.get_state()

            # Handle abortions.
            if goal_chkpnt_status == GoalStatus.ABORTED or goal_chkpnt_status == GoalStatus.REJECTED:
                rospy.loginfo("Checkpoint resolution goal aborted")
                break

            if goal_chkpnt_status == GoalStatus.SUCCEEDED:

                ## RING DETECTION PROCEDURE ##
                
                terminal_approach_performed_flg = False
                position_resolved_flg = False
            
                while not position_resolved_flg:
                    # See if ring detected in initial position.
                    detected_flg = detect_ring()
                    if detected_flg:
                        perform_terminal_approach()
                        terminal_approach_performed_flg = True
                    else:
                        scan_res = ut.ring_scan()
                        if scan_res:
                            perform_terminal_approach()
                            terminal_approach_performed_flg = True
                        else:
                            position_resolved_flg = True
                            if terminal_approach_performed_flg:
                                collected_rings_counter += 1

                checkpoints = np.delete(checkpoints, (idx_nxt), axis=0)
                ##############################

