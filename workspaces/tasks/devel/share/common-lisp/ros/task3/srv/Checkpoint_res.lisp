; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude Checkpoint_res-request.msg.html

(cl:defclass <Checkpoint_res-request> (roslisp-msg-protocol:ros-message)
  ((num_of_checkpoints
    :reader num_of_checkpoints
    :initarg :num_of_checkpoints
    :type cl:integer
    :initform 0))
)

(cl:defclass Checkpoint_res-request (<Checkpoint_res-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checkpoint_res-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checkpoint_res-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<Checkpoint_res-request> is deprecated: use task3-srv:Checkpoint_res-request instead.")))

(cl:ensure-generic-function 'num_of_checkpoints-val :lambda-list '(m))
(cl:defmethod num_of_checkpoints-val ((m <Checkpoint_res-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:num_of_checkpoints-val is deprecated.  Use task3-srv:num_of_checkpoints instead.")
  (num_of_checkpoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Checkpoint_res-request>) ostream)
  "Serializes a message object of type '<Checkpoint_res-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_of_checkpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num_of_checkpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num_of_checkpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num_of_checkpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'num_of_checkpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'num_of_checkpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'num_of_checkpoints)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'num_of_checkpoints)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Checkpoint_res-request>) istream)
  "Deserializes a message object of type '<Checkpoint_res-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'num_of_checkpoints)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Checkpoint_res-request>)))
  "Returns string type for a service object of type '<Checkpoint_res-request>"
  "task3/Checkpoint_resRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoint_res-request)))
  "Returns string type for a service object of type 'Checkpoint_res-request"
  "task3/Checkpoint_resRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checkpoint_res-request>)))
  "Returns md5sum for a message object of type '<Checkpoint_res-request>"
  "164415de33c55ff5b8477a9721394803")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checkpoint_res-request)))
  "Returns md5sum for a message object of type 'Checkpoint_res-request"
  "164415de33c55ff5b8477a9721394803")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checkpoint_res-request>)))
  "Returns full string definition for message of type '<Checkpoint_res-request>"
  (cl:format cl:nil "uint64 num_of_checkpoints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checkpoint_res-request)))
  "Returns full string definition for message of type 'Checkpoint_res-request"
  (cl:format cl:nil "uint64 num_of_checkpoints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Checkpoint_res-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Checkpoint_res-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Checkpoint_res-request
    (cl:cons ':num_of_checkpoints (num_of_checkpoints msg))
))
;//! \htmlinclude Checkpoint_res-response.msg.html

(cl:defclass <Checkpoint_res-response> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type task3-msg:Checkpoints
    :initform (cl:make-instance 'task3-msg:Checkpoints)))
)

(cl:defclass Checkpoint_res-response (<Checkpoint_res-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checkpoint_res-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checkpoint_res-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<Checkpoint_res-response> is deprecated: use task3-srv:Checkpoint_res-response instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Checkpoint_res-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:points-val is deprecated.  Use task3-srv:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Checkpoint_res-response>) ostream)
  "Serializes a message object of type '<Checkpoint_res-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'points) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Checkpoint_res-response>) istream)
  "Deserializes a message object of type '<Checkpoint_res-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'points) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Checkpoint_res-response>)))
  "Returns string type for a service object of type '<Checkpoint_res-response>"
  "task3/Checkpoint_resResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoint_res-response)))
  "Returns string type for a service object of type 'Checkpoint_res-response"
  "task3/Checkpoint_resResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checkpoint_res-response>)))
  "Returns md5sum for a message object of type '<Checkpoint_res-response>"
  "164415de33c55ff5b8477a9721394803")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checkpoint_res-response)))
  "Returns md5sum for a message object of type 'Checkpoint_res-response"
  "164415de33c55ff5b8477a9721394803")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checkpoint_res-response>)))
  "Returns full string definition for message of type '<Checkpoint_res-response>"
  (cl:format cl:nil "Checkpoints points~%~%================================================================================~%MSG: task3/Checkpoints~%geometry_msgs/Point[] points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checkpoint_res-response)))
  "Returns full string definition for message of type 'Checkpoint_res-response"
  (cl:format cl:nil "Checkpoints points~%~%================================================================================~%MSG: task3/Checkpoints~%geometry_msgs/Point[] points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Checkpoint_res-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'points))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Checkpoint_res-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Checkpoint_res-response
    (cl:cons ':points (points msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Checkpoint_res)))
  'Checkpoint_res-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Checkpoint_res)))
  'Checkpoint_res-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoint_res)))
  "Returns string type for a service object of type '<Checkpoint_res>"
  "task3/Checkpoint_res")