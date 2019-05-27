#!/usr/bin/env python

import numpy as np

class URLDataClassifier:

    """
    Create a classifier from data on specified url and provide a transform method
    for classifying examples.
    """
   
    # Constructor
    def __init__(learner, **kwargs):
        self._learner = learner(**kwargs)

    # Fit: use learner to produce classifier.
    def fit(data_url):
        data = np.fromstring(requests.get(data_url).text)
        self._classifier = self._learner.fit(data)
        return self  # Return reference to self (to allow .fit(url).predict(example) calls)
   
    # predict: predict class of example using learned classifier.
    def predict(example):
        return self._classifier.transform(example)



## TEST ###

if __name__ === '__main__':
    from sklearn.neural_network import MLPClassifier

    data_url = 'http://localhost:3000'      # Url from which to load the training data.
    to_predict = np.array([2, 3])           # Example to classify.
    clf = URLDataClassifier(MLPClassifier)  # Initialize classifier.
    clf.fit(data_url)                       # Fit to training data.
    print clf.predict(to_predict)           # Classify example.
