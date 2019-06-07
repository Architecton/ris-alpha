; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude MapDetector-request.msg.html

(cl:defclass <MapDetector-request> (roslisp-msg-protocol:ros-message)
  ((flg
    :reader flg
    :initarg :flg
    :type cl:integer
    :initform 0))
)

(cl:defclass MapDetector-request (<MapDetector-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapDetector-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapDetector-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<MapDetector-request> is deprecated: use task3-srv:MapDetector-request instead.")))

(cl:ensure-generic-function 'flg-val :lambda-list '(m))
(cl:defmethod flg-val ((m <MapDetector-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:flg-val is deprecated.  Use task3-srv:flg instead.")
  (flg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapDetector-request>) ostream)
  "Serializes a message object of type '<MapDetector-request>"
  (cl:let* ((signed (cl:slot-value msg 'flg)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapDetector-request>) istream)
  "Deserializes a message object of type '<MapDetector-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flg) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapDetector-request>)))
  "Returns string type for a service object of type '<MapDetector-request>"
  "task3/MapDetectorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapDetector-request)))
  "Returns string type for a service object of type 'MapDetector-request"
  "task3/MapDetectorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapDetector-request>)))
  "Returns md5sum for a message object of type '<MapDetector-request>"
  "5c0167ecd7748962f1d9e21ddb0b0dae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapDetector-request)))
  "Returns md5sum for a message object of type 'MapDetector-request"
  "5c0167ecd7748962f1d9e21ddb0b0dae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapDetector-request>)))
  "Returns full string definition for message of type '<MapDetector-request>"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapDetector-request)))
  "Returns full string definition for message of type 'MapDetector-request"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapDetector-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapDetector-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapDetector-request
    (cl:cons ':flg (flg msg))
))
;//! \htmlinclude MapDetector-response.msg.html

(cl:defclass <MapDetector-response> (roslisp-msg-protocol:ros-message)
  ((treasure_x
    :reader treasure_x
    :initarg :treasure_x
    :type cl:float
    :initform 0.0)
   (treasure_y
    :reader treasure_y
    :initarg :treasure_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass MapDetector-response (<MapDetector-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapDetector-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapDetector-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<MapDetector-response> is deprecated: use task3-srv:MapDetector-response instead.")))

(cl:ensure-generic-function 'treasure_x-val :lambda-list '(m))
(cl:defmethod treasure_x-val ((m <MapDetector-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:treasure_x-val is deprecated.  Use task3-srv:treasure_x instead.")
  (treasure_x m))

(cl:ensure-generic-function 'treasure_y-val :lambda-list '(m))
(cl:defmethod treasure_y-val ((m <MapDetector-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:treasure_y-val is deprecated.  Use task3-srv:treasure_y instead.")
  (treasure_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapDetector-response>) ostream)
  "Serializes a message object of type '<MapDetector-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'treasure_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'treasure_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapDetector-response>) istream)
  "Deserializes a message object of type '<MapDetector-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'treasure_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'treasure_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapDetector-response>)))
  "Returns string type for a service object of type '<MapDetector-response>"
  "task3/MapDetectorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapDetector-response)))
  "Returns string type for a service object of type 'MapDetector-response"
  "task3/MapDetectorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapDetector-response>)))
  "Returns md5sum for a message object of type '<MapDetector-response>"
  "5c0167ecd7748962f1d9e21ddb0b0dae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapDetector-response)))
  "Returns md5sum for a message object of type 'MapDetector-response"
  "5c0167ecd7748962f1d9e21ddb0b0dae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapDetector-response>)))
  "Returns full string definition for message of type '<MapDetector-response>"
  (cl:format cl:nil "float64 treasure_x~%float64 treasure_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapDetector-response)))
  "Returns full string definition for message of type 'MapDetector-response"
  (cl:format cl:nil "float64 treasure_x~%float64 treasure_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapDetector-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapDetector-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapDetector-response
    (cl:cons ':treasure_x (treasure_x msg))
    (cl:cons ':treasure_y (treasure_y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapDetector)))
  'MapDetector-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapDetector)))
  'MapDetector-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapDetector)))
  "Returns string type for a service object of type '<MapDetector>"
  "task3/MapDetector")