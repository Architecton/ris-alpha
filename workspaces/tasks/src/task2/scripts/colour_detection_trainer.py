from colour_detection import ColourFeatureGenerator, ColourClassifier

class ColourDetectionTrainer:
    def __init__(self, num_bins):
        self._num_bins = num_bins
        self._target = -1
        self._feature_gen = ColourFeatureGenerator()
        self._learner = ColourClassifier()
        self._colour_dict = {0 : "red", 1 : "green", 2 : "blue", 3 : "black"}
        self._features_mat = np.empty((0, self._num_bins*3), dtype=np.int)
        self._target_vec = np.empty(0, dtype=np.int)

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
        rad = data.rad
        im = data.img

        # Add image and class to feature generator instance

    def _get_feature_vectors(self):
        # get feature and target matrix from generator instance and store in _features_mat and _target_vec
        pass

    def get_classifier(self):
        # Train classifier using data in _features_mat and _target_vec

        # Return trained classifier
        pass

    def subscribe(self):
        # subscribe to topic
        pass

    def unsubscribe(self):
        # unscubscribe from topic
        pass


# IDEA

# Count down to start of training data collection for each class

# After collecting training data for a certain number of time, countdown to next class

# flow: unsubscribe, set new target, countdown, subscribe
