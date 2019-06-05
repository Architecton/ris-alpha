; Auto-generated. Do not edit!


(cl:in-package task3-msg)


;//! \htmlinclude ValidRegionsMapResponse.msg.html

(cl:defclass <ValidRegionsMapResponse> (roslisp-msg-protocol:ros-message)
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

(cl:defclass ValidRegionsMapResponse (<ValidRegionsMapResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ValidRegionsMapResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ValidRegionsMapResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-msg:<ValidRegionsMapResponse> is deprecated: use task3-msg:ValidRegionsMapResponse instead.")))

(cl:ensure-generic-function 'output_x-val :lambda-list '(m))
(cl:defmethod output_x-val ((m <ValidRegionsMapResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:output_x-val is deprecated.  Use task3-msg:output_x instead.")
  (output_x m))

(cl:ensure-generic-function 'output_y-val :lambda-list '(m))
(cl:defmethod output_y-val ((m <ValidRegionsMapResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:output_y-val is deprecated.  Use task3-msg:output_y instead.")
  (output_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ValidRegionsMapResponse>) ostream)
  "Serializes a message object of type '<ValidRegionsMapResponse>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ValidRegionsMapResponse>) istream)
  "Deserializes a message object of type '<ValidRegionsMapResponse>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ValidRegionsMapResponse>)))
  "Returns string type for a message object of type '<ValidRegionsMapResponse>"
  "task3/ValidRegionsMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidRegionsMapResponse)))
  "Returns string type for a message object of type 'ValidRegionsMapResponse"
  "task3/ValidRegionsMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ValidRegionsMapResponse>)))
  "Returns md5sum for a message object of type '<ValidRegionsMapResponse>"
  "afbd32084a014b9ac53ccb0b88a798f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ValidRegionsMapResponse)))
  "Returns md5sum for a message object of type 'ValidRegionsMapResponse"
  "afbd32084a014b9ac53ccb0b88a798f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ValidRegionsMapResponse>)))
  "Returns full string definition for message of type '<ValidRegionsMapResponse>"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ValidRegionsMapResponse)))
  "Returns full string definition for message of type 'ValidRegionsMapResponse"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ValidRegionsMapResponse>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ValidRegionsMapResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'ValidRegionsMapResponse
    (cl:cons ':output_x (output_x msg))
    (cl:cons ':output_y (output_y msg))
))
