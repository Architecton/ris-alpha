#!/usr/bin/env python

import numpy as np
from sklearn.neural_network import MLPClassifier
import requests as request

class UrlDataClassifier:

    """
    Create a classifier from data on specified url and provide a transform method
    for classifying examples.
    """
   
    # Constructor
    def __init__(self, learner=MLPClassifier, **kwargs):
        # self._clf = learner(**kwargs)
        self._clf = MLPClassifier()

    # Fit: use learner to produce classifier.
    def fit(self, data_url):
        data_raw = request.get(data_url).text.splitlines()[1:]
	data_processed = np.array([np.fromstring(el, sep=",") for el in data_raw])
        target = None # TODO
        self._clf = self._clf.fit(data, target)
        return self  # Return reference to self (to allow .fit(url).predict(example) calls)
   
    # predict: predict class of example using learned classifier.
    def predict(self, example):
        return self._clf.predict(example)


