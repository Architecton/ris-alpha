#!/usr/bin/env python

import rospy
import numpy as np
from task2.srv import ColourClassificationSrv

from joblib import load

from colour_detection import ColourClassifier

class RingColourClassification:

    """
    Service that performs classification of ring image feature vectors.
    """
    
    def __init__(self, clf):
        self._clf = clf  #  Set classifier.
        

    def _perform_classification(data):

        """
        callback that handles requests for this service. Take matrix of features, perform classification and return prediction.
        """

        # Reshape received matrix of features.
        features_mat = np.reshape(data.features_mat, [len(data.features_mat)/data.num_features, data.num_features])
        predictions = self._clf.predict(features_mat)  # Get predictions and return prediction with most votes.
        (vals, ct) = np.unique(predictions, return_counts=True)
        return vals[np.argmax(ct)]


    def start_service():
        
        """
        Start service.
        """

        rospy.init_node('ring_colour_classification_service')  # Initialize node and name it.
        rospy.Service('ring_colour_classification', ColourClassificationSrv, self._perform_classification)  # Initialize service and name it.
        rospy.spin()  # Keep node alive until shut down.


if __name__ = "__main__":
    # TODO load classifier
    clf = load('./classifiers/ring_colour_classifier.joblib')
    rc = RingColourClassification(clf)
    rc.start_service()

