from std_msgs import UInt8
import rospy


pic_pub = rospy.Publisher('/free_to_detect', UInt8, queue_size=10)
rospy.init_node('detect_sync')

rate = rospy.Rate(1)
while not rospy.is_shutdown():
    pic_pub.publish(1)
    rate.sleep
