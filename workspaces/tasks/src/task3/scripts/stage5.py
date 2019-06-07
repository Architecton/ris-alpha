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


def stage_five(goal_x, goal_y):

    ### INITIALIZATIONS ###

    # Initialize sound node.
    soundhandle = SoundClient()
    rospy.sleep(1)
    voice = 'voice_kal_diphone'
    volume = 1.0

    # Notify start of initialization.
    soundhandle.say("Starting initialization of stage five.", voice, volume)

    # Initialize TargetMarker instance.
    tm = TargetMarker()

    # Initialize action clients
    ac_final = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    # Notify that search has started.
    soundhandle.say("Starting search.", voice, volume)


    ### /INITIALIZATIONS ###

    # Create final goal.
    goal_final = MoveBaseGoal()
    goal_final.target_pose.header.frame_id = "map"
    goal_final.target_pose.header.stamp = rospy.Time.now()
    goal_final.target_pose.pose.position.x = goal_x
    goal_final.target_pose.pose.position.y = goal_y
    goal_final.target_pose.pose.orientation.w = 0.5

    goal_final_status = GoalStatus.LOST  # Set status for final goal.
    ac_final.send_goal(goal_final) # Send goal.

    soundhandle.say("Resolving final position", voice, volume)

    # Loop for final  goal.
    while not goal_final_status == GoalStatus.SUCCEEDED:

        ac_final.wait_for_result(rospy.Duration(1.0))

        # Get final goal resolution goal status.
        goal_final_status = ac_final.get_state()

        # Handle abortions - reset goal.
        if goal_final_status == GoalStatus.ABORTED or goal_final_status == GoalStatus.REJECTED:
            rospy.loginfo("Checkpoint resolution goal aborted")
            goal_final_status = GoalStatus.LOST  # Reset status for final goal.
            ac_final.send_goal(goal_final)  # Send goal.


    # HERE if goal reached
    soundhandle.say("Finished", voice, volume)
