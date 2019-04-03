#!/usr/bin/env python

import rospy
import cv2
import numpy as np
import scipy as sp
import tf2_geometry_msgs
import tf2_ros
import time
from skimage import color, restoration
from skimage import img_as_ubyte
from scipy.signal import convolve2d as conv2
from sensor_msgs.msg import Image
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import PointStamped, Vector3, Pose
from cv_bridge import CvBridge, CvBridgeError
from visualization_msgs.msg import Marker, MarkerArray
from std_msgs.msg import ColorRGBA
# TEMPORARY
from exercise5.msg import EllipseData

class The_Ring:
    def __init__(self):
        rospy.init_node('image_converter', anonymous=True)

        # Save latest laser scan and set flag when the image is being processed
        # self.in_process = 1: an image is being processed
        # self.in_process = 0: laser sensor readings are being updated
        self.scan_ranges = None
        self.scan_angle_min = 0.0
        self.scan_angle_max = 0.0
        self.scan_angle_increment = 0.0  
        self.in_process = 0

        # Initialize search boundaries for the ellipses and their centres
        self.upp_bnd_elps = 160 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.low_bnd_elps = 360 # ELLIPSE BOUNDARY: Offset from the top of the image
        self.upp_bnd_ctr = 85 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps
        self.low_bnd_ctr = 135 # CENTRE BOUNDARY: Offset from the the upp_bnd_elps

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # Subscribe to the RGB image topic
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)

        # Add ring publisher
        self.rings_pub = rospy.Publisher('rings', EllipseData, queue_size=1000)

        # Subsribe to depth laser
        self.laser_sub = rospy.Subscriber("/scan", LaserScan, self.scan_callback)   

    def image_callback(self,data):

        timestamp = rospy.Time.now().to_time()
        self.in_process = 1     

        try:
            img = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        # Load image
        img_original = img.copy()

        # Tranform image to grayscale
        img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        # Following line used with Weiner filtering
        # img = color.rgb2gray(img_original)

        # Apply the median filter to remove noise
        # img = cv2.medianBlur(img, 5)

        # Apply sharpening (approx 0.01s additional processing time)
        # kernel = np.array([[-1,-1,-1], [-1,9,-1], [-1,-1,-1]])
        # img = cv2.filter2D(img, -1, kernel)

        # Take only subset of image inside the lower and upper ellipse boundary
        img = img[self.upp_bnd_elps:self.low_bnd_elps, 0:len(img)]

        # COMPUTATIONALY EXPENSIVE: Wiener filtering to deblur the image; 0.3s additional computation time
        # psf = np.ones((5, 5)) / 25
        # img = conv2(img, psf, 'same')
        # img += 0.1 * img.std() * np.random.standard_normal(img.shape)
        # img, _ = restoration.unsupervised_wiener(img, psf)
        # img = img_as_ubyte(img)

        # Automatic parameter computation for canny
        sigma = 0.33
        v = np.median(img)
        lower = int(max(0, (1.0 - sigma) * v))
        upper = int(min(255, (1.0 + sigma) * v))

        # Setting thresholds using the global otsu
        # upper, _ = cv2.threshold(img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
        # lower = 0.5 * upper

        # Find edges with canny
        edges = cv2.Canny(img, lower, upper)

        # Extract contours
        img2, contours, hierarchy = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

        # DEVONLY: Draw contours
        # cv2.drawContours(img, contours, -1, (255, 0, 0), 3)

        # DEVONLY: Draw constraints for looking for ellipses
        # cv2.line(img_original, (0, self.upp_bnd_elps), (640, self.upp_bnd_elps), (100, 100, 255), 2)
        # cv2.line(img_original, (0, self.low_bnd_elps), (640, self.low_bnd_elps), (100, 100, 255), 2)

        # DEVONLY: Only accept centers that are in an even smaller constrained area
        # cv2.line(img_original, (0, self.upp_bnd_ctr + self.upp_bnd_elps), (640, self.upp_bnd_ctr + self.upp_bnd_elps), (40, 40, 255), 2)
        # cv2.line(img_original, (0, self.low_bnd_ctr + self.upp_bnd_elps), (640, self.low_bnd_ctr + self.upp_bnd_elps), (40, 40, 255), 2)

        # Fit elipses to all extracted contours
        elps = []
        for cnt in contours:
            # Threshold for size of ellipses (number of pixels in contour)
            if cnt.shape[0] >= 40:
                # Checking ellipse shape and whether the centre is within the search boundaries
                x,y,w,h = cv2.boundingRect(cnt)
                aspect_ratio = min(float(w)/h, float(h)/w)

                if(aspect_ratio > 0.9 and y+h/2 >= self.upp_bnd_ctr and y+h/2 <= self.low_bnd_ctr):
                    ellipse = cv2.fitEllipse(cnt)
                    elps.append(ellipse)
                    cv2.ellipse(img, ellipse, (0, 255, 0))

                    # DEVONLY: Draw the centre of detected ellipse
                    # cv2.line(img_original, (int(x + w/2), int(self.upp_bnd_elps + y + h/2)), (int(x + w/2), int(self.upp_bnd_elps + y + h/2)), (0, 0, 255), 10)


        # Find two elipses with same centers
        candidates = []
        for n in range(len(elps)):
            for m in range(n + 1, len(elps)):
                e1 = elps[n]
                e2 = elps[m]
                dist = np.sqrt(((e1[0][0] - e2[0][0]) ** 2 + (e1[0][1] - e2[0][1]) ** 2))

                # Check if we detected this candidate already and the ratio between the ellipses should correspond to a ring
                is_unique = False

                # if dist < 5:
                #     for can in candidates:
                #         dist2 = np.sqrt(((e1[0][0] - can[0][0][0]) ** 2 + (e1[0][1] - can[0][0][1]) ** 2))
                #         
                #         if(dist2 > 10):
                #             is_unique = True
                # 
                #     if ((is_unique or len(candidates) == 0) and (1.2 < max(e1[1][0]/e2[1][0], e2[1][0]/e1[1][0]) < 1.5)):
                #         candidates.append((e1,e2))   

                if dist < 5:
                    candidates.append((e1, e2))                                   

        # Build an array of detected Rings
        ed = EllipseData()
        ed.found = 0

        for c in candidates:

            # candidate structure: Box2D
            # ((center_x, center_y), (width, height), angle)

            e1 = c[0]
            e2 = c[1]

            # DEVONLY: Draw the detections
            cv2.ellipse(img_original[self.upp_bnd_elps:self.low_bnd_elps, 0:len(img_original)], e1, (0, 255, 0), 2)
            cv2.ellipse(img_original[self.upp_bnd_elps:self.low_bnd_elps, 0:len(img_original)], e2, (0, 255, 0), 2)

            center = (e1[0][0], e1[0][1] + self.upp_bnd_elps)

            # DEVONLY: Drawing center
            # cv2.line(img_original, (int(center[0]), int(center[1])), (int(center[0]), int(center[1])), (0, 0, 255), 10)

            # Add a detected ring to the array
            if (self.scan_ranges != None):
                x = int(round(center[0]))
                agl = self.scan_angle_min + center[0] * self.scan_angle_increment
                dpt = self.scan_ranges[x]
                if not(np.isnan(dpt)):
                    # Calculate angle that is perpendicular to the detected ellipse face
                    min_bnd = max(x-30, 0)
                    max_bnd = min(x+30, len(self.scan_ranges))
                    dpts_arg = np.array(self.scan_ranges[min_bnd:max_bnd])
                    agls_arg = np.linspace(
                        max(self.scan_angle_min + min_bnd * self.scan_angle_increment, self.scan_angle_min),
                        min(self.scan_angle_min + max_bnd * self.scan_angle_increment, self.scan_angle_max),
                        max_bnd-min_bnd,
                        endpoint=False)
                    filt = np.isnan(dpts_arg)
                    perp_agl, perp_y_itrcpt = self.get_ell_face_agl(dpts_arg[~filt], agls_arg[~filt])

                    # Set values
                    ed.dpt.append(dpt)
                    ed.agl.append(agl)
                    ed.timestamp.append(timestamp)
                    ed.perp_agl.append(perp_agl)
                    ed.perp_y_itrcpt.append(perp_y_itrcpt)
                    ed.found = 1
  
        if (ed.found == 1):
            self.rings_pub.publish(ed)

        self.in_process = 0

        # DEVONLY: Calculation time estimation per image 
        # endTime = rospy.Time.now().to_time()
        # print(endTime - timestamp)

        # DEVONLY: Visualize camera output
        cv2.imshow('Live feed', img_original)
        cv2.waitKey(1)

    def scan_callback(self, data):
        if(self.in_process == 0):
            self.scan_ranges = data.ranges
            self.scan_angle_min = data.angle_min
            self.scan_angle_max = data.angle_max
            self.scan_angle_increment = data.angle_increment

    def get_ell_face_agl(self, dpts, agls):
        """
        Get angle that is perpendicular to the face of the ellipse

        Args:
            dpts : Array[np.float64] -- depths measurements around ellipse center
            agls : Array[np.float64] -- angles corresponding to the depth measurements

        Returns:
            np.float64 -- angle that is perpendicular to the ellipse face
            np.float64 -- y intercept of the line that is perpendicular to the ellipse face
        """

        # Get x and y values of depth points.
        x_vals = np.cos(agls)*dpts
        y_vals = np.sin(agls)*dpts

        # interpolate line using least squares.
        k, m = np.linalg.lstsq(np.vstack((x_vals, np.ones(x_vals.shape[0]))).T, y_vals, rcond=-1)[0]

        # Return angle of perpendicular line.
        return np.arctan(k), m    


def main():

    ring_finder = The_Ring()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()