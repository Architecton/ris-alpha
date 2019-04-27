; Auto-generated. Do not edit!


(cl:in-package task2-msg)


;//! \htmlinclude RingApproachPointResponse.msg.html

(cl:defclass <RingApproachPointResponse> (roslisp-msg-protocol:ros-message)
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

(cl:defclass RingApproachPointResponse (<RingApproachPointResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RingApproachPointResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RingApproachPointResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-msg:<RingApproachPointResponse> is deprecated: use task2-msg:RingApproachPointResponse instead.")))

(cl:ensure-generic-function 'output_x-val :lambda-list '(m))
(cl:defmethod output_x-val ((m <RingApproachPointResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:output_x-val is deprecated.  Use task2-msg:output_x instead.")
  (output_x m))

(cl:ensure-generic-function 'output_y-val :lambda-list '(m))
(cl:defmethod output_y-val ((m <RingApproachPointResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:output_y-val is deprecated.  Use task2-msg:output_y instead.")
  (output_y m))

(cl:ensure-generic-function 'output_z-val :lambda-list '(m))
(cl:defmethod output_z-val ((m <RingApproachPointResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:output_z-val is deprecated.  Use task2-msg:output_z instead.")
  (output_z m))

(cl:ensure-generic-function 'output_w-val :lambda-list '(m))
(cl:defmethod output_w-val ((m <RingApproachPointResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:output_w-val is deprecated.  Use task2-msg:output_w instead.")
  (output_w m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RingApproachPointResponse>) ostream)
  "Serializes a message object of type '<RingApproachPointResponse>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RingApproachPointResponse>) istream)
  "Deserializes a message object of type '<RingApproachPointResponse>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RingApproachPointResponse>)))
  "Returns string type for a message object of type '<RingApproachPointResponse>"
  "task2/RingApproachPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RingApproachPointResponse)))
  "Returns string type for a message object of type 'RingApproachPointResponse"
  "task2/RingApproachPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RingApproachPointResponse>)))
  "Returns md5sum for a message object of type '<RingApproachPointResponse>"
  "4d5d6e6db05e5f8fa78eb351c0a546a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RingApproachPointResponse)))
  "Returns md5sum for a message object of type 'RingApproachPointResponse"
  "4d5d6e6db05e5f8fa78eb351c0a546a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RingApproachPointResponse>)))
  "Returns full string definition for message of type '<RingApproachPointResponse>"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%float64 output_z~%float64 output_w~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RingApproachPointResponse)))
  "Returns full string definition for message of type 'RingApproachPointResponse"
  (cl:format cl:nil "float64 output_x~%float64 output_y~%float64 output_z~%float64 output_w~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RingApproachPointResponse>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RingApproachPointResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'RingApproachPointResponse
    (cl:cons ':output_x (output_x msg))
    (cl:cons ':output_y (output_y msg))
    (cl:cons ':output_z (output_z msg))
    (cl:cons ':output_w (output_w msg))
))
