#!/usr/bin/env python

import rospy
import os

if __name__ == '__main__':
    rospy.init_node('music_node', anonymous = True)
    os.system('aplay /home/team_alpha/ris-alpha/workspaces/tasks/src/task2/scripts/sound/rick_roll.wav')
    os.system('aplay /home/team_alpha/ris-alpha/workspaces/tasks/src/task2/scripts/sound/banana_phone.wav')
    rospy.spin()
