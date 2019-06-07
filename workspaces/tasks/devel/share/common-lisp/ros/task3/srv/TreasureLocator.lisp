; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude TreasureLocator-request.msg.html

(cl:defclass <TreasureLocator-request> (roslisp-msg-protocol:ros-message)
  ((img
    :reader img
    :initarg :img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass TreasureLocator-request (<TreasureLocator-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TreasureLocator-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TreasureLocator-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<TreasureLocator-request> is deprecated: use task3-srv:TreasureLocator-request instead.")))

(cl:ensure-generic-function 'img-val :lambda-list '(m))
(cl:defmethod img-val ((m <TreasureLocator-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:img-val is deprecated.  Use task3-srv:img instead.")
  (img m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TreasureLocator-request>) ostream)
  "Serializes a message object of type '<TreasureLocator-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TreasureLocator-request>) istream)
  "Deserializes a message object of type '<TreasureLocator-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TreasureLocator-request>)))
  "Returns string type for a service object of type '<TreasureLocator-request>"
  "task3/TreasureLocatorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TreasureLocator-request)))
  "Returns string type for a service object of type 'TreasureLocator-request"
  "task3/TreasureLocatorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TreasureLocator-request>)))
  "Returns md5sum for a message object of type '<TreasureLocator-request>"
  "f8ab16647b43984ab945118af6794cb3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TreasureLocator-request)))
  "Returns md5sum for a message object of type 'TreasureLocator-request"
  "f8ab16647b43984ab945118af6794cb3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TreasureLocator-request>)))
  "Returns full string definition for message of type '<TreasureLocator-request>"
  (cl:format cl:nil "sensor_msgs/Image img~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TreasureLocator-request)))
  "Returns full string definition for message of type 'TreasureLocator-request"
  (cl:format cl:nil "sensor_msgs/Image img~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TreasureLocator-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TreasureLocator-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TreasureLocator-request
    (cl:cons ':img (img msg))
))
;//! \htmlinclude TreasureLocator-response.msg.html

(cl:defclass <TreasureLocator-response> (roslisp-msg-protocol:ros-message)
  ((treasure_x
    :reader treasure_x
    :initarg :treasure_x
    :type cl:float
    :initform 0.0)
   (treasure_y
    :reader treasure_y
    :initarg :treasure_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass TreasureLocator-response (<TreasureLocator-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TreasureLocator-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TreasureLocator-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<TreasureLocator-response> is deprecated: use task3-srv:TreasureLocator-response instead.")))

(cl:ensure-generic-function 'treasure_x-val :lambda-list '(m))
(cl:defmethod treasure_x-val ((m <TreasureLocator-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:treasure_x-val is deprecated.  Use task3-srv:treasure_x instead.")
  (treasure_x m))

(cl:ensure-generic-function 'treasure_y-val :lambda-list '(m))
(cl:defmethod treasure_y-val ((m <TreasureLocator-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:treasure_y-val is deprecated.  Use task3-srv:treasure_y instead.")
  (treasure_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TreasureLocator-response>) ostream)
  "Serializes a message object of type '<TreasureLocator-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'treasure_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'treasure_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TreasureLocator-response>) istream)
  "Deserializes a message object of type '<TreasureLocator-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'treasure_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'treasure_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TreasureLocator-response>)))
  "Returns string type for a service object of type '<TreasureLocator-response>"
  "task3/TreasureLocatorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TreasureLocator-response)))
  "Returns string type for a service object of type 'TreasureLocator-response"
  "task3/TreasureLocatorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TreasureLocator-response>)))
  "Returns md5sum for a message object of type '<TreasureLocator-response>"
  "f8ab16647b43984ab945118af6794cb3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TreasureLocator-response)))
  "Returns md5sum for a message object of type 'TreasureLocator-response"
  "f8ab16647b43984ab945118af6794cb3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TreasureLocator-response>)))
  "Returns full string definition for message of type '<TreasureLocator-response>"
  (cl:format cl:nil "float64 treasure_x~%float64 treasure_y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TreasureLocator-response)))
  "Returns full string definition for message of type 'TreasureLocator-response"
  (cl:format cl:nil "float64 treasure_x~%float64 treasure_y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TreasureLocator-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TreasureLocator-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TreasureLocator-response
    (cl:cons ':treasure_x (treasure_x msg))
    (cl:cons ':treasure_y (treasure_y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TreasureLocator)))
  'TreasureLocator-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TreasureLocator)))
  'TreasureLocator-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TreasureLocator)))
  "Returns string type for a service object of type '<TreasureLocator>"
  "task3/TreasureLocator")