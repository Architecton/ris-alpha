#!/usr/bin/env python

import rospy
import cv2
import numpy as np

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from task2.msg import ApproachImageFeedback

class Toroid:
    def __init__(self):
        rospy.init_node('toroid_detector2', anonymous=True)

        self.bridge = CvBridge()

        # Subscribe to the depth image topic
        self.depth_sub = rospy.Subscriber("camera/depth/image_raw", Image, self.depth_callback)

        # Add toroid publisher
        self.toroid_pub = rospy.Publisher('toroids', ApproachImageFeedback, queue_size=1000) 

        # TODO: Initialize search boundaries for the ellipses and their centres
        self.upp_bnd_elps = 0 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.low_bnd_elps = 180 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.upp_bnd_ctr = 0 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps
        self.low_bnd_ctr = 180 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps

        self.MAX_DPT = 1500.0
        self.MIN_DPT = 600.0

    def depth_callback(self, data):

        try:
            depth_img_original = self.bridge.imgmsg_to_cv2(data)
        except CvBridgeError as e:
            print(e)

        depth_img = depth_img_original

        # Set all depths greater than MAX_DPT and smaller than MIN_DPT to 0
        mask = np.logical_and(depth_img < 1500.0, depth_img > 600.0)
        depth_img = depth_img * mask

        # Normalize to 0..255
        depth_img *= 255.0/depth_img.max()
        depth_img = np.uint8(depth_img)

        # Apply gaussian blur
        depth_img = cv2.GaussianBlur(depth_img, (11, 11), 0)    

        # Setting thresholds using the global otsu
        upper, _ = cv2.threshold(depth_img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
        lower = 0.5 * upper

        # Canny detection
        edges = cv2.Canny(depth_img, lower, upper)

        _, contours, _ = cv2.findContours(depth_img, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        # Fit elipses to all extracted contours
        elps = []
        for cnt in contours:
            # Threshold for size of ellipses (number of pixels in contour)
            if cnt.shape[0] >= 15:
                # Checking whether the ellipse centre is within the search boundaries
                x,y,w,h = cv2.boundingRect(cnt)

                if(y+h/2 >= self.upp_bnd_ctr and y+h/2 <= self.low_bnd_ctr):
                    ellipse = cv2.fitEllipse(cnt)
                    elps.append(ellipse)

        # Find two elipses with same centers
        candidates = []
        for n in range(len(elps)):
            for m in range(n + 1, len(elps)):
                e1 = elps[n]
                e2 = elps[m]
                dist = np.sqrt(((e1[0][0] - e2[0][0]) ** 2 + (e1[0][1] - e2[0][1]) ** 2))

                # Check if we detected this candidate already and the ratio between the ellipses should correspond to a ring
                is_unique = True

                if dist < 5:
                    for can in candidates:
                        dist2 = np.sqrt(((e1[0][0] - can[0][0][0]) ** 2 + (e1[0][1] - can[0][0][1]) ** 2))
                        
                        if(dist2 < 10):
                            is_unique = False
                
                    if ((is_unique or len(candidates) == 0) and (1.1 < max(e1[1][0]/e2[1][0], e2[1][0]/e1[1][0]) < 2.3)):
                        candidates.append((e1,e2))   

        # Build an array of detected Rings
        aif = ApproachImageFeedback()
        found = 0

        for c in candidates:

            e1 = c[0]
            e2 = c[1]

            if (e1[1][0] > e2[1][0] and e1[1][1] > e2[1][1]):
                outer_elp = e1
            else:
                outer_elp = e2     

            # Save values in a friendlier format
            x = np.uint16(round(outer_elp[0][0]))
            y = np.uint16(round(outer_elp[0][1]))
            w = np.uint16(round(outer_elp[1][0]))
            h = np.uint16(round(outer_elp[1][1]))
            
            # DEVONLY: Visualize the ellipses
            cv2.ellipse(depth_img[self.upp_bnd_elps:self.low_bnd_elps], e1, (255, 255, 255), 2)
            cv2.ellipse(depth_img[self.upp_bnd_elps:self.low_bnd_elps], e2, (255, 255, 255), 2)

            # Set fields
            aif.timestamp = data.header.stamp
            aif.center_x = int(np.round(outer_elp[0][0]))
            aif.center_y = int(np.round(outer_elp[0][1]))
            aif.minor_axis = w
            aif.major_axis = h
            
            # Signalize that a toroid has been found
            found = 1

        if (found == 1):
            self.toroid_pub.publish(aif)

        # DEVONLY: Visualize camera output
        cv2.imshow('Output', depth_img)
        cv2.waitKey(0)    

"""
def test():

    depth_img_original = np.loadtxt('ime_fajla.txt')
    depth_img = depth_img_original

    # Set all depths greater than MAX_DPT and smaller than MIN_DPT to 0
    mask = np.logical_and(depth_img < 1500.0, depth_img > 600.0)
    depth_img = depth_img * mask

    # Normalize to 0..255
    depth_img *= 255.0/depth_img.max()
    depth_img = np.uint8(depth_img)

    # Apply gaussian blur
    depth_img = cv2.GaussianBlur(depth_img, (11, 11), 0)    

    # Automatic parameter computation for canny
    #sigma = 0.33
    #v = np.median(depth_img)
    #lower = int(max(0, (1.0 - sigma) * v))
    #upper = int(min(255, (1.0 + sigma) * v))

    # Setting thresholds using the global otsu
    upper, _ = cv2.threshold(depth_img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
    lower = 0.5 * upper

    # Canny detection
    edges = cv2.Canny(depth_img, lower, upper)

    _, contours, _ = cv2.findContours(depth_img, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

    # Fit elipses to all extracted contours
    elps = []
    for cnt in contours:
        # Threshold for size of ellipses (number of pixels in contour)
        if cnt.shape[0] >= 15:
            # Checking whether the ellipse centre is within the search boundaries
            x,y,w,h = cv2.boundingRect(cnt)

            if(y+h/2 >= 0 and y+h/2 <= 480):
                ellipse = cv2.fitEllipse(cnt)
                elps.append(ellipse)

    # Find two elipses with same centers
    candidates = []
    for n in range(len(elps)):
        for m in range(n + 1, len(elps)):
            e1 = elps[n]
            e2 = elps[m]
            dist = np.sqrt(((e1[0][0] - e2[0][0]) ** 2 + (e1[0][1] - e2[0][1]) ** 2))

            # Check if we detected this candidate already and the ratio between the ellipses should correspond to a ring
            is_unique = True

            if dist < 5:
                for can in candidates:
                    dist2 = np.sqrt(((e1[0][0] - can[0][0][0]) ** 2 + (e1[0][1] - can[0][0][1]) ** 2))
                    
                    if(dist2 < 10):
                        is_unique = False
            
                if ((is_unique or len(candidates) == 0) and (1.1 < max(e1[1][0]/e2[1][0], e2[1][0]/e1[1][0]) < 2.3)):
                    candidates.append((e1,e2))   

    for c in candidates:
        e1 = c[0]
        e2 = c[1]

        #depth_img.fill(1)
        cv2.ellipse(depth_img, e1, (255, 255, 255), 2)
        cv2.ellipse(depth_img, e2, (255, 255, 255), 2)
        print "x: {0}\ny: {1}".format(e1[0][0], e1[0][1])

    # Display
    cv2.imshow('Output', depth_img)
    cv2.waitKey(0)
"""    

def main():

    toroid_finder = Toroid()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()    

if __name__ == '__main__':
    main()
    #test()