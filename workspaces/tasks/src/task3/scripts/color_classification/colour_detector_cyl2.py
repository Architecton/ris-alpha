#!/usr/bin/env python
import numpy as np

import rospy
from colour_detection import ColourFeatureGenerator
from joblib import load
from task3.msg import CylinderImageFeedback
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2

class ColourDetectorCyl:
    def __init__(self, clf, num_bins):
	self._feature_gen = ColourFeatureGenerator(num_bins)
	self._clf = clf
        self._cylinder_image = np.empty(0, dtype=np.uint8)
        self._cv_bridge = CvBridge()
    	rospy.init_node('colour_detection_test', anonymous=True)


    def _depth_callback(self, data):

        """
        Callback called when broadcast on topic received.

        Args:
            data -- CylinderImageFeedback message instance

        Returns:
            None
        """

        center_y = data.center_y + 27  # Get y coordinate of center of cylinder.
        center_x = data.center_x - 17  # Get x coordinate of center of cylinder.
        min_axis = data.minor_axis  # Get minor axis of cylinder.
        maj_axis = data.major_axis  # Get major axis of cylinder.

        # Compute coordiantes of the top left corner and bottom right corners of the
        # cropped square.
        l_u = np.array([center_y - min_axis/2, center_x - min_axis/2])
        l_u[0] = np.clip(l_u[0], 0, 480)
        l_u[1] = np.clip(l_u[1], 0, 640)
        r_d = np.array([center_y + min_axis/2, center_x + min_axis/2])
        r_d[0] = np.clip(r_d[0], 0, 480)
        r_d[1] = np.clip(r_d[1], 0, 640)

        if self._cylinder_image.shape[0] > 0:
	    self._feature_gen.add_image(self._cylinder_image, 0, l_u, r_d)


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
        self._cylinder_image = received_image


    def subscribe(self):
        self._depth_subscriber = rospy.Subscriber('cylinders', CylinderImageFeedback, self._depth_callback)
        self._img_subscriber = rospy.Subscriber('/camera/rgb/image_raw', Image, self._img_callback)


    def _unsubscribe(self):
        self._depth_subscriber.unregister()
        self._img_subscriber.unregister()


    def get_cylinder_color(self):
        self._unsubscribe()
	features_mat_nxt, _ = self._feature_gen.compute_colour_features()  # Compute next block of the features matrix and target vector.
	self._feature_gen.clear()
	predictions = self._clf.predict(features_mat_nxt)
	(vals, ct) = np.unique(predictions, return_counts=True)
        return vals[np.argmax(ct)]
     

if __name__ == '__main__':
    clf = load('cylinder_colour_classifier.joblib')
    NUM_BINS = 100
    cdt = ColourDetectorCyl(clf, NUM_BINS)
    while True:
        cdt.subscribe()
        rospy.sleep(5)
        print cdt.get_cylinder_color()

