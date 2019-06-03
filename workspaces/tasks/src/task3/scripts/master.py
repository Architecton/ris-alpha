#!/usr/bin/env python
import roslib
import rospy
from stage1 import stage_one

rospy.init_node('master')

res = stage_one()
print res
