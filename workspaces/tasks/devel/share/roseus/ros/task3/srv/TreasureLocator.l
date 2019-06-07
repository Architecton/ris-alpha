;; Auto-generated. Do not edit!


(when (boundp 'task3::TreasureLocator)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'TreasureLocator (find-package "TASK3")))
(unless (find-package "TASK3::TREASURELOCATOR")
  (make-package "TASK3::TREASURELOCATOR"))
(unless (find-package "TASK3::TREASURELOCATORREQUEST")
  (make-package "TASK3::TREASURELOCATORREQUEST"))
(unless (find-package "TASK3::TREASURELOCATORRESPONSE")
  (make-package "TASK3::TREASURELOCATORRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass task3::TreasureLocatorRequest
  :super ros::object
  :slots (_img ))

(defmethod task3::TreasureLocatorRequest
  (:init
   (&key
    ((:img __img) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _img __img)
   self)
  (:img
   (&rest __img)
   (if (keywordp (car __img))
       (send* _img __img)
     (progn
       (if __img (setq _img (car __img)))
       _img)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _img
    (send _img :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _img
       (send _img :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _img
     (send _img :deserialize buf ptr-) (incf ptr- (send _img :serialization-length))
   ;;
   self)
  )

(defclass task3::TreasureLocatorResponse
  :super ros::object
  :slots (_treasure_x _treasure_y ))

(defmethod task3::TreasureLocatorResponse
  (:init
   (&key
    ((:treasure_x __treasure_x) 0.0)
    ((:treasure_y __treasure_y) 0.0)
    )
   (send-super :init)
   (setq _treasure_x (float __treasure_x))
   (setq _treasure_y (float __treasure_y))
   self)
  (:treasure_x
   (&optional __treasure_x)
   (if __treasure_x (setq _treasure_x __treasure_x)) _treasure_x)
  (:treasure_y
   (&optional __treasure_y)
   (if __treasure_y (setq _treasure_y __treasure_y)) _treasure_y)
  (:serialization-length
   ()
   (+
    ;; float64 _treasure_x
    8
    ;; float64 _treasure_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _treasure_x
       (sys::poke _treasure_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _treasure_y
       (sys::poke _treasure_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _treasure_x
     (setq _treasure_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _treasure_y
     (setq _treasure_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass task3::TreasureLocator
  :super ros::object
  :slots ())

(setf (get task3::TreasureLocator :md5sum-) "f8ab16647b43984ab945118af6794cb3")
(setf (get task3::TreasureLocator :datatype-) "task3/TreasureLocator")
(setf (get task3::TreasureLocator :request) task3::TreasureLocatorRequest)
(setf (get task3::TreasureLocator :response) task3::TreasureLocatorResponse)

(defmethod task3::TreasureLocatorRequest
  (:response () (instance task3::TreasureLocatorResponse :init)))

(setf (get task3::TreasureLocatorRequest :md5sum-) "f8ab16647b43984ab945118af6794cb3")
(setf (get task3::TreasureLocatorRequest :datatype-) "task3/TreasureLocatorRequest")
(setf (get task3::TreasureLocatorRequest :definition-)
      "sensor_msgs/Image img

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
float64 treasure_x
float64 treasure_y

")

(setf (get task3::TreasureLocatorResponse :md5sum-) "f8ab16647b43984ab945118af6794cb3")
(setf (get task3::TreasureLocatorResponse :datatype-) "task3/TreasureLocatorResponse")
(setf (get task3::TreasureLocatorResponse :definition-)
      "sensor_msgs/Image img

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
float64 treasure_x
float64 treasure_y

")



(provide :task3/TreasureLocator "f8ab16647b43984ab945118af6794cb3")


