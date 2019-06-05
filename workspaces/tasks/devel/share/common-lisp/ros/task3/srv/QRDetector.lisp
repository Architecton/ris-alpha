; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude QRDetector-request.msg.html

(cl:defclass <QRDetector-request> (roslisp-msg-protocol:ros-message)
  ((flg
    :reader flg
    :initarg :flg
    :type cl:integer
    :initform 0))
)

(cl:defclass QRDetector-request (<QRDetector-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QRDetector-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QRDetector-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<QRDetector-request> is deprecated: use task3-srv:QRDetector-request instead.")))

(cl:ensure-generic-function 'flg-val :lambda-list '(m))
(cl:defmethod flg-val ((m <QRDetector-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:flg-val is deprecated.  Use task3-srv:flg instead.")
  (flg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QRDetector-request>) ostream)
  "Serializes a message object of type '<QRDetector-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QRDetector-request>) istream)
  "Deserializes a message object of type '<QRDetector-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QRDetector-request>)))
  "Returns string type for a service object of type '<QRDetector-request>"
  "task3/QRDetectorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QRDetector-request)))
  "Returns string type for a service object of type 'QRDetector-request"
  "task3/QRDetectorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QRDetector-request>)))
  "Returns md5sum for a message object of type '<QRDetector-request>"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QRDetector-request)))
  "Returns md5sum for a message object of type 'QRDetector-request"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QRDetector-request>)))
  "Returns full string definition for message of type '<QRDetector-request>"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QRDetector-request)))
  "Returns full string definition for message of type 'QRDetector-request"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QRDetector-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QRDetector-request>))
  "Converts a ROS message object to a list"
  (cl:list 'QRDetector-request
    (cl:cons ':flg (flg msg))
))
;//! \htmlinclude QRDetector-response.msg.html

(cl:defclass <QRDetector-response> (roslisp-msg-protocol:ros-message)
  ((res
    :reader res
    :initarg :res
    :type cl:string
    :initform ""))
)

(cl:defclass QRDetector-response (<QRDetector-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QRDetector-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QRDetector-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<QRDetector-response> is deprecated: use task3-srv:QRDetector-response instead.")))

(cl:ensure-generic-function 'res-val :lambda-list '(m))
(cl:defmethod res-val ((m <QRDetector-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:res-val is deprecated.  Use task3-srv:res instead.")
  (res m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QRDetector-response>) ostream)
  "Serializes a message object of type '<QRDetector-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'res))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'res))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QRDetector-response>) istream)
  "Deserializes a message object of type '<QRDetector-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'res) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'res) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QRDetector-response>)))
  "Returns string type for a service object of type '<QRDetector-response>"
  "task3/QRDetectorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QRDetector-response)))
  "Returns string type for a service object of type 'QRDetector-response"
  "task3/QRDetectorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QRDetector-response>)))
  "Returns md5sum for a message object of type '<QRDetector-response>"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QRDetector-response)))
  "Returns md5sum for a message object of type 'QRDetector-response"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QRDetector-response>)))
  "Returns full string definition for message of type '<QRDetector-response>"
  (cl:format cl:nil "string res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QRDetector-response)))
  "Returns full string definition for message of type 'QRDetector-response"
  (cl:format cl:nil "string res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QRDetector-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'res))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QRDetector-response>))
  "Converts a ROS message object to a list"
  (cl:list 'QRDetector-response
    (cl:cons ':res (res msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'QRDetector)))
  'QRDetector-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'QRDetector)))
  'QRDetector-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QRDetector)))
  "Returns string type for a service object of type '<QRDetector>"
  "task3/QRDetector")