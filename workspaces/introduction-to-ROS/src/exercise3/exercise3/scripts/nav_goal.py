#!/usr/bin/env python

import rospy
import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import numpy as np

goal_state = GoalStatus.LOST  # Default goal state is LOST

rospy.init_node('map_navigation', anonymous=False)  # Initialize navigation node.

ac = actionlib.SimpleActionClient("move_base", MoveBaseAction)

while(not ac.wait_for_server(rospy.Duration.from_sec(2.0))):  # Wait for server.
              rospy.loginfo("Waiting for the move_base action server to come up")

goal_list = [MoveBaseGoal() for k in range(5)]

xyw = np.array([[-1.276, 2.121, 0.850], [0.421, 0.166, 0.597], [2.195, 0.723, 0.999], [1.832, 2.986, 0.882], [0.036, 2.124, 0.855]];
for k, goal in enumerate(goal_list):
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = xyw[k, 0]
    goal.target_pose.pose.position.y = xyw[k, 1]
    goal.target_pose.pose.orientation.w = xyw[k, 2]
    

for i, goal in enumerate(goal_list):

    goal_state = GoalStatus.LOST

    rospy.loginfo("Sending goal {0}".format(i))
    ac.send_goal(goal)

    while (not goal_state == GoalStatus.SUCCEEDED):

        ac.wait_for_result(rospy.Duration(1))
        goal_state = ac.get_state()
        if goal_state == GoalStatus.ABORTED or goal_state == GoalStatus.REJECTED:
            rospy.loginfo("Goal aborted.")  
            break

        if not goal_state == GoalStatus.SUCCEEDED:
            rospy.loginfo("The goal has not been reached yet! Checking again in 1s.")
        else:
            rospy.loginfo("The goal was reached!")
            GoalStatus.SUCCEEDED

