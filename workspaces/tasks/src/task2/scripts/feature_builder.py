#!/usr/bin/env python

import numpy as np
import rospy

from cv_bridge import CvBridge, CvBridgeError

from sensor_msgs.msg import Image

from task2.srv import ColourClassificationSrv, FeatureBuilder

from task2.msg import ApproachImageFeedback

from colour_detection import RingImageProcessor

import pdb

class FeatureBuilderSrv:

    """
    Build features matrix from colour image and depth image feedback and call service running on workstation to
    perform classification.
    """


    def __init__(self, clf, num_bins):

        # Initialize RingImageProcessor instance with dummy classificator and use 100 bins.
        self._num_bins = num_bins  # Number of bins to use in histograms.
        self._ring_image_processor = RingImageProcessor(clf, self._num_bins)

        self._ring_image = np.empty(0, dtype=np.uint8)  # Next colour image from feedback.
        self._cv_bridge = CvBridge()  # cv bridge.
	
        rospy.wait_for_service('ring_colour_classification')  # Wait for classification service to come online (on workstation).
        try:
            self._classification_serv = rospy.ServiceProxy('ring_colour_classification', ColourClassificationSrv)  # Initialize service proxy.
        except rospy.ServiceException, e:
            print "Service error: {0}".format(e.message)



    def _depth_callback(self, data):

        """
        Callback called when broadcast on topic received.

        Args:
            data -- RingData message instance

        Returns:
            None
        """

	print "hopsasa"

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

        # Add image and class to feature generator  instance
        self._ring_image = received_image


    def _subscribe(self):

        """
        Subscribe to feedback broadcasted on topics.
        """

        self._depth_subscriber = rospy.Subscriber('toroids', ApproachImageFeedback, self._depth_callback)
        self._img_subscriber = rospy.Subscriber('/camera/rgb/image_raw', Image, self._img_callback)


    def _unsubscribe(self):

        """
        Unsubscribe to feedback broadcasted on topics.
        """

        self._depth_subscriber.unregister()
        self._img_subscriber.unregister()


    def _get_ring_colour(self):

        """
        Get prediction of ring colour based on produced features.
        """

        mat = self._ring_image_processor.get_colour_features_matrix()  # Get constructed features matrix.
        serv_res = self._classification_serv(np.ravel(mat), mat.shape[1])  # Get results of calling the classification service.
        self._ring_image_processor.clear()  # Clear features matrix of RingImageProcessor instance.
        return serv_res  # Return results of service.

    def _serv_callback(self, data):

        """
        Callback used to handle the requests for the service.
        """
        # If request to start recording.
        if data.flg == 1:
            self._subscribe()
            return "Fail"
        else:
            self._unsubscribe()
            res = self._get_ring_colour()
            return res.res


    def start_service(self):

        """
        Start service.
        """

        rospy.init_node('feature_builder_service')  # Initialize node and name it.
        rospy.Service('feature_builder', FeatureBuilder, self._serv_callback)  # Initialize service and name it.
        print "before spin"
        rospy.spin()  # Keep node alive until shut down.


if __name__ == '__main__':
    clf = None  # dummy classifier
    fb = FeatureBuilderSrv(clf, num_bins=100)  # Initialize Feature builder instance.
    fb.start_service()  # Start service.

