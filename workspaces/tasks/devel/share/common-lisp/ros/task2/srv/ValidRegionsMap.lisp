; Auto-generated. Do not edit!


(cl:in-package task2-srv)


;//! \htmlinclude ValidRegionsMap-request.msg.html

(cl:defclass <ValidRegionsMap-request> (roslisp-msg-protocol:ros-message)
  ((input_x
    :reader input_x
    :initarg :input_x
    :type cl:float
    :initform 0.0)
   (input_y
    :reader input_y
    :initarg :input_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass ValidRegionsMap-request (<ValidRegionsMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ValidRegionsMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ValidRegionsMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<ValidRegionsMap-request> is deprecated: use task2-srv:ValidRegionsMap-request instead.")))

(cl:ensure-generic-function 'input_x-val :lambda-list '(m))
(cl:defmethod input_x-val ((m <ValidRegionsMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:input_x-val is deprecated.  Use task2-srv:input_x instead.")
  (input_x m))

(cl:ensure-generic-function 'input_y-val :lambda-list '(m))
(cl:defmethod input_y-val ((m <ValidRegionsMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:input_y-val is deprecated.  Use task2-srv:input_y instead.")
  (input_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ValidRegionsMap-request>) ostream)
  "Serializes a message object of type '<ValidRegionsMap-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'input_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'input_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ValidRegionsMap-request>) istream)
  "Deserializes a message object of type '<ValidRegionsMap-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'input_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'input_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ValidRegionsMap-request>)))
  "Returns string type for a service object of type '<ValidRegionsMap-request>"
  "task2/ValidRegionsMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidRegionsMap-request)))
  "Returns string type for a service object of type 'ValidRegionsMap-request"
  "task2/ValidRegionsMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ValidRegionsMap-request>)))
  "Returns md5sum for a message object of type '<ValidRegionsMap-request>"
  "ba554fc9d98703ab25e4d0b10b456967")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ValidRegionsMap-request)))
  "Returns md5sum for a message object of type 'ValidRegionsMap-request"
  "ba554fc9d98703ab25e4d0b10b456967")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ValidRegionsMap-request>)))
  "Returns full string definition for message of type '<ValidRegionsMap-request>"
  (cl:format cl:nil "float64 input_x~%float64 input_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ValidRegionsMap-request)))
  "Returns full string definition for message of type 'ValidRegionsMap-request"
  (cl:format cl:nil "float64 input_x~%float64 input_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ValidRegionsMap-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ValidRegionsMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ValidRegionsMap-request
    (cl:cons ':input_x (input_x msg))
    (cl:cons ':input_y (input_y msg))
))
;//! \htmlinclude ValidRegionsMap-response.msg.html

(cl:defclass <ValidRegionsMap-response> (roslisp-msg-protocol:ros-message)
  ((output_x
    :reader output_x
    :initarg :output_x
    :type cl:float
    :initform 0.0)
   (output_y
    :reader output_y
    :initarg :output_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass ValidRegionsMap-response (<ValidRegionsMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ValidRegionsMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ValidRegionsMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<ValidRegionsMap-response> is deprecated: use task2-srv:ValidRegionsMap-response instead.")))

(cl:ensure-generic-function 'output_x-val :lambda-list '(m))
(cl:defmethod output_x-val ((m <ValidRegionsMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:output_x-val is deprecated.  Use task2-srv:output_x instead.")
  (output_x m))

(cl:ensure-generic-function 'output_y-val :lambda-list '(m))
(cl:defmethod output_y-val ((m <ValidRegionsMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:output_y-val is deprecated.  Use task2-srv:output_y instead.")
  (output_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ValidRegionsMap-response>) ostream)
  "Serializes a message object of type '<ValidRegionsMap-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'output_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'output_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ValidRegionsMap-response>) istream)
  "Deserializes a message object of type '<ValidRegionsMap-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ValidRegionsMap-response>)))
  "Returns string type for a service object of type '<ValidRegionsMap-response>"
  "task2/ValidRegionsMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidRegionsMap-response)))
  "Returns string type for a service object of type 'ValidRegionsMap-response"
  "task2/ValidRegionsMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ValidRegionsMap-response>)))
  "Returns md5sum for a message object of type '<ValidRegionsMap-response>"
  "ba554fc9d98703ab25e4d0b10b456967")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ValidRegionsMap-response)))
  "Returns md5sum for a message object of type 'ValidRegionsMap-response"
  "ba554fc9d98703ab25e4d0b10b456967")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ValidRegionsMap-response>)))
  "Returns full string definition for message of type '<ValidRegionsMap-response>"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ValidRegionsMap-response)))
  "Returns full string definition for message of type 'ValidRegionsMap-response"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ValidRegionsMap-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ValidRegionsMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ValidRegionsMap-response
    (cl:cons ':output_x (output_x msg))
    (cl:cons ':output_y (output_y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ValidRegionsMap)))
  'ValidRegionsMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ValidRegionsMap)))
  'ValidRegionsMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidRegionsMap)))
  "Returns string type for a service object of type '<ValidRegionsMap>"
  "task2/ValidRegionsMap")