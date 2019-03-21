#!/usr/bin/env python

import rospy
import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import numpy as np

goal_state = GoalStatus.LOST  # Default goal state is LOST

rospy.init_node('map_navigation', anonymous=False)  # Initialize navigation node.

ac = actionlib.SimpleActionClient("move_base", MoveBaseAction)  # Initialize action client.

while(not ac.wait_for_server(rospy.Duration.from_sec(2.0))):  # Wait for server.
              rospy.loginfo("Waiting for the move_base action server to come up")

# Define goal coordinates and orientations.
xyw = np.array([[-1.276, 2.121, 0.850], [0.421, 0.166, 0.597], [2.195, 0.723, 0.999], [1.832, 2.986, 0.882], [0.036, 2.124, 0.855]];
# Allocate list for goals.
goal_list = np.empty(xyw.shape[0], dtype=object)
for k in np.arrange(xyw.shape[0]):  # Initialize goals and add to list.
    goal = MoveBaseGoal;
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = xyw[k, 0]
    goal.target_pose.pose.position.y = xyw[k, 1]
    goal.target_pose.pose.orientation.w = xyw[k, 2]
    goal_list[k] = goal;
    
# Go over goals.
for i, goal in enumerate(goal_list):

    goal_state = GoalStatus.LOST  # Initial state is GoalStatus.LOST.

    rospy.loginfo("Sending goal {0}".format(i))  # Log sending next goal.
    ac.send_goal(goal)                           # Send goal.

    while (not goal_state == GoalStatus.SUCCEEDED):  # Until state not equal to GoalStatus.SUCCEED...

        ac.wait_for_result(rospy.Duration(1))  # Check if at goal every second.
        goal_state = ac.get_state()            # Get goal state.
        if goal_state == GoalStatus.ABORTED or goal_state == GoalStatus.REJECTED:  # If failed, move to next goal (if it exists).
            rospy.loginfo("Goal aborted.")  
            break

        if not goal_state == GoalStatus.SUCCEEDED:
            rospy.loginfo("The goal has not been reached yet! Checking again in 1s.")  # If still searching for goal, log.
        else:
            rospy.loginfo("The goal was reached!")  # If goal reached, log.
            GoalStatus.SUCCEEDED

