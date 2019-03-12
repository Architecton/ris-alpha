#!/usr/bin/env python

# Import rospy and custom message.
import rospy
from alpha1.msg import CustomMessage

# publisher: node that broadcasts on a topic.
def publisher():
    pub = rospy.Publisher('customtopic', CustomMessage, queue_size = 10)  # Publish on topic customtopic.
    rospy.init_node('publisher', anonymous=True)  # The anonymous=True flag tells rospy to generate a unique name for the node so that you can have multiple listener.py nodes run easily.
    rate = rospy.Rate(1)  # Publish at a rate of 1 hz.
    cid = 1
    while not rospy.is_shutdown():  # While publisher not shut down...
        cm = CustomMessage()  # Initialize custom message.
        cm.id = cid           # Set id.
        cid += 1              # Increment id.
        cm.message = "I am a message!"  # Set message.
        rospy.loginfo(cm)               # log message to console.
        pub.publish(cm)                 # Publish message.
        rate.sleep()                    # Wait to fulfill publishing rate.

# If run as script
if __name__ == '__main__':
    try:
        publisher()
    except rospy.ROSInterruptException:
        pass