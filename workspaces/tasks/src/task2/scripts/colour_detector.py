#!/usr/bin/env python
import numpy as np

import rospy
from colour_detection import RingImageProcessor
from joblib import load

from task2.msg import ApproachImageFeedback

from sensor_msgs.msg import Image

from cv_bridge import CvBridge, CvBridgeError
import cv2

class ColourDetector:
    def __init__(self, clf, num_bins):
        self._ring_image_processor = RingImageProcessor(clf, 100)
        self._num_bins = num_bins  # Number of bins to use in histograms.

        self._ring_image = np.empty(0, dtype=np.uint8)
        self._cv_bridge = CvBridge()


    def _depth_callback(self, data):

        """
        Callback called when broadcast on topic received.

        Args:
            data -- RingData message instance

        Returns:
            None
        """

        center_y = data.center_y  # Get y coordinate of center of ring.
        center_x = data.center_x  # Get x coordinate of center of ring.
        min_axis = data.minor_axis  # Get minor axis of ellipse.
        maj_axis = data.major_axis  # Get major axis of ellipse.

        # Compute coordiantes of the top left corner and bottom right corners of the
        # cropped square.
        l_u = np.array([center_y - min_axis/2, center_x - min_axis/2])
        l_u[0] = np.clip(l_u[0], 0, 480)
        l_u[1] = np.clip(l_u[1], 0, 640)
        r_d = np.array([center_y + min_axis/2, center_x + min_axis/2])
        r_d[0] = np.clip(r_d[0], 0, 480)
        r_d[1] = np.clip(r_d[1], 0, 640)

        if self._ring_image.shape[0] > 0:
            # Add image and class to feature generator instance
            self._ring_image_processor.img_to_feature(self._ring_image, l_u, r_d)


    def _img_callback(self, data):

        """
        Callback called when broadcast on topic received.

        Args:
            data -- data from rgb camera

        Returns:
            None
        """

        # Convert to bgr image
        try:
            received_image = self._cv_bridge.imgmsg_to_cv2(data, 'bgr8')
        except CvBridgeError as e:
            print(e)

        # Add image and class to feature generator instance
        self._ring_image = received_image


    def subscribe(self):
        self._depth_subscriber = rospy.Subscriber('toroids', ApproachImageFeedback, self._depth_callback)
        self._img_subscriber = rospy.Subscriber('/camera/rgb/image_raw', Image, self._img_callback)


    def _unsubscribe(self):
        self._depth_subscriber.unregister()
        self._img_subscriber.unregister()


    def get_ring_color(self):
        self._unsubscribe()
        res = self._ring_image_processor.get_ring_color()
        self._ring_image_processor.clear()
        return res
     
    
if __name__ == '__main__':
    clf = load('ring_colour_classifier.joblib')
    cdt = ColourDetector(clf, 100)
    cdt.subscribe()
    rospy.spin()
