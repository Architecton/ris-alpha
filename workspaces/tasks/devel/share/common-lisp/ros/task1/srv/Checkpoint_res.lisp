; Auto-generated. Do not edit!


(cl:in-package task1-srv)


;//! \htmlinclude Checkpoint_res-request.msg.html

(cl:defclass <Checkpoint_res-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Checkpoint_res-request (<Checkpoint_res-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checkpoint_res-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checkpoint_res-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1-srv:<Checkpoint_res-request> is deprecated: use task1-srv:Checkpoint_res-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Checkpoint_res-request>) ostream)
  "Serializes a message object of type '<Checkpoint_res-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Checkpoint_res-request>) istream)
  "Deserializes a message object of type '<Checkpoint_res-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Checkpoint_res-request>)))
  "Returns string type for a service object of type '<Checkpoint_res-request>"
  "task1/Checkpoint_resRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoint_res-request)))
  "Returns string type for a service object of type 'Checkpoint_res-request"
  "task1/Checkpoint_resRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checkpoint_res-request>)))
  "Returns md5sum for a message object of type '<Checkpoint_res-request>"
  "f7b43fb4c3dc044f1ecb1f843f952947")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checkpoint_res-request)))
  "Returns md5sum for a message object of type 'Checkpoint_res-request"
  "f7b43fb4c3dc044f1ecb1f843f952947")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checkpoint_res-request>)))
  "Returns full string definition for message of type '<Checkpoint_res-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checkpoint_res-request)))
  "Returns full string definition for message of type 'Checkpoint_res-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Checkpoint_res-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Checkpoint_res-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Checkpoint_res-request
))
;//! \htmlinclude Checkpoint_res-response.msg.html

(cl:defclass <Checkpoint_res-response> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type task1-msg:Checkpoints
    :initform (cl:make-instance 'task1-msg:Checkpoints)))
)

(cl:defclass Checkpoint_res-response (<Checkpoint_res-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checkpoint_res-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checkpoint_res-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1-srv:<Checkpoint_res-response> is deprecated: use task1-srv:Checkpoint_res-response instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Checkpoint_res-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task1-srv:points-val is deprecated.  Use task1-srv:points instead.")
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
  "task1/Checkpoint_resResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checkpoint_res-response)))
  "Returns string type for a service object of type 'Checkpoint_res-response"
  "task1/Checkpoint_resResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checkpoint_res-response>)))
  "Returns md5sum for a message object of type '<Checkpoint_res-response>"
  "f7b43fb4c3dc044f1ecb1f843f952947")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checkpoint_res-response)))
  "Returns md5sum for a message object of type 'Checkpoint_res-response"
  "f7b43fb4c3dc044f1ecb1f843f952947")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checkpoint_res-response>)))
  "Returns full string definition for message of type '<Checkpoint_res-response>"
  (cl:format cl:nil "Checkpoints points~%~%================================================================================~%MSG: task1/Checkpoints~%geometry_msgs/Point[] points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checkpoint_res-response)))
  "Returns full string definition for message of type 'Checkpoint_res-response"
  (cl:format cl:nil "Checkpoints points~%~%================================================================================~%MSG: task1/Checkpoints~%geometry_msgs/Point[] points~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
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
  "task1/Checkpoint_res")