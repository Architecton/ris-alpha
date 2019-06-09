#!/usr/bin/env python
import numpy as np
import os
from sklearn.ensemble import RandomForestClassifier
from sklearn.neural_network import MLPClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
import cv2 as cv

class ColourClassifier:


    # Constructor
    def __init__(self, colour_dict):
        self.colour_dict = colour_dict  # Set dictionary that maps color values to color names


    def fit(self, data, target):
        """
        Produce a colour classifier trained on passed training data.
        
        Args:
            data : Array[np.int8] -- matrix of training samples (colour features of training images)
            target: Array[np.int32] -- target values of training examples

        Returns:
            self
        """
        self.scaler = StandardScaler().fit(data)  # Initialize feature scaler.

        # Initialize learner.
        # learner = RandomForestClassifier(n_estimators=100, random_state=0, max_depth=5)
        # learner = MLPClassifier(solver='lbfgs', alpha=1e-5, hidden_layer_sizes=(7, 2), random_state=1)
        learner = SVC(gamma='auto')
        # learner = RandomForestClassifier(n_estimators=100, random_state=0, max_depth=5)
        self.clf = learner.fit(self.scaler.transform(data), target)  # Train classifier.
        return self


    def predict(self, data):
        """
        Classify color feature vector

        Args:
            data : Array[np.int8] -- matrix of colour feature vectors to classify

        Returns:
            vector of colour predictions for each colour feature vector
        """
        return np.array([self.colour_dict[p] for p in self.clf.predict(self.scaler.transform(data))])


### ColourFeatureGenereator ###

###
# This class is used to generate a matrix of feature vectors and a vector of target values from images.
# The results generated using this class can be used to train a classifier using the ColourClassifier class.
###

class ColourFeatureGenerator:

    # Constructor
    def __init__(self, num_bins):
        self._num_bins = num_bins  # Set number of bins in histograms.
        self._img_counter = 0  # image index counter
        self._img_dict = dict()  # Dictionary for storing images
        self._target_dict = dict()  # Dictionary for storing target values
   

    def add_image(self, img, target_val, l_u, r_d):

        """
        Add image to dictionary

        Args:
            img : Array[np.int8] -- image to add to dictionary of images
            target_val : np.int -- target variable value (representing colour)
            l_u : Array[np.int8] -- left upper corner of square containing the part of image to use to compute feature
            r_d : Array[np.int8] -- right lower corner of square containing the part of image to use to compute feature

        Returns:
            None
        """        

        self._img_dict[self._img_counter] = img[l_u[0]:r_d[0]+1, l_u[1]:r_d[1]+1]  # Add cropped image to dictionary.
        self._target_dict[self._img_counter] = target_val  # Add target value to dictionary.
        self._img_counter += 1  # Increment image index counter.


    def add_image_new(self, img, l_u, r_d):

        """
        Add image to dictionary

        Args:
            img : Array[np.int8] -- image to add to dictionary of images
            l_u : Array[np.int8] -- left upper corner of square containing the part of image to use to compute feature
            r_d : Array[np.int8] -- right lower corner of square containing the part of image to use to compute feature

        Returns:
            None
        """        

        self._img_dict[self._img_counter] = img[l_u[0]:r_d[0]+1, l_u[1]:r_d[1]+1]  # Add cropped image to dictionary.
        self._img_counter += 1  # Increment image index counter.


    def compute_colour_features(self):
        """
        Compute colour features for each image stored in image dictionary

        Args:
            -
            
        Returns:
           Array[np.int64] -- matrix of colour features that can be used to train classifier
           Array[np.int64] -- vector of target values corresponding to each image
        """
        colour_features_mat = np.empty((self._img_counter, self._num_bins*3), dtype=np.int)  # Allocate matrix for storing feature vectors.
        target = np.empty(self._img_counter, dtype=np.int)  # Allocate vector for storing target values.
        for img_idx in self._img_dict.keys():
	    img_nxt = cv.cvtColor(self._img_dict[img_idx], cv.COLOR_BGR2HSV)
            img_nxt[30:img_nxt.shape[0]-30, 30:img_nxt.shape[1]-30, :] = 0
            hist_b, _ = np.histogram(img_nxt[:, :, 0], bins=self._num_bins)
            hist_g, _ = np.histogram(img_nxt[:, :, 1], bins=self._num_bins)
            hist_r, _ = np.histogram(img_nxt[:, :, 2], bins=self._num_bins)
            feature = np.hstack((hist_b, hist_g, hist_r))  # Compute feature from channel histograms.
            colour_features_mat[img_idx, :] = feature  # Add feature to features matrix.
            target[img_idx] = self._target_dict[img_idx]  # Add target value to vector of target values.

        return colour_features_mat, target  # Return matrix of feature vectors and target values


    def compute_colour_features_new(self):
        """
        Compute colour features for each image stored in image dictionary (no target value)

        Args:
            -
            
        Returns:
           Array[np.int64] -- matrix of colour features
        """

        colour_features_mat = np.empty((self._img_counter, self._num_bins*3), dtype=np.int)  # Allocate matrix for storing feature vectors.
        for img_idx in self._img_dict.keys():
	    img_nxt = cv.cvtColor(self._img_dict[img_idx], cv.COLOR_BGR2HSV)
            img_nxt[30:img_nxt.shape[0]-30, 30:img_nxt.shape[1]-30, :] = 0
            hist_b, _ = np.histogram(img_nxt[:, :, 0], bins=self._num_bins)
            hist_g, _ = np.histogram(img_nxt[:, :, 1], bins=self._num_bins)
            hist_r, _ = np.histogram(img_nxt[:, :, 2], bins=self._num_bins)
            feature = np.hstack((hist_b, hist_g, hist_r))  # Compute feature from channel histograms.
            colour_features_mat[img_idx, :] = feature  # Add feature to features matrix.

        return colour_features_mat  # Return matrix of feature vectors and target values


    def clear(self):
        """
        Clear image index counter and image and target data dictionaries

        Args:
            -
        Returns:
            -
        """
        self._img_counter = 0
        self._img_dict.clear()
        self._target_dict.clear()
        

class RingImageProcessor:

    """
    Class used to detect colors of rings from stream of data containing the bgr image of the
    ring, the indices of the center of the ring and its radius.
    """

    # Constructor
    def __init__(self, clf, num_bins):
        self._clf = clf  # learned classifier
        self._num_bins = num_bins  # number of bins to use when computing histograms
        self._colour_features_mat = np.empty((0, num_bins*3), dtype=np.int)  # Matrix for storing features

    def _crop_to_ring(self, img, l_u, r_d):
        """
        Crop image to extract part where ring is located

        Args:
            img : Array[np.int8] -- raw rgb image
            l_u : Array[np.int] -- pixel indices of the left upper corner of location to extract
            r_d : Array[np.int] -- pixel indices of the right lower corner of location to extract

        Returns:
            None
        """

        return img[l_u[0]:r_d[0]+1, l_u[1]:r_d[1]+1, :]  # Return cropped image.

    def _get_color_feature(self, cropped_img):
        """
        Compute color feature vector of cropped image

        Args:
            cropped_img: image cropped to part where ring is located

        Returns:
            None
        """

        # Compute channel histograms.
	cropped_img = cv.cvtColor(cropped_img, cv.COLOR_BGR2HSV)
        hist_b, _ = np.histogram(cropped_img[:, :, 0], bins=self._num_bins)
        hist_g, _ = np.histogram(cropped_img[:, :, 1], bins=self._num_bins)
        hist_r, _ = np.histogram(cropped_img[:, :, 2], bins=self._num_bins)
        return np.hstack((hist_r, hist_g, hist_b))  # Return computed colour feature.

    def img_to_feature(self, img, l_u, r_d):
        """
        Compute colour feature from image and add to matrix of features

        Args:
            img : Array[np.int8] -- image from which to compute the colour feature (nxmx3 matrix)
            l_u : Array[np.int8] -- coordinates of the left upper corner of the part of image on which to compute feature
            r_d : Array[np.int8] -- coordinates of the right lower corner of the part of image on which to compute feature

        Returns:
            None
        """
        cropped_img = self._crop_to_ring(img, l_u, r_d)
        colour_feature_nxt = self._get_color_feature(cropped_img)
        self._colour_features_mat = np.vstack((self._colour_features_mat, colour_feature_nxt))


    def get_colour_features_matrix(self):
        return self._colour_features_mat

    
    def get_ring_color(self):
        """
        Classify color based on colour features in colour features matrix.

        Args:
            

        Returns:
            The name of colour with most "votes"
        """
        if (self._colour_features_mat.shape[0] > 0):
            predictions = self._clf.predict(self._colour_features_mat)
            (vals, ct) = np.unique(predictions, return_counts=True)
            return vals[np.argmax(ct)]
        else:
            return -1

    def clear(self):
        self._colour_features_mat = np.empty((0, self._num_bins*3), dtype=np.int)  # Matrix for storing features
       


class CylinderImageProcessor:

    """
    Class used to detect colors of cylinders from stream of data containing the bgr image of the
    cylinder, the indices of the center of the cylinder and its dimensions
    """

    # Constructor
    def __init__(self, clf, num_bins):
        self._clf = clf  # learned classifier
        self._num_bins = num_bins  # number of bins to use when computing histograms
        self._colour_features_mat = np.empty((0, num_bins*3), dtype=np.int)  # Matrix for storing features

    def _crop_to_cylinder(self, img, l_u, r_d):
        """
        Crop image to extract part where cylinder is located

        Args:
            img : Array[np.int8] -- raw rgb image
            l_u : Array[np.int] -- pixel indices of the left upper corner of location to extract
            r_d : Array[np.int] -- pixel indices of the right lower corner of location to extract

        Returns:
            None
        """

        return img[l_u[0]:r_d[0]+1, l_u[1]:r_d[1]+1, :]  # Return cropped image.

    def _get_color_feature(self, cropped_img):
        """
        Compute color feature vector of cropped image

        Args:
            cropped_img: image cropped to part where cylinder is located

        Returns:
            None
        """

        # Compute channel histograms.
	cropped_img_hsv = cv.cvtColor(cropped_img, cv.COLOR_BGR2HSV)
        cropped_img_hsv[30:cropped_img_hsv.shape[0]-30, 30:cropped_img_hsv.shape[1]-30, :] = 0
        hist_b, _ = np.histogram(cropped_img_hsv[:, :, 0], bins=self._num_bins)
        hist_g, _ = np.histogram(cropped_img_hsv[:, :, 1], bins=self._num_bins)
        hist_r, _ = np.histogram(cropped_img_hsv[:, :, 2], bins=self._num_bins)
        return np.hstack((hist_r, hist_g, hist_b))  # Return computed colour feature.

    def img_to_feature(self, img, l_u, r_d):
        """
        Compute colour feature from image and add to matrix of features

        Args:
            img : Array[np.int8] -- image from which to compute the colour feature (nxmx3 matrix)
            l_u : Array[np.int8] -- coordinates of the left upper corner of the part of image on which to compute feature
            r_d : Array[np.int8] -- coordinates of the right lower corner of the part of image on which to compute feature

        Returns:
            None
        """
        cropped_img = self._crop_to_cylinder(img, l_u, r_d)
        colour_feature_nxt = self._get_color_feature(cropped_img)
        self._colour_features_mat = np.vstack((self._colour_features_mat, colour_feature_nxt))


    def get_colour_features_matrix(self):
        return self._colour_features_mat

    
    def get_cylinder_color(self):
        """
        Classify color based on colour features in colour features matrix.

        Args:
            

        Returns:
            The name of colour with most "votes"
        """

        if (self._colour_features_mat.shape[0] > 0):
            predictions = self._clf.predict(self._colour_features_mat)
            (vals, ct) = np.unique(predictions, return_counts=True)
            return vals[np.argmax(ct)]
        else:
            return -1

    def clear(self):
        self._colour_features_mat = np.empty((0, self._num_bins*3), dtype=np.int)  # Matrix for storing features
       
