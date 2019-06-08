#!/usr/bin/env python

import numpy as np
from sklearn.ensemble import RandomForestClassifier
import requests as request

class UrlDataClassifier:

    """
    Create a classifier from data on specified url and provide a transform method
    for classifying examples.
    """
   
    # Constructor
    def __init__(self, learner=RandomForestClassifier, **kwargs):
        # self._clf = learner(**kwargs)
        self._clf = RandomForestClassifier(n_estimators=100, max_depth=2, random_state=0)

    # Fit: use learner to produce classifier.
    def fit(self, data_url):
        data_raw = request.get(data_url).text.splitlines()[1:]
	data_processed = np.array([np.fromstring(el, sep=",") for el in data_raw])
	data = data_processed[:, :-1]
        target = data_processed[:, -1]
        self._clf = self._clf.fit(data, target)
        return self  # Return reference to self (to allow .fit(url).predict(example) calls)
   
    # predict: predict class of example using learned classifier.
    def predict(self, example):
        return self._clf.predict(example)


