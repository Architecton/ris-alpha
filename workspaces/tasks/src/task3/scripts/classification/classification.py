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

    def _get_color_dict(self, raw_string):
        raw_list = raw_string.split(' ')
        class1 = raw_list[0][-1]
        class2 = raw_list[3][-1]
        class3 = raw_list[6][-1]
        class4 = raw_list[10][-1]
        name1 = raw_list[2][:-1]
        name2 = raw_list[5][:-1]
        name3 = raw_list[8][:-1]
        name4 = raw_list[12][:-2]
        return {class1: int(name1), class2: int(name2), class3: int(name3), class4: int(name4)}


    # Fit: use learner to produce classifier.
    def fit(self, data_url):
        data_raw = request.get(data_url).text
        color_dict = self._get_color_dict(data_raw.splitlines()[0])
        data_raw_headless = data_raw.splitlines()[1:]
	data_processed = np.array([np.fromstring(el, sep=",") for el in data_raw_headless])
	data = data_processed[:, :-1]
        target = data_processed[:, -1]
        self._clf = self._clf.fit(data, target)
        return self, color_dict  # Return reference to self (to allow .fit(url).predict(example) calls)
   
    # predict: predict class of example using learned classifier.
    def predict(self, example):
        return self._clf.predict(example)


