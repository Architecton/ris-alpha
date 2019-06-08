#!/usr/bin/env python

import rospy
from task3.msg import SayCommand

if __name__ == '__main__':
    rospy.init_node('test', anonymous=True)
    say_pub = rospy.Publisher('say_commands', SayCommand, queue_size = 10)
    nxt = SayCommand()
    nxt.text = "red"
    rospy.sleep(1)
    say_pub.publish(nxt)
    rospy.sleep(1)
    rospy.spin()
