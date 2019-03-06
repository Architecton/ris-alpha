#!/usr/bin/env python

import rospy
from alpha1.msg import CustomMessage

def callback(data):
	rospy.loginfo(rospy.get_caller_id() + '\nThe id is %s and the message is \'%s\'', data.id, data.message)

def listener():
	rospy.init_node('listener', anonymous = True)
	rospy.Subscriber('customtopic', CustomMessage, callback)
	rospy.spin()

if __name__ == '__main__':
	listener()		