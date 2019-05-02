#!/usr/bin/env python

import rospy

# publisher: node that broadcasts on a topic.
def publisher(text):
    pub = rospy.Publisher('say_command', SayCommand, queue_size = 10)  # Publish on topic customtopic.
    rospy.init_node('say_command_publisher', anonymous=True)  # The anonymous=True flag tells rospy to generate a unique name for the node so that you can have multiple listener.py nodes run easily.
    sp = SayCommand()
    sp.text = text
    pub.publish(sp)


if __name__ == "__main__":
    publisher('red')
