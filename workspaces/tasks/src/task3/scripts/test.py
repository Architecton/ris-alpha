#!/usr/bin/env python
import roslib
import rospy

from joblib import load

if __name__ == '__main__':
    clf1 = load('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task3/scripts/color_classification/cylinder_colour_classifier.joblib')
    clf2 = load('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task3/scripts/color_classification/ellipse_colour_classifier.joblib')
    clf3 = load('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task3/scripts/color_classification/ring_colour_classifier.joblib')

