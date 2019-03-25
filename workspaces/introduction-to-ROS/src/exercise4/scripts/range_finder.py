from sensor_msgs.msg import LaserScan
from exercise4.srv import ForwardRange

buff = 0.0

def callback(data):
    buff = data.ranges[len(ranges)//2]

def req_handler(req):
    return buff


def range_finder_server():
    rospy.Subscriber('scan', LaserScan, callback)
    rospy.init_note('range_finder_server')
    rospy.Service('range_finder', ForwardRange, req_handler)
    rospy.spin()

if __name__ == '__main__':
    range_finder_server()
