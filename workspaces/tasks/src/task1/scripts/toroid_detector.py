#!/usr/bin/env python

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
#from task2.msg import RingData
from task2.msg import ApproachImageFeedback

class Toroid:
    def __init__(self):
        rospy.init_node('toroid_detector', anonymous=True)

        self.bridge = CvBridge()

        # Subscribe to the depth image topic
        self.depth_sub = rospy.Subscriber("camera/depth/image_raw", Image, self.depth_callback)

        # Subscribe to the RGB image topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # Add toroid publisher
        self.toroid_pub = rospy.Publisher('toroids', RingData, queue_size=1000)

        # Max depth of scanning the depth in meters
        self.MAX_DPT = 2000.0

        # TODO: Initialize search boundaries for the ellipses and their centres
        self.upp_bnd_elps = 0 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.low_bnd_elps = 480 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.upp_bnd_ctr = 0 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps
        self.low_bnd_ctr = 480 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps

        # self.bgr_img


    # def image_callback(self, data):
#
 #   	try:
  #          self.bgr_img = self.bridge.imgmsg_to_cv2(data)
   #     except CvBridgeError as e:
    #        print(e)

    def depth_callback(self, data):

    	timestamp = data.header.stamp.to_time()

    	try:
            depth_img = self.bridge.imgmsg_to_cv2(data)
        except CvBridgeError as e:
            print(e)

        # Set all depths greater than MAX_DPT to 0
		depth_img[depth_img > self.MAX_DPT] = 0.0

        # Apply the bilateral filter to remove noise and preserve edges
        depth_img = cv2.bilateralFilter(
            depth_img,
            sigmaColor=30,
            d=5,
            sigmaSpace=30
        )

        # Setting thresholds using the global otsu
        upper, _ = cv2.threshold(depth_img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
        lower = 0.5 * upper

        # Find edges with canny
        edges = cv2.Canny(
            depth_img, 
            threshold1=lower, 
            threshold2=upper,
            L2gradient=True
        )

        # Extract contours
        depth_img2, contours, hierarchy = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        # Fit elipses to all extracted contours
        elps = []
        for cnt in contours:
            # Threshold for size of ellipses (number of pixels in contour)
            if cnt.shape[0] >= 50:
                # Checking whether the ellipse centre is within the search boundaries
                x,y,w,h = cv2.boundingRect(cnt)

                if(y+h/2 >= self.upp_bnd_ctr and y+h/2 <= self.low_bnd_ctr):
                    ellipse = cv2.fitEllipse(cnt)
                    elps.append(ellipse)
                    cv2.ellipse(depth_img, ellipse, (0, 255, 0))

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
                
                    if ((is_unique or len(candidates) == 0) and (1.2 < max(e1[1][0]/e2[1][0], e2[1][0]/e1[1][0]) < 1.5)):
                        candidates.append((e1,e2))                              

        # Build an array of detected Rings
        #rd = RingData()
        rd = ApproachImageFeedback()
        found = 0

        for c in candidates:

            # candidate structure: Box2D
            # ((center_x, center_y), (width, height), angle)

            e1 = c[0]
            e2 = c[1]

            # DEVONLY: Draw the detections
            cv2.ellipse(depth_img[self.upp_bnd_elps:self.low_bnd_elps, 0:len(depth_img)], e1, (0, 255, 0), 2)
            cv2.ellipse(depth_img[self.upp_bnd_elps:self.low_bnd_elps, 0:len(depth_img)], e2, (0, 255, 0), 2)

            # center = (x, y)
            # center = (e1[0][0], e1[0][1] + self.upp_bnd_elps)

            # DEVONLY: Drawing center
            # cv2.line(depth_img, (int(e1[0][0]), int(e1[0][1])), (int(e1[0][0]), int(e1[0][1])), (0, 0, 255), 10)

            # Set toroid data
            rd.center_x = e1[0][0]
            rd.center_y = e1[0][1]
            rd.timestamp = timestamp
            # rd.minor_axis = np.min(e1[1])
            # rd.major_axis = np.max(e1[1])
            # rd.im = np.ravel(self.bgr_img)

            found = 1
  
        if (found == 1):
            self.toroid_pub.publish(ed)

        # DEVONLY: Visualize camera output
        cv2.imshow('Live feed', depth_img)
        cv2.waitKey(1)


def main():

    toroid_finder = Toroid()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
