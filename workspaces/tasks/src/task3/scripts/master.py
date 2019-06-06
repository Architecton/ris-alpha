#!/usr/bin/env python
import roslib
import rospy
from stage1 import stage_one

rospy.init_node('master')
stage1_color_dict = {0: 'red', 1: 'green', 2: 'blue': 3: 'yellow'}

res1 = stage_one()
print("Output of stage_one is {0} ({1}).".format(res1, stage1_color_dict[res1]))
print("Press enter if output of Stage 1 is OK, else enter correct color:")
correction = raw_input("0: 'red', 1: 'green', 2: 'blue', 3: 'yellow'")
if correction != '':
   res1 = int(correction)

res2 = stage_two(stage1_color_dict[res1])
correction = raw_input("Press enter if output of Stage 2 is OK, else enter correct color:")
if correction != '':
    res2 = correction

