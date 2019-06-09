#!/usr/bin/env python
import roslib
import rospy
from stage1 import stage_one
from stage2 import stage_two
from stage3 import stage_three

rospy.init_node('master')
stage1_color_dict = {0: 'red', 1: 'green', 2: 'blue', 3: 'yellow'}

# CORRECT RESULTS FOR VARIOUS STAGES
CORRECT_RESULT_STAGE_ONE = 0  # TODO
CORRECT_RESULT_STAGE_TWO = 0  # TODO

"""
## STAGE ONE ##

res1 = stage_one()
print("Output of stage_one is {0} ({1}).".format(res1, stage1_color_dict[res1]))
print("Press enter if output of Stage 1 is OK, else enter correct color:")
correction = raw_input("0: 'red', 1: 'green', 2: 'blue', 3: 'yellow'")
if correction != '':
   res1 = int(correction)

###############
"""


## STAGE TWO ##

res1 = CORRECT_RESULT_STAGE_ONE
res2 = stage_two(stage1_color_dict[res1])
correction = raw_input("Press enter if output of Stage 2 is OK, else enter correct color (as string):")
if correction != '':
    res2 = correction

###############

"""

## STAGE THREE ##

# res2 = CORRECT_RESULT_STAGE_TWO
stage_three(res2)

################


## STAGE FOUR ##

# res2 = CORRECT_RESULT_STAGE_TWO

# NOTE: no corrections here!
res4_x, res4_y = stage_four(res2)

################



## STAGE FIVE ##

stage_five(res4_x, res4_y)

################

"""
