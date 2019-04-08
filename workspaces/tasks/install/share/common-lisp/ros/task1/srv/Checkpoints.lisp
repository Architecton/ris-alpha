; Auto-generated. Do not edit!


(cl:in-package task1-srv)


;//! \htmlinclude Checkpoints-request.msg.html

(cl:defclass <Checkpoints-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Checkpoints-request (<Checkpoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checkpoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checkpoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1-srv:<Checkpoints-request> is deprecated: use task1-srv:Checkpoints-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Checkpoints-request>) ostream)
  "Serializes a message object of type '<Checkpoints-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Checkpoints-request>) istream)
  "Deserializes a message object of type '<Checkpoints-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Checkpoints-request>)))
  "Returns string type for a service object of type '<Checkpoints-request>"
  "task1/CheckpointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoints-request)))
  "Returns string type for a service object of type 'Checkpoints-request"
  "task1/CheckpointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checkpoints-request>)))
  "Returns md5sum for a message object of type '<Checkpoints-request>"
  "3fb3f9dacc279b964c4c8341122c34df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checkpoints-request)))
  "Returns md5sum for a message object of type 'Checkpoints-request"
  "3fb3f9dacc279b964c4c8341122c34df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checkpoints-request>)))
  "Returns full string definition for message of type '<Checkpoints-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checkpoints-request)))
  "Returns full string definition for message of type 'Checkpoints-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Checkpoints-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Checkpoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Checkpoints-request
))
;//! \htmlinclude Checkpoints-response.msg.html

(cl:defclass <Checkpoints-response> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass Checkpoints-response (<Checkpoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checkpoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checkpoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1-srv:<Checkpoints-response> is deprecated: use task1-srv:Checkpoints-response instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Checkpoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task1-srv:points-val is deprecated.  Use task1-srv:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Checkpoints-response>) ostream)
  "Serializes a message object of type '<Checkpoints-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Checkpoints-response>) istream)
  "Deserializes a message object of type '<Checkpoints-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Checkpoints-response>)))
  "Returns string type for a service object of type '<Checkpoints-response>"
  "task1/CheckpointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoints-response)))
  "Returns string type for a service object of type 'Checkpoints-response"
  "task1/CheckpointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checkpoints-response>)))
  "Returns md5sum for a message object of type '<Checkpoints-response>"
  "3fb3f9dacc279b964c4c8341122c34df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checkpoints-response)))
  "Returns md5sum for a message object of type 'Checkpoints-response"
  "3fb3f9dacc279b964c4c8341122c34df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checkpoints-response>)))
  "Returns full string definition for message of type '<Checkpoints-response>"
  (cl:format cl:nil "geometry_msgs/Point[] points~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checkpoints-response)))
  "Returns full string definition for message of type 'Checkpoints-response"
  (cl:format cl:nil "geometry_msgs/Point[] points~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Checkpoints-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Checkpoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Checkpoints-response
    (cl:cons ':points (points msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Checkpoints)))
  'Checkpoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Checkpoints)))
  'Checkpoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoints)))
  "Returns string type for a service object of type '<Checkpoints>"
  "task1/Checkpoints")