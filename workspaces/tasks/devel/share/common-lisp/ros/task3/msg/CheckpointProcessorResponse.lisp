; Auto-generated. Do not edit!


(cl:in-package task3-msg)


;//! \htmlinclude CheckpointProcessorResponse.msg.html

(cl:defclass <CheckpointProcessorResponse> (roslisp-msg-protocol:ros-message)
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

(cl:defclass CheckpointProcessorResponse (<CheckpointProcessorResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckpointProcessorResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckpointProcessorResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-msg:<CheckpointProcessorResponse> is deprecated: use task3-msg:CheckpointProcessorResponse instead.")))

(cl:ensure-generic-function 'output_x-val :lambda-list '(m))
(cl:defmethod output_x-val ((m <CheckpointProcessorResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:output_x-val is deprecated.  Use task3-msg:output_x instead.")
  (output_x m))

(cl:ensure-generic-function 'output_y-val :lambda-list '(m))
(cl:defmethod output_y-val ((m <CheckpointProcessorResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:output_y-val is deprecated.  Use task3-msg:output_y instead.")
  (output_y m))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <CheckpointProcessorResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:valid-val is deprecated.  Use task3-msg:valid instead.")
  (valid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckpointProcessorResponse>) ostream)
  "Serializes a message object of type '<CheckpointProcessorResponse>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckpointProcessorResponse>) istream)
  "Deserializes a message object of type '<CheckpointProcessorResponse>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckpointProcessorResponse>)))
  "Returns string type for a message object of type '<CheckpointProcessorResponse>"
  "task3/CheckpointProcessorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckpointProcessorResponse)))
  "Returns string type for a message object of type 'CheckpointProcessorResponse"
  "task3/CheckpointProcessorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckpointProcessorResponse>)))
  "Returns md5sum for a message object of type '<CheckpointProcessorResponse>"
  "d43cce861a65119db3648d950c7f417f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckpointProcessorResponse)))
  "Returns md5sum for a message object of type 'CheckpointProcessorResponse"
  "d43cce861a65119db3648d950c7f417f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckpointProcessorResponse>)))
  "Returns full string definition for message of type '<CheckpointProcessorResponse>"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%bool valid~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckpointProcessorResponse)))
  "Returns full string definition for message of type 'CheckpointProcessorResponse"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%bool valid~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckpointProcessorResponse>))
  (cl:+ 0
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckpointProcessorResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckpointProcessorResponse
    (cl:cons ':output_x (output_x msg))
    (cl:cons ':output_y (output_y msg))
    (cl:cons ':valid (valid msg))
))
