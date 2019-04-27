; Auto-generated. Do not edit!


(cl:in-package task2-srv)


;//! \htmlinclude RingApproachPoint-request.msg.html

(cl:defclass <RingApproachPoint-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass RingApproachPoint-request (<RingApproachPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RingApproachPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RingApproachPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<RingApproachPoint-request> is deprecated: use task2-srv:RingApproachPoint-request instead.")))

(cl:ensure-generic-function 'input_x-val :lambda-list '(m))
(cl:defmethod input_x-val ((m <RingApproachPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:input_x-val is deprecated.  Use task2-srv:input_x instead.")
  (input_x m))

(cl:ensure-generic-function 'input_y-val :lambda-list '(m))
(cl:defmethod input_y-val ((m <RingApproachPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:input_y-val is deprecated.  Use task2-srv:input_y instead.")
  (input_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RingApproachPoint-request>) ostream)
  "Serializes a message object of type '<RingApproachPoint-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RingApproachPoint-request>) istream)
  "Deserializes a message object of type '<RingApproachPoint-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RingApproachPoint-request>)))
  "Returns string type for a service object of type '<RingApproachPoint-request>"
  "task2/RingApproachPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RingApproachPoint-request)))
  "Returns string type for a service object of type 'RingApproachPoint-request"
  "task2/RingApproachPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RingApproachPoint-request>)))
  "Returns md5sum for a message object of type '<RingApproachPoint-request>"
  "a0a873596cba774a4f04b2ea2ebf3221")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RingApproachPoint-request)))
  "Returns md5sum for a message object of type 'RingApproachPoint-request"
  "a0a873596cba774a4f04b2ea2ebf3221")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RingApproachPoint-request>)))
  "Returns full string definition for message of type '<RingApproachPoint-request>"
  (cl:format cl:nil "float64 input_x~%float64 input_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RingApproachPoint-request)))
  "Returns full string definition for message of type 'RingApproachPoint-request"
  (cl:format cl:nil "float64 input_x~%float64 input_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RingApproachPoint-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RingApproachPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RingApproachPoint-request
    (cl:cons ':input_x (input_x msg))
    (cl:cons ':input_y (input_y msg))
))
;//! \htmlinclude RingApproachPoint-response.msg.html

(cl:defclass <RingApproachPoint-response> (roslisp-msg-protocol:ros-message)
  ((output_x
    :reader output_x
    :initarg :output_x
    :type cl:float
    :initform 0.0)
   (output_y
    :reader output_y
    :initarg :output_y
    :type cl:float
    :initform 0.0)
   (output_z
    :reader output_z
    :initarg :output_z
    :type cl:float
    :initform 0.0)
   (output_w
    :reader output_w
    :initarg :output_w
    :type cl:float
    :initform 0.0))
)

(cl:defclass RingApproachPoint-response (<RingApproachPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RingApproachPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RingApproachPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<RingApproachPoint-response> is deprecated: use task2-srv:RingApproachPoint-response instead.")))

(cl:ensure-generic-function 'output_x-val :lambda-list '(m))
(cl:defmethod output_x-val ((m <RingApproachPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:output_x-val is deprecated.  Use task2-srv:output_x instead.")
  (output_x m))

(cl:ensure-generic-function 'output_y-val :lambda-list '(m))
(cl:defmethod output_y-val ((m <RingApproachPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:output_y-val is deprecated.  Use task2-srv:output_y instead.")
  (output_y m))

(cl:ensure-generic-function 'output_z-val :lambda-list '(m))
(cl:defmethod output_z-val ((m <RingApproachPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:output_z-val is deprecated.  Use task2-srv:output_z instead.")
  (output_z m))

(cl:ensure-generic-function 'output_w-val :lambda-list '(m))
(cl:defmethod output_w-val ((m <RingApproachPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:output_w-val is deprecated.  Use task2-srv:output_w instead.")
  (output_w m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RingApproachPoint-response>) ostream)
  "Serializes a message object of type '<RingApproachPoint-response>"
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'output_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'output_w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RingApproachPoint-response>) istream)
  "Deserializes a message object of type '<RingApproachPoint-response>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_w) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RingApproachPoint-response>)))
  "Returns string type for a service object of type '<RingApproachPoint-response>"
  "task2/RingApproachPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RingApproachPoint-response)))
  "Returns string type for a service object of type 'RingApproachPoint-response"
  "task2/RingApproachPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RingApproachPoint-response>)))
  "Returns md5sum for a message object of type '<RingApproachPoint-response>"
  "a0a873596cba774a4f04b2ea2ebf3221")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RingApproachPoint-response)))
  "Returns md5sum for a message object of type 'RingApproachPoint-response"
  "a0a873596cba774a4f04b2ea2ebf3221")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RingApproachPoint-response>)))
  "Returns full string definition for message of type '<RingApproachPoint-response>"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%float64 output_z~%float64 output_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RingApproachPoint-response)))
  "Returns full string definition for message of type 'RingApproachPoint-response"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%float64 output_z~%float64 output_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RingApproachPoint-response>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RingApproachPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RingApproachPoint-response
    (cl:cons ':output_x (output_x msg))
    (cl:cons ':output_y (output_y msg))
    (cl:cons ':output_z (output_z msg))
    (cl:cons ':output_w (output_w msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RingApproachPoint)))
  'RingApproachPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RingApproachPoint)))
  'RingApproachPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RingApproachPoint)))
  "Returns string type for a service object of type '<RingApproachPoint>"
  "task2/RingApproachPoint")