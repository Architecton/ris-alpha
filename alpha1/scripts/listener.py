#!/usr/bin/env python

import rospy
from alpha1.msg import CustomMessage

def callback(data):
	rospy.loginfo('{0}\nThe id is {1} and the message is \'{2}\''.format(rospy.get_caller_id(), data.id, data.message))

def listener():
	rospy.init_node('listener', anonymous = True)
	rospy.Subscriber('customtopic', CustomMessage, callback)
	rospy.spin()

if __name__ == '__main__':
	listener()		