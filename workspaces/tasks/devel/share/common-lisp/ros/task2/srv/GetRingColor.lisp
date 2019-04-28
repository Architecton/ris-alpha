; Auto-generated. Do not edit!


(cl:in-package task2-srv)


;//! \htmlinclude GetRingColor-request.msg.html

(cl:defclass <GetRingColor-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:integer
    :initform 0))
)

(cl:defclass GetRingColor-request (<GetRingColor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRingColor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRingColor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<GetRingColor-request> is deprecated: use task2-srv:GetRingColor-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <GetRingColor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:start-val is deprecated.  Use task2-srv:start instead.")
  (start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRingColor-request>) ostream)
  "Serializes a message object of type '<GetRingColor-request>"
  (cl:let* ((signed (cl:slot-value msg 'start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRingColor-request>) istream)
  "Deserializes a message object of type '<GetRingColor-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRingColor-request>)))
  "Returns string type for a service object of type '<GetRingColor-request>"
  "task2/GetRingColorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRingColor-request)))
  "Returns string type for a service object of type 'GetRingColor-request"
  "task2/GetRingColorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRingColor-request>)))
  "Returns md5sum for a message object of type '<GetRingColor-request>"
  "f1520819364d5ba5d943a48edb027a19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRingColor-request)))
  "Returns md5sum for a message object of type 'GetRingColor-request"
  "f1520819364d5ba5d943a48edb027a19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRingColor-request>)))
  "Returns full string definition for message of type '<GetRingColor-request>"
  (cl:format cl:nil "int64 start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRingColor-request)))
  "Returns full string definition for message of type 'GetRingColor-request"
  (cl:format cl:nil "int64 start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRingColor-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRingColor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRingColor-request
    (cl:cons ':start (start msg))
))
;//! \htmlinclude GetRingColor-response.msg.html

(cl:defclass <GetRingColor-response> (roslisp-msg-protocol:ros-message)
  ((color
    :reader color
    :initarg :color
    :type cl:integer
    :initform 0))
)

(cl:defclass GetRingColor-response (<GetRingColor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRingColor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRingColor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<GetRingColor-response> is deprecated: use task2-srv:GetRingColor-response instead.")))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <GetRingColor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:color-val is deprecated.  Use task2-srv:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRingColor-response>) ostream)
  "Serializes a message object of type '<GetRingColor-response>"
  (cl:let* ((signed (cl:slot-value msg 'color)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRingColor-response>) istream)
  "Deserializes a message object of type '<GetRingColor-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRingColor-response>)))
  "Returns string type for a service object of type '<GetRingColor-response>"
  "task2/GetRingColorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRingColor-response)))
  "Returns string type for a service object of type 'GetRingColor-response"
  "task2/GetRingColorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRingColor-response>)))
  "Returns md5sum for a message object of type '<GetRingColor-response>"
  "f1520819364d5ba5d943a48edb027a19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRingColor-response)))
  "Returns md5sum for a message object of type 'GetRingColor-response"
  "f1520819364d5ba5d943a48edb027a19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRingColor-response>)))
  "Returns full string definition for message of type '<GetRingColor-response>"
  (cl:format cl:nil "int64 color~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRingColor-response)))
  "Returns full string definition for message of type 'GetRingColor-response"
  (cl:format cl:nil "int64 color~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRingColor-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRingColor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRingColor-response
    (cl:cons ':color (color msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetRingColor)))
  'GetRingColor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetRingColor)))
  'GetRingColor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRingColor)))
  "Returns string type for a service object of type '<GetRingColor>"
  "task2/GetRingColor")