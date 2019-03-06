#!/usr/bin/env python

import rospy
from alpha1.msg import CustomMessage

def publisher():
	pub = rospy.Publisher('customtopic', CustomMessage, queue_size = 10)
	rospy.init_node('publisher', anonymous=True)
	rate = rospy.Rate(1)
	cid = 1
	while not rospy.is_shutdown():
		cm = CustomMessage()
		cm.id = cid
		cid += 1
		cm.message = "I am a message!"
		rospy.loginfo(cm)
		pub.publish(cm)
		rate.sleep()

if __name__ == '__main__':
	try:
		publisher()
	except rospy.ROSInterruptException:
		pass	