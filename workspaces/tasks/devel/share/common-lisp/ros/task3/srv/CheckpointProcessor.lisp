; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude CheckpointProcessor-request.msg.html

(cl:defclass <CheckpointProcessor-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass CheckpointProcessor-request (<CheckpointProcessor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckpointProcessor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckpointProcessor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<CheckpointProcessor-request> is deprecated: use task3-srv:CheckpointProcessor-request instead.")))

(cl:ensure-generic-function 'input_x-val :lambda-list '(m))
(cl:defmethod input_x-val ((m <CheckpointProcessor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:input_x-val is deprecated.  Use task3-srv:input_x instead.")
  (input_x m))

(cl:ensure-generic-function 'input_y-val :lambda-list '(m))
(cl:defmethod input_y-val ((m <CheckpointProcessor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:input_y-val is deprecated.  Use task3-srv:input_y instead.")
  (input_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckpointProcessor-request>) ostream)
  "Serializes a message object of type '<CheckpointProcessor-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckpointProcessor-request>) istream)
  "Deserializes a message object of type '<CheckpointProcessor-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckpointProcessor-request>)))
  "Returns string type for a service object of type '<CheckpointProcessor-request>"
  "task3/CheckpointProcessorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckpointProcessor-request)))
  "Returns string type for a service object of type 'CheckpointProcessor-request"
  "task3/CheckpointProcessorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckpointProcessor-request>)))
  "Returns md5sum for a message object of type '<CheckpointProcessor-request>"
  "af3f94b765997022c6ac0867e7797cba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckpointProcessor-request)))
  "Returns md5sum for a message object of type 'CheckpointProcessor-request"
  "af3f94b765997022c6ac0867e7797cba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckpointProcessor-request>)))
  "Returns full string definition for message of type '<CheckpointProcessor-request>"
  (cl:format cl:nil "float64 input_x~%float64 input_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckpointProcessor-request)))
  "Returns full string definition for message of type 'CheckpointProcessor-request"
  (cl:format cl:nil "float64 input_x~%float64 input_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckpointProcessor-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckpointProcessor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckpointProcessor-request
    (cl:cons ':input_x (input_x msg))
    (cl:cons ':input_y (input_y msg))
))
;//! \htmlinclude CheckpointProcessor-response.msg.html

(cl:defclass <CheckpointProcessor-response> (roslisp-msg-protocol:ros-message)
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
   (valid
    :reader valid
    :initarg :valid
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CheckpointProcessor-response (<CheckpointProcessor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckpointProcessor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckpointProcessor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<CheckpointProcessor-response> is deprecated: use task3-srv:CheckpointProcessor-response instead.")))

(cl:ensure-generic-function 'output_x-val :lambda-list '(m))
(cl:defmethod output_x-val ((m <CheckpointProcessor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:output_x-val is deprecated.  Use task3-srv:output_x instead.")
  (output_x m))

(cl:ensure-generic-function 'output_y-val :lambda-list '(m))
(cl:defmethod output_y-val ((m <CheckpointProcessor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:output_y-val is deprecated.  Use task3-srv:output_y instead.")
  (output_y m))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <CheckpointProcessor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:valid-val is deprecated.  Use task3-srv:valid instead.")
  (valid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckpointProcessor-response>) ostream)
  "Serializes a message object of type '<CheckpointProcessor-response>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckpointProcessor-response>) istream)
  "Deserializes a message object of type '<CheckpointProcessor-response>"
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
    (cl:setf (cl:slot-value msg 'valid) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckpointProcessor-response>)))
  "Returns string type for a service object of type '<CheckpointProcessor-response>"
  "task3/CheckpointProcessorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckpointProcessor-response)))
  "Returns string type for a service object of type 'CheckpointProcessor-response"
  "task3/CheckpointProcessorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckpointProcessor-response>)))
  "Returns md5sum for a message object of type '<CheckpointProcessor-response>"
  "af3f94b765997022c6ac0867e7797cba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckpointProcessor-response)))
  "Returns md5sum for a message object of type 'CheckpointProcessor-response"
  "af3f94b765997022c6ac0867e7797cba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckpointProcessor-response>)))
  "Returns full string definition for message of type '<CheckpointProcessor-response>"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%bool valid~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckpointProcessor-response)))
  "Returns full string definition for message of type 'CheckpointProcessor-response"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%bool valid~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckpointProcessor-response>))
  (cl:+ 0
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckpointProcessor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckpointProcessor-response
    (cl:cons ':output_x (output_x msg))
    (cl:cons ':output_y (output_y msg))
    (cl:cons ':valid (valid msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CheckpointProcessor)))
  'CheckpointProcessor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CheckpointProcessor)))
  'CheckpointProcessor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckpointProcessor)))
  "Returns string type for a service object of type '<CheckpointProcessor>"
  "task3/CheckpointProcessor")