#!/usr/bin/env python

### Imports ###
import rospy
import numpy as np

from task2.srv import TerminalApproach
from task2.msg import TerminalApproachFeedback
from task2.msg import ApproachImageFeedback
### /IMPORTS ###


### TERMINAL APPROACH ###

class TerminalApproachHandler:

    def __init__(self, window_size):
        self._WINDOW_SIZE = window_size
        self._sprint_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
        rospy.wait_for_service('terminal_approach')  # Wait for service to come online.
        try:
            self._corrections_serv = rospy.ServiceProxy('terminal_approach', TerminalApproach)  # Initialize service proxy.
        except rospy.ServiceException, e:
            print "Service error: {0}".format(e.message)

    def _image_feedback_callback(data):
        corr = TerminalApproachFeedback()
        corr.center_x = self._center_x
        corr.center_y = self._center_y
        corr.window_size = self._WINDOW_SIZE
        self._corrections_serv(corr)

    def sprint(sprint_duration):
        msg = Twist()
        sprint_loop_rate = Rospy.rate(10)
        msg.linear.x = 2.0
        start_time = time.time()
        while(time.time() - start_time < sprint_duration):
            self._sprint_pub.publish(msg)  # Publish angular velocity.
            sprint_loop_rate.sleep()  # TODO: EMPIRICALLY SET

    def subscribe_to_feedback():
        self._feedback_subscriber = rospy.Subscriber('toroids', ApproachImageFeedback, self._image_feedback_callback)

    def unsubscribe_from_feedback():
        self._feedback_subscriber.unregister()


if __name__ = "__main__":

    # Initialize action client.
    ac_chkpnts = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    # Initialize coordinate transforms buffer.
    tf2_buffer = tf2_ros.Buffer()
    tf2_listener = tf2_ros.TransformListener(tf2_buffer)
    
    # Set window size.
    WINDOW_SIZE = 10
    # Initialize Terminal Approach handler.
    tah = TerminalApproachHandler(WINDOW_SIZE)
    tah.subscribe_to_feedback()

    # Define goals that are perpendicular to rings.
    checkpoints = np.array([[-1.276, 2.121, 0.850], [0.421, 0.166, 0.597], [2.195, 0.723, 0.999], [1.832, 2.986, 0.882], [0.036, 2.124, 0.855]])

    # While there are unresolved goals.
    while checkpoints.shape[0] > 0:
    
        # Get current robot's position.
        trans = tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
        robot_pos = np.array([trans.transform.translation.x, trans.transform.translation.y, trans.transform.translation.z])


        # Go to closest goal.
        nxt_goal_idx = np.argmin((lambda x1, x2 : np.sum(np.abs(x1 - x2)**2)**(1.0/2.0))(robot_pos, perp_checkpoints))

        # Create goal for next checkpoint.
        goal_chkpt = MoveBaseGoal()
        goal_chkpt.target_pose.header.frame_id = "map"
        goal_chkpt.target_pose.header.stamp = rospy.Time.now()
        goal_chkpt.target_pose.pose.position.x = checkpoints[nxt_goal_idx, 0]
        goal_chkpt.target_pose.pose.position.y = checkpoints[nxt_goal_idx, 1]
        goal_chkpt.target_pose.pose.orientation.w = checkpoints[nxt_goal_idx, 2]

        goal_chkpnt_status = GoalStatus.LOST  # Set status for next checkpoint goal.
        ac_chkpnts.send_goal(goal_chkpt) # Send checkpoint goal.

        # Loop for next checkpoint goal.
        while not goal_chkpnt_status == GoalStatus.SUCCEEDED:

            ac_chkpnts.wait_for_result(rospy.Duration(1.0))

            # Get checkpoint resolution goal status.
            goal_chkpnt_status = ac_chkpnts.get_state()

            # Handle abortions
            if goal_chkpnt_status == GoalStatus.ABORTED or goal_chkpnt_status == GoalStatus.REJECTED:
                rospy.loginfo("Checkpoint resolution goal aborted")
                break


        # Align for 5 seconds.
        tah.subscribe_to_feedback()
        rospy.sleep(5)
        tah.unsubscribe_from_feedback

        # Go straight to pick up ring.
        tah.sprint(4)

