; Auto-generated. Do not edit!


(cl:in-package alpha1-srv)


;//! \htmlinclude MultIntegers-request.msg.html

(cl:defclass <MultIntegers-request> (roslisp-msg-protocol:ros-message)
  ((int_list
    :reader int_list
    :initarg :int_list
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass MultIntegers-request (<MultIntegers-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultIntegers-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultIntegers-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alpha1-srv:<MultIntegers-request> is deprecated: use alpha1-srv:MultIntegers-request instead.")))

(cl:ensure-generic-function 'int_list-val :lambda-list '(m))
(cl:defmethod int_list-val ((m <MultIntegers-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha1-srv:int_list-val is deprecated.  Use alpha1-srv:int_list instead.")
  (int_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultIntegers-request>) ostream)
  "Serializes a message object of type '<MultIntegers-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'int_list))))
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
   (cl:slot-value msg 'int_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultIntegers-request>) istream)
  "Deserializes a message object of type '<MultIntegers-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'int_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'int_list)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultIntegers-request>)))
  "Returns string type for a service object of type '<MultIntegers-request>"
  "alpha1/MultIntegersRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultIntegers-request)))
  "Returns string type for a service object of type 'MultIntegers-request"
  "alpha1/MultIntegersRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultIntegers-request>)))
  "Returns md5sum for a message object of type '<MultIntegers-request>"
  "99989b30d784b92ec8440f11988612b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultIntegers-request)))
  "Returns md5sum for a message object of type 'MultIntegers-request"
  "99989b30d784b92ec8440f11988612b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultIntegers-request>)))
  "Returns full string definition for message of type '<MultIntegers-request>"
  (cl:format cl:nil "int64[] int_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultIntegers-request)))
  "Returns full string definition for message of type 'MultIntegers-request"
  (cl:format cl:nil "int64[] int_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultIntegers-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'int_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultIntegers-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MultIntegers-request
    (cl:cons ':int_list (int_list msg))
))
;//! \htmlinclude MultIntegers-response.msg.html

(cl:defclass <MultIntegers-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass MultIntegers-response (<MultIntegers-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultIntegers-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultIntegers-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alpha1-srv:<MultIntegers-response> is deprecated: use alpha1-srv:MultIntegers-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <MultIntegers-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha1-srv:result-val is deprecated.  Use alpha1-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultIntegers-response>) ostream)
  "Serializes a message object of type '<MultIntegers-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultIntegers-response>) istream)
  "Deserializes a message object of type '<MultIntegers-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultIntegers-response>)))
  "Returns string type for a service object of type '<MultIntegers-response>"
  "alpha1/MultIntegersResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultIntegers-response)))
  "Returns string type for a service object of type 'MultIntegers-response"
  "alpha1/MultIntegersResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultIntegers-response>)))
  "Returns md5sum for a message object of type '<MultIntegers-response>"
  "99989b30d784b92ec8440f11988612b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultIntegers-response)))
  "Returns md5sum for a message object of type 'MultIntegers-response"
  "99989b30d784b92ec8440f11988612b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultIntegers-response>)))
  "Returns full string definition for message of type '<MultIntegers-response>"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultIntegers-response)))
  "Returns full string definition for message of type 'MultIntegers-response"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultIntegers-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultIntegers-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MultIntegers-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MultIntegers)))
  'MultIntegers-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MultIntegers)))
  'MultIntegers-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultIntegers)))
  "Returns string type for a service object of type '<MultIntegers>"
  "alpha1/MultIntegers")