#!/usr/bin/env python
import roslib
import rospy
from stage1 import stage_one

rospy.init_node('master')

res1 = stage_one()
correction = raw_input("Press enter if output of Stage 1 is OK, else enter correct color:")
if correction != '':
   res1 = correction 

res2 = stage_two(res1)
correction = raw_input("Press enter if output of Stage 2 is OK, else enter correct color:")
if correction != '':
    res2 = correction

