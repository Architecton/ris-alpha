#!/usr/bin/env python

import numpy as np
import rospy
from colour_detection import ColourFeatureGenerator, ColourClassifier
from task2.msg import RingData

import os

from joblib import dump, load

class ColourDetectionTrainer:
    """
    Class used to record training data for ring colours and produce a classifier
    """

    def __init__(self, num_bins):
        self._num_bins = num_bins  # Number of bins to use in histograms.
        self._target = -1  # Initialize target value.
        self._feature_gen = ColourFeatureGenerator(self._num_bins)  # Initialize feature generator instance.
        self.colour_dict = {0 : "red", 1 : "green", 2 : "blue", 3 : "black"}  # Initialize colour dictionary.
        self._learner = ColourClassifier(self.colour_dict)  # Initialize learner.
        self._features_mat = np.empty((0, self._num_bins*3), dtype=np.int)  # Initialize matrix of features.
        self._target_vec = np.empty(0, dtype=np.int)  # Initialize target vector.

        self._IMAGE_HEIGHT = 480
        self._IMAGE_WIDTH = 640

        # initialize node
        rospy.init_node('colour_detection_trainer', anonymous=True)

    def set_target(self, target):
        """
        Set target variable value of images that are being received by the subscriber

        Args:
            target : np.int -- value of the target variable for images being received by the subscriber

        Returns:
            None
        """
        self._target = target

    def _callback(self, data):

        """
        Callback called when broadcast on topic received.

        Args:
            data -- RingData message instance

        Returns:
            None
        """

        center_y = data.center_y  # Get y coordinate of center of ring.
        center_x = data.center_x  # Get x coordinate of center of ring.
        rad = data.rad  # Get radius of ring.
        im = np.reshape(data.img, [self._IMAGE_HEIGHT, self._IMAGE_WIDTH, 3])  # Get bgr image.

        # Compute coordiantes of the top left corner and bottom right corners of the
        # cropped square.
        l_u = np.array([center_y - rad, center_x - rad])
        r_d = np.array([center_y + rad, center_x + rad])

        # Add image and class to feature generator instance
        self._feature_gen.add_image(im, self._target, l_u, r_d)

    def get_data(self):
        """
        get next blocks of features matrix and target vector.

        Args:
            -
        Returns:
            -
        """

        # get feature and target matrix from generator instance and store in _features_mat and _target_vec
        features_mat_nxt, target_nxt = self._feature_gen.compute_colour_features()  # Compute next block of the features matrix and target vector.
        self._features_mat = np.hstack((self._features_mat, features_mat_nxt))  # Add block to features matrix.
        self._target_vec = np.hstack((self._target_vec, target_nxt))  # Add block to target vector.

    def get_classifier(self):
        """
        train and return classifier using the features matrix and target values vector of this instance

        Args:
            -
        Returns:
            trained classifier instance
        """

        # Train classifier using data in _features_mat and _target_vec
        # and return it.
        return self._learner.fit(self._features_mat, self._target_vec)

    def subscribe(self):
        # subscribe to topic
        self._subscriber = rospy.Subscriber('ring_data', RingData, self._callback)

    def unsubscribe(self):
        # unscubscribe from topic
        self._subscriber.unregister()


if __name__ == '__main__':

    ###
    #  Script used to record training data and produce classifier
    ###
    
    # Clear terminal.
    os.system('clear')

    # Initialize trainer
    trainer = ColourDetectionTrainer(num_bins=256)    
    
    # Go over ring colours.
    for colour in trainer.colour_dict.keys():
    
        # Countdown to start of training data recording.
        countdown_val = 15
        while(countdown_val >= 1):
            print("Starting recording of {0} ring training data in:".format(trainer.colour_dict[colour]))
            print("{0}".format(countdown_val))
            countdown_val -= 1
            rospy.sleep(1)
            os.system('clear')

        # Set target value, subscribe to topic and initialize recording timeout.
        trainer.set_target(colour)
        trainer.subscribe()
        recording_timeout = 60

        # Record training data for specified duration.
        while(recording_timeout >= 1):
            print("Recording {0} ring training data:".format(trainer.colour_dict[colour]))
            print("{0}".format(recording_timeout))
            recording_timeout -= 1
            rospy.sleep(1)
            os.system('clear')

        # Unsubscribe from training data flow topic and get next blocks of
        # features vectors and target vector.
        trainer.unsubscribe()
        trainer.get_data()
        countdown_val = 15
       
    # Get classifier.
    clf = trainer.get_classifier()
    
    # Save classifier.
    dump(clf, 'ring_colour_classifier.joblib') 
