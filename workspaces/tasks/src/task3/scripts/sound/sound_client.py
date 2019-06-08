#!/usr/bin/env python

import rospy
from task3.msg import SayCommand

class SoundClient:
    def __init__(self):
        self._say_pub = rospy.Publisher('say_commands', SayCommand, queue_size = 10)

    def say(self, data):
        msg = SayCommand()
        msg.text = data
        self._say_pub.publish(msg)

