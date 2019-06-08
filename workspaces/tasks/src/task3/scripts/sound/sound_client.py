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

if __name__ == '__main__':
    rospy.init_node('test', anonymous=True)
    sc = SoundClient()
    rospy.sleep(3)
    sc.say('1intro')
    rospy.sleep(3)
    sc.say('1detecting_qr_code_and_pattern')
    rospy.sleep(3)
    sc.say('1detecting_qr_code')
    rospy.sleep(3)
    sc.say('1detecting_pattern')
    rospy.sleep(3)
    sc.say('1pattern_detected')
    rospy.sleep(3)
    sc.say('1qr_code_detected')
    rospy.sleep(3)
    sc.say('1zero')
    rospy.sleep(3)
    sc.say('1one')
    rospy.sleep(3)
    sc.say('1two')
    rospy.sleep(3)
    sc.say('1three')
    rospy.sleep(3)
    sc.say('1rotation')
    rospy.sleep(3)
    sc.say('1next_checkpoint')
    rospy.sleep(3)


    sc.say('2rotation')
    rospy.sleep(3)
    sc.say('2detecting_qr_code')
    rospy.sleep(3)
    sc.say('2red')
    rospy.sleep(3)
    sc.say('2green')
    rospy.sleep(3)
    sc.say('2blue')
    rospy.sleep(3)
    sc.say('2black')
    rospy.sleep(3)

    sc.say('3initialization')
    rospy.sleep(3)
    sc.say('3starting_search')
    rospy.sleep(3)
    sc.say('3detected')
    rospy.sleep(3)
    sc.say('3red')
    rospy.sleep(3)
    sc.say('3green')
    rospy.sleep(3)
    sc.say('3blue')
    rospy.sleep(3)
    sc.say('3black')
    rospy.sleep(3)
    sc.say('3verifying')
    rospy.sleep(3)
    sc.say('3done')
    rospy.sleep(3)

    sc.say('2rotation')
    rospy.sleep(3)
    sc.say('2map_interpretation')
    rospy.sleep(3)
    sc.say('2map_success')


