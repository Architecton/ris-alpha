#!/usr/bin/env python

from __future__ import absolute_import

import numpy as np
import rospy
from color_classification.colour_detection2 import ColourFeatureGenerator, ColourClassifier
from task3.msg import EllipseImageFeedback
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2


import pickle

import scipy.io as sio

import os

import pdb

from joblib import dump, load

class ColourDetectionTrainer:
    """
    Class used to record training data for ring colours and produce a classifier
    """

    def __init__(self, num_bins):
        self._num_bins = num_bins  # Number of bins to use in histograms.
        self._target = -1  # Initialize target value.
        self._feature_gen = ColourFeatureGenerator(self._num_bins)  # Initialize feature generator instance.
        # self.colour_dict = {0 : "red", 1 : "green", 2 : "blue", 3 : "black", 4: "yellow"}  # Initialize colour dictionary.
        self.colour_dict = {0 : "red", 1 : "green", 2 : "blue", 3 : "black", 4 : "yellow"}  # Initialize colour dictionary.
        self._learner = ColourClassifier(self.colour_dict)  # Initialize learner.
        self._features_mat = np.empty((0, self._num_bins*3), dtype=np.int)  # Initialize matrix of features.
        self._target_vec = np.empty(0, dtype=np.int)  # Initialize target vector.

	self.training_imgs = dict()
	self._training_img_counter = 0

        self._IMAGE_HEIGHT = 480
        self._IMAGE_WIDTH = 640

        self._ring_image = np.empty(0, dtype=np.uint8)
        self._cv_bridge = CvBridge()

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
	self._feature_gen.clear()


    def _depth_callback(self, data):

        """
        Callback called when broadcast on topic received.

        Args:
            data -- RingData message instance

        Returns:
            None
        """

        center_y = data.center_y + 27  # Get y coordinate of center of ring.
        center_x = data.center_x - 17  # Get x coordinate of center of ring.
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
            print "burek"
            self._feature_gen.add_image(self._ring_image, self._target, l_u, r_d)

	    # Add cropped image to array of training samples.
   	    self.training_imgs[self._training_img_counter] = self._ring_image[center_y-min_axis/2:center_y+min_axis/2, center_x-maj_axis/2:center_x+maj_axis/2]
	    self._training_img_counter += 1

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
        self._features_mat = np.vstack((self._features_mat, features_mat_nxt))  # Add block to features matrix.
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
        self._depth_subscriber = rospy.Subscriber('elipses', EllipseImageFeedback, self._depth_callback)
        self._img_subscriber = rospy.Subscriber('/camera/rgb/image_raw', Image, self._img_callback)

    def unsubscribe(self):
        # unscubscribe from topic
	self._depth_subscriber.unregister()
	self._img_subscriber.unregister()

    def save_obj(self, obj, name):
        with open(name + '.pkl', 'wb') as f:
       	    pickle.dump(obj, f, pickle.HIGHEST_PROTOCOL)


if __name__ == '__main__':

    ###
    #  Script used to record training data and produce classifier
    ###
    
    # Clear terminal.
   
    # Set number of bins to use
    NUM_BINS = 50
    
    # Initialize trainer
    trainer = ColourDetectionTrainer(num_bins=NUM_BINS)
    
    # Go over ring colours.
    for colour in trainer.colour_dict.keys():
    
        # Countdown to start of training data recording.
        countdown_val = 3
        while(countdown_val >= 1):
            print("Starting recording of {0} ellipse training data in:".format(trainer.colour_dict[colour]))
            print("{0}".format(countdown_val))
            countdown_val -= 1
            rospy.sleep(1)

        # Set target value, subscribe to topic and initialize recording timeout.
        trainer.set_target(colour)
        trainer.subscribe()
        recording_timeout = 0.1*60

        # Record training data for specified duration.
        while(recording_timeout >= 1):
            print("Recording {0} ellipse training data:".format(trainer.colour_dict[colour]))
            print("{0}".format(recording_timeout))
            recording_timeout -= 1
            rospy.sleep(1)

        # Unsubscribe from training data flow topic and get next blocks of
        # features vectors and target vector.
        trainer.unsubscribe()
        trainer.get_data()
        countdown_val = 1
    
    # Get classifier.
    clf = trainer.get_classifier()
    
    # Save classifier.
    print "saving classifier"
    dump(clf, '/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/color_classification/ellipse_colour_classifier.joblib') 
    print "saving matrices"
    sio.savemat('training_data_ell.mat', {'data' : trainer._features_mat})
    sio.savemat('training_data_target_ell.mat', { 'data' : trainer._target_vec})
    # print "saving training images"
    # trainer.save_obj(trainer.training_imgs, 'training_images')

