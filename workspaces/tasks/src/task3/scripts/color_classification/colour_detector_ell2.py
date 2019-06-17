#!/usr/bin/env python
import numpy as np

import rospy
from colour_detection2 import ColourFeatureGenerator
from joblib import load
from task3.msg import EllipseImageFeedback
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2

class ColourDetectorEll:
    def __init__(self, clf, num_bins):
	self._feature_gen = ColourFeatureGenerator(num_bins)
	self._clf = clf
        self._ring_image = np.empty(0, dtype=np.uint8)
        self._cv_bridge = CvBridge()
    	#rospy.init_node('test', anonymous=True)


    def _depth_callback(self, data):

        """
        Callback called when broadcast on topic received.

        Args:
            data -- ApproachImageFeedback message instance

        Returns:
            None
        """

        center_y = data.center_y + 27  # Get y coordinate of center of ring.
        center_x = data.center_x - 17  # Get x coordinate of center of ring.
        min_axis = data.minor_axis  # Get minor axis of ring.
        maj_axis = data.major_axis  # Get major axis of ring.

        # Compute coordiantes of the top left corner and bottom right corners of the
        # cropped square.
        l_u = np.array([center_y - min_axis/2, center_x - min_axis/2])
        l_u[0] = np.clip(l_u[0], 0, 480)
        l_u[1] = np.clip(l_u[1], 0, 640)
        r_d = np.array([center_y + min_axis/2, center_x + min_axis/2])
        r_d[0] = np.clip(r_d[0], 0, 480)
        r_d[1] = np.clip(r_d[1], 0, 640)

        if self._ring_image.shape[0] > 0:
	    self._feature_gen.add_image(self._ring_image, 0, l_u, r_d)


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
        self._depth_subscriber = rospy.Subscriber('elipses', EllipseImageFeedback, self._depth_callback)
        self._img_subscriber = rospy.Subscriber('/camera/rgb/image_raw', Image, self._img_callback)


    def _unsubscribe(self):
        self._depth_subscriber.unregister()
        self._img_subscriber.unregister()


    def get_ellipse_color(self):
        self._unsubscribe()
	features_mat_nxt, _ = self._feature_gen.compute_colour_features()  # Compute next block of the features matrix and target vector.
	self._feature_gen.clear()
        if features_mat_nxt.size > 0: 
            predictions = self._clf.predict(features_mat_nxt)
            (vals, ct) = np.unique(predictions, return_counts=True)
            return vals[np.argmax(ct)]
        else:
            return 'fail'
     

if __name__ == '__main__':
    from sound.sound_client import SoundClient
    clf = load('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/color_classification/ellipse_colour_classifier.joblib')
    NUM_BINS = 50
    cdt = ColourDetectorEll(clf, NUM_BINS)
    sc = SoundClient()
    while True:
        cdt.subscribe()
        rospy.sleep(3)
        color = cdt.get_ellipse_color()
        if color == 'red':
            sc.say('4red')
        if color == 'green':
            sc.say('4green')
        if color == 'blue':
            sc.say('4blue')
        if color == 'black':
            sc.say('4black')
        if color == 'yellow':
            sc.say('4yellow')

