; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude DigitDetector-request.msg.html

(cl:defclass <DigitDetector-request> (roslisp-msg-protocol:ros-message)
  ((flg
    :reader flg
    :initarg :flg
    :type cl:integer
    :initform 0))
)

(cl:defclass DigitDetector-request (<DigitDetector-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DigitDetector-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DigitDetector-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<DigitDetector-request> is deprecated: use task3-srv:DigitDetector-request instead.")))

(cl:ensure-generic-function 'flg-val :lambda-list '(m))
(cl:defmethod flg-val ((m <DigitDetector-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:flg-val is deprecated.  Use task3-srv:flg instead.")
  (flg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DigitDetector-request>) ostream)
  "Serializes a message object of type '<DigitDetector-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DigitDetector-request>) istream)
  "Deserializes a message object of type '<DigitDetector-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DigitDetector-request>)))
  "Returns string type for a service object of type '<DigitDetector-request>"
  "task3/DigitDetectorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DigitDetector-request)))
  "Returns string type for a service object of type 'DigitDetector-request"
  "task3/DigitDetectorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DigitDetector-request>)))
  "Returns md5sum for a message object of type '<DigitDetector-request>"
  "64fdfdf2315ce0489e0badef6a400485")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DigitDetector-request)))
  "Returns md5sum for a message object of type 'DigitDetector-request"
  "64fdfdf2315ce0489e0badef6a400485")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DigitDetector-request>)))
  "Returns full string definition for message of type '<DigitDetector-request>"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DigitDetector-request)))
  "Returns full string definition for message of type 'DigitDetector-request"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DigitDetector-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DigitDetector-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DigitDetector-request
    (cl:cons ':flg (flg msg))
))
;//! \htmlinclude DigitDetector-response.msg.html

(cl:defclass <DigitDetector-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass DigitDetector-response (<DigitDetector-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DigitDetector-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DigitDetector-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<DigitDetector-response> is deprecated: use task3-srv:DigitDetector-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <DigitDetector-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:result-val is deprecated.  Use task3-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DigitDetector-response>) ostream)
  "Serializes a message object of type '<DigitDetector-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DigitDetector-response>) istream)
  "Deserializes a message object of type '<DigitDetector-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'result) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'result)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DigitDetector-response>)))
  "Returns string type for a service object of type '<DigitDetector-response>"
  "task3/DigitDetectorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DigitDetector-response)))
  "Returns string type for a service object of type 'DigitDetector-response"
  "task3/DigitDetectorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DigitDetector-response>)))
  "Returns md5sum for a message object of type '<DigitDetector-response>"
  "64fdfdf2315ce0489e0badef6a400485")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DigitDetector-response)))
  "Returns md5sum for a message object of type 'DigitDetector-response"
  "64fdfdf2315ce0489e0badef6a400485")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DigitDetector-response>)))
  "Returns full string definition for message of type '<DigitDetector-response>"
  (cl:format cl:nil "int64[] result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DigitDetector-response)))
  "Returns full string definition for message of type 'DigitDetector-response"
  (cl:format cl:nil "int64[] result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DigitDetector-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'result) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DigitDetector-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DigitDetector-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DigitDetector)))
  'DigitDetector-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DigitDetector)))
  'DigitDetector-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DigitDetector)))
  "Returns string type for a service object of type '<DigitDetector>"
  "task3/DigitDetector")