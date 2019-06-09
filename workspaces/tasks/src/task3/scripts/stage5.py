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

from locators.target_marking.targetmarker import TargetMarker

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient

from sound.sound_client import SoundClient

import pdb

### /IMPORTS ###


"""
Description:

Stage five navigates the robot to the final goal that was obtained from the map.
It receives the x and y coordinates of the goal from the preceding fourth stage.

params:
    goal_x : int - x coordinate of the final goal position
    goal_y : int - y coordinate of the final goal position
"""


def stage_five(goal_x, goal_y):
    # Initialize sound client.
    sound_client = SoundClient()


    # Initialize TargetMarker instance.
    tm = TargetMarker()

    # Initialize action clients
    ac_final = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    ### /INITIALIZATIONS ###

    rospy.sleep(5)

    # Initialize final goal.
    goal_final = MoveBaseGoal()
    goal_final.target_pose.header.frame_id = "map"
    goal_final.target_pose.header.stamp = rospy.Time.now()
    goal_final.target_pose.pose.position.x = goal_x
    goal_final.target_pose.pose.position.y = goal_y
    goal_final.target_pose.pose.orientation.w = 0.5

    goal_final_status = GoalStatus.LOST  # Set status for final goal.
    ac_final.send_goal(goal_final) # Send goal.

    sound_client.say("5start")

    # Loop for final  goal.
    while not goal_final_status == GoalStatus.SUCCEEDED:

        # Wait before checking status.
        ac_final.wait_for_result(rospy.Duration(1.0))

        # Get final goal resolution goal status.
        goal_final_status = ac_final.get_state()

        # Handle abortions - reset goal.
        if goal_final_status == GoalStatus.ABORTED or goal_final_status == GoalStatus.REJECTED:

            rospy.loginfo("Checkpoint resolution goal aborted")
            goal_final_status = GoalStatus.LOST  # Reset status for final goal.
            ac_final.send_goal(goal_final)  # Send goal.

    # HERE if goal reached
    sound_client.say("5finish")

