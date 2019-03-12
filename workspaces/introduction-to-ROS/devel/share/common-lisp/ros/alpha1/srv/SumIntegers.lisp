; Auto-generated. Do not edit!


(cl:in-package alpha1-srv)


;//! \htmlinclude SumIntegers-request.msg.html

(cl:defclass <SumIntegers-request> (roslisp-msg-protocol:ros-message)
  ((numbers
    :reader numbers
    :initarg :numbers
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass SumIntegers-request (<SumIntegers-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SumIntegers-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SumIntegers-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alpha1-srv:<SumIntegers-request> is deprecated: use alpha1-srv:SumIntegers-request instead.")))

(cl:ensure-generic-function 'numbers-val :lambda-list '(m))
(cl:defmethod numbers-val ((m <SumIntegers-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha1-srv:numbers-val is deprecated.  Use alpha1-srv:numbers instead.")
  (numbers m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SumIntegers-request>) ostream)
  "Serializes a message object of type '<SumIntegers-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'numbers))))
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
   (cl:slot-value msg 'numbers))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SumIntegers-request>) istream)
  "Deserializes a message object of type '<SumIntegers-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'numbers) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'numbers)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SumIntegers-request>)))
  "Returns string type for a service object of type '<SumIntegers-request>"
  "alpha1/SumIntegersRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SumIntegers-request)))
  "Returns string type for a service object of type 'SumIntegers-request"
  "alpha1/SumIntegersRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SumIntegers-request>)))
  "Returns md5sum for a message object of type '<SumIntegers-request>"
  "ee52d55541e33a838f1823a8e8489c7d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SumIntegers-request)))
  "Returns md5sum for a message object of type 'SumIntegers-request"
  "ee52d55541e33a838f1823a8e8489c7d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SumIntegers-request>)))
  "Returns full string definition for message of type '<SumIntegers-request>"
  (cl:format cl:nil "int64[] numbers~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SumIntegers-request)))
  "Returns full string definition for message of type 'SumIntegers-request"
  (cl:format cl:nil "int64[] numbers~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SumIntegers-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'numbers) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SumIntegers-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SumIntegers-request
    (cl:cons ':numbers (numbers msg))
))
;//! \htmlinclude SumIntegers-response.msg.html

(cl:defclass <SumIntegers-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:integer
    :initform 0))
)

(cl:defclass SumIntegers-response (<SumIntegers-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SumIntegers-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SumIntegers-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alpha1-srv:<SumIntegers-response> is deprecated: use alpha1-srv:SumIntegers-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <SumIntegers-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha1-srv:sum-val is deprecated.  Use alpha1-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SumIntegers-response>) ostream)
  "Serializes a message object of type '<SumIntegers-response>"
  (cl:let* ((signed (cl:slot-value msg 'sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SumIntegers-response>) istream)
  "Deserializes a message object of type '<SumIntegers-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sum) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SumIntegers-response>)))
  "Returns string type for a service object of type '<SumIntegers-response>"
  "alpha1/SumIntegersResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SumIntegers-response)))
  "Returns string type for a service object of type 'SumIntegers-response"
  "alpha1/SumIntegersResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SumIntegers-response>)))
  "Returns md5sum for a message object of type '<SumIntegers-response>"
  "ee52d55541e33a838f1823a8e8489c7d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SumIntegers-response)))
  "Returns md5sum for a message object of type 'SumIntegers-response"
  "ee52d55541e33a838f1823a8e8489c7d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SumIntegers-response>)))
  "Returns full string definition for message of type '<SumIntegers-response>"
  (cl:format cl:nil "int64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SumIntegers-response)))
  "Returns full string definition for message of type 'SumIntegers-response"
  (cl:format cl:nil "int64 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SumIntegers-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SumIntegers-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SumIntegers-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SumIntegers)))
  'SumIntegers-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SumIntegers)))
  'SumIntegers-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SumIntegers)))
  "Returns string type for a service object of type '<SumIntegers>"
  "alpha1/SumIntegers")