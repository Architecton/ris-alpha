#!/usr/bin/env python

# Import rospy and custom message that the listener will receive.
import rospy
from alpha1.msg import CustomMessage

# callback: function called when node receives message with message content as the first argument.
def callback(data):
    rospy.loginfo('{0}\nThe id is {1} and the message is \'{2}\''.format(rospy.get_caller_id(), data.id, data.message))


def listener():
    rospy.init_node('listener', anonymous = True)  # The anonymous=True flag tells rospy to generate a unique name for the node so that you can have multiple listener.py nodes run easily.
    rospy.Subscriber('customtopic', CustomMessage, callback)  # Subscribe to customtopic, message format is CustomMessage, call callback when received data.
    rospy.spin()  # Keep node up until shut down.


# If file run as script
if __name__ == '__main__':
    listener()
