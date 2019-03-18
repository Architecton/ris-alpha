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

# First goal *
goal_list[0].target_pose.header.frame_id = "map"
goal_list[0].target_pose.header.stamp = rospy.Time.now()
goal_list[0].target_pose.pose.position.x = -1.276
goal_list[0].target_pose.pose.position.y = 2.121
goal_list[0].target_pose.pose.orientation.w = 0.850

# Second goal *
goal_list[1].target_pose.header.frame_id = "map"
goal_list[1].target_pose.header.stamp = rospy.Time.now()
goal_list[1].target_pose.pose.position.x = 0.421
goal_list[1].target_pose.pose.position.y = 0.166
goal_list[1].target_pose.pose.orientation.w = 0.597

# Third goal *
goal_list[2].target_pose.header.frame_id = "map"
goal_list[2].target_pose.header.stamp = rospy.Time.now()
goal_list[2].target_pose.pose.position.x = 2.195
goal_list[2].target_pose.pose.position.y = 0.723
goal_list[2].target_pose.pose.orientation.w = 0.999

# Fourth goal *
goal_list[3].target_pose.header.frame_id = "map"
goal_list[3].target_pose.header.stamp = rospy.Time.now()
goal_list[3].target_pose.pose.position.x = 1.832
goal_list[3].target_pose.pose.position.y = 2.986
goal_list[3].target_pose.pose.orientation.w = 0.882

# Fifth goal
goal_list[4].target_pose.header.frame_id = "map"
goal_list[4].target_pose.header.stamp = rospy.Time.now()
goal_list[4].target_pose.pose.position.x = 0.036
goal_list[4].target_pose.pose.position.y = 2.124
goal_list[4].target_pose.pose.orientation.w = 0.855

for i, goal in enumerate(goal_list):

	goal_state = GoalStatus.LOST

	rospy.loginfo("Sending goal {0}".format(i))
	ac.send_goal(goal)

	while (not goal_state == GoalStatus.SUCCEEDED):

		ac.wait_for_result(rospy.Duration(1))
		goal_state = ac.get_state()
		print goal_state
		#Possible States Are: PENDING, ACTIVE, RECALLED, REJECTED, PREEMPTED, ABORTED, SUCCEEDED, LOST.

		if not goal_state == GoalStatus.SUCCEEDED:
			rospy.loginfo("The goal has not been reached yet! Checking again in 1s.")
		else:
			rospy.loginfo("The goal was reached!")

	GoalStatus.SUCCEEDED
