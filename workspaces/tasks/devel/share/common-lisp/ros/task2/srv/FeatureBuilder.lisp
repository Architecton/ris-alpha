; Auto-generated. Do not edit!


(cl:in-package task2-srv)


;//! \htmlinclude FeatureBuilder-request.msg.html

(cl:defclass <FeatureBuilder-request> (roslisp-msg-protocol:ros-message)
  ((flg
    :reader flg
    :initarg :flg
    :type cl:integer
    :initform 0))
)

(cl:defclass FeatureBuilder-request (<FeatureBuilder-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FeatureBuilder-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FeatureBuilder-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<FeatureBuilder-request> is deprecated: use task2-srv:FeatureBuilder-request instead.")))

(cl:ensure-generic-function 'flg-val :lambda-list '(m))
(cl:defmethod flg-val ((m <FeatureBuilder-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:flg-val is deprecated.  Use task2-srv:flg instead.")
  (flg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FeatureBuilder-request>) ostream)
  "Serializes a message object of type '<FeatureBuilder-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FeatureBuilder-request>) istream)
  "Deserializes a message object of type '<FeatureBuilder-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FeatureBuilder-request>)))
  "Returns string type for a service object of type '<FeatureBuilder-request>"
  "task2/FeatureBuilderRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FeatureBuilder-request)))
  "Returns string type for a service object of type 'FeatureBuilder-request"
  "task2/FeatureBuilderRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FeatureBuilder-request>)))
  "Returns md5sum for a message object of type '<FeatureBuilder-request>"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FeatureBuilder-request)))
  "Returns md5sum for a message object of type 'FeatureBuilder-request"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FeatureBuilder-request>)))
  "Returns full string definition for message of type '<FeatureBuilder-request>"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FeatureBuilder-request)))
  "Returns full string definition for message of type 'FeatureBuilder-request"
  (cl:format cl:nil "int64 flg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FeatureBuilder-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FeatureBuilder-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FeatureBuilder-request
    (cl:cons ':flg (flg msg))
))
;//! \htmlinclude FeatureBuilder-response.msg.html

(cl:defclass <FeatureBuilder-response> (roslisp-msg-protocol:ros-message)
  ((res
    :reader res
    :initarg :res
    :type cl:string
    :initform ""))
)

(cl:defclass FeatureBuilder-response (<FeatureBuilder-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FeatureBuilder-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FeatureBuilder-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<FeatureBuilder-response> is deprecated: use task2-srv:FeatureBuilder-response instead.")))

(cl:ensure-generic-function 'res-val :lambda-list '(m))
(cl:defmethod res-val ((m <FeatureBuilder-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:res-val is deprecated.  Use task2-srv:res instead.")
  (res m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FeatureBuilder-response>) ostream)
  "Serializes a message object of type '<FeatureBuilder-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'res))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'res))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FeatureBuilder-response>) istream)
  "Deserializes a message object of type '<FeatureBuilder-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FeatureBuilder-response>)))
  "Returns string type for a service object of type '<FeatureBuilder-response>"
  "task2/FeatureBuilderResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FeatureBuilder-response)))
  "Returns string type for a service object of type 'FeatureBuilder-response"
  "task2/FeatureBuilderResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FeatureBuilder-response>)))
  "Returns md5sum for a message object of type '<FeatureBuilder-response>"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FeatureBuilder-response)))
  "Returns md5sum for a message object of type 'FeatureBuilder-response"
  "74768431c7b5d3256bc92cadde0c032a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FeatureBuilder-response>)))
  "Returns full string definition for message of type '<FeatureBuilder-response>"
  (cl:format cl:nil "string res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FeatureBuilder-response)))
  "Returns full string definition for message of type 'FeatureBuilder-response"
  (cl:format cl:nil "string res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FeatureBuilder-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'res))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FeatureBuilder-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FeatureBuilder-response
    (cl:cons ':res (res msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FeatureBuilder)))
  'FeatureBuilder-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FeatureBuilder)))
  'FeatureBuilder-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FeatureBuilder)))
  "Returns string type for a service object of type '<FeatureBuilder>"
  "task2/FeatureBuilder")