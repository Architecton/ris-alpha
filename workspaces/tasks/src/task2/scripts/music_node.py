#!/usr/bin/env python

import rospy
import os

if __name__ == '__main__':
    rospy.init_node('music_node', anonymous = True)
    os.system('aplay ./sound/rick_roll.wav')
    os.system('aplay ./sound/banana_phone.wav')
    rospy.spin()
