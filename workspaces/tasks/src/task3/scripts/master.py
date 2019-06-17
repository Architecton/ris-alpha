#!/usr/bin/env python
import roslib
import rospy
from stage1 import stage_one
from stage2 import stage_two
from stage3 import stage_three
from stage4 import stage_four
from stage5 import stage_five
import color_classification.colour_detection

rospy.init_node('master')
stage1_color_dict = {0: 'red', 1: 'green', 2: 'blue', 3: 'yellow'}

# CORRECT RESULTS FOR VARIOUS STAGES
CORRECT_RESULT_STAGE_ONE = 0
CORRECT_RESULT_STAGE_TWO = "blue"


## STAGE ONE ##
res1, hint_stage4 = stage_one()
###############

## STAGE TWO ##

#res1 = CORRECT_RESULT_STAGE_ONE
res2 = stage_two(stage1_color_dict[res1])
###############


## STAGE THREE ##
# res2 = CORRECT_RESULT_STAGE_TWO
stage_three(res2)
################


## STAGE FOUR ##
#import numpy as np
#hint_stage4 = np.array([])
#res2 = CORRECT_RESULT_STAGE_TWO
res4_x, res4_y = stage_four(res2, hint_stage4)

################


## STAGE FIVE ##
stage_five(res4_x, res4_y)
################

