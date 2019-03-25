; Auto-generated. Do not edit!


(cl:in-package exercise4-srv)


;//! \htmlinclude ForwardRange-request.msg.html

(cl:defclass <ForwardRange-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ForwardRange-request (<ForwardRange-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ForwardRange-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ForwardRange-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name exercise4-srv:<ForwardRange-request> is deprecated: use exercise4-srv:ForwardRange-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ForwardRange-request>) ostream)
  "Serializes a message object of type '<ForwardRange-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ForwardRange-request>) istream)
  "Deserializes a message object of type '<ForwardRange-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ForwardRange-request>)))
  "Returns string type for a service object of type '<ForwardRange-request>"
  "exercise4/ForwardRangeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ForwardRange-request)))
  "Returns string type for a service object of type 'ForwardRange-request"
  "exercise4/ForwardRangeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ForwardRange-request>)))
  "Returns md5sum for a message object of type '<ForwardRange-request>"
  "6e77fb10f0c8b4833ec273aa9ac74459")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ForwardRange-request)))
  "Returns md5sum for a message object of type 'ForwardRange-request"
  "6e77fb10f0c8b4833ec273aa9ac74459")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ForwardRange-request>)))
  "Returns full string definition for message of type '<ForwardRange-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ForwardRange-request)))
  "Returns full string definition for message of type 'ForwardRange-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ForwardRange-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ForwardRange-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ForwardRange-request
))
;//! \htmlinclude ForwardRange-response.msg.html

(cl:defclass <ForwardRange-response> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass ForwardRange-response (<ForwardRange-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ForwardRange-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ForwardRange-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name exercise4-srv:<ForwardRange-response> is deprecated: use exercise4-srv:ForwardRange-response instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ForwardRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise4-srv:distance-val is deprecated.  Use exercise4-srv:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ForwardRange-response>) ostream)
  "Serializes a message object of type '<ForwardRange-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ForwardRange-response>) istream)
  "Deserializes a message object of type '<ForwardRange-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ForwardRange-response>)))
  "Returns string type for a service object of type '<ForwardRange-response>"
  "exercise4/ForwardRangeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ForwardRange-response)))
  "Returns string type for a service object of type 'ForwardRange-response"
  "exercise4/ForwardRangeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ForwardRange-response>)))
  "Returns md5sum for a message object of type '<ForwardRange-response>"
  "6e77fb10f0c8b4833ec273aa9ac74459")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ForwardRange-response)))
  "Returns md5sum for a message object of type 'ForwardRange-response"
  "6e77fb10f0c8b4833ec273aa9ac74459")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ForwardRange-response>)))
  "Returns full string definition for message of type '<ForwardRange-response>"
  (cl:format cl:nil "float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ForwardRange-response)))
  "Returns full string definition for message of type 'ForwardRange-response"
  (cl:format cl:nil "float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ForwardRange-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ForwardRange-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ForwardRange-response
    (cl:cons ':distance (distance msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ForwardRange)))
  'ForwardRange-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ForwardRange)))
  'ForwardRange-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ForwardRange)))
  "Returns string type for a service object of type '<ForwardRange>"
  "exercise4/ForwardRange")