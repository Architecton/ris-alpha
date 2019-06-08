; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude ReconfigParams-request.msg.html

(cl:defclass <ReconfigParams-request> (roslisp-msg-protocol:ros-message)
  ((param_name
    :reader param_name
    :initarg :param_name
    :type cl:string
    :initform "")
   (param_val
    :reader param_val
    :initarg :param_val
    :type cl:string
    :initform ""))
)

(cl:defclass ReconfigParams-request (<ReconfigParams-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReconfigParams-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReconfigParams-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<ReconfigParams-request> is deprecated: use task3-srv:ReconfigParams-request instead.")))

(cl:ensure-generic-function 'param_name-val :lambda-list '(m))
(cl:defmethod param_name-val ((m <ReconfigParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:param_name-val is deprecated.  Use task3-srv:param_name instead.")
  (param_name m))

(cl:ensure-generic-function 'param_val-val :lambda-list '(m))
(cl:defmethod param_val-val ((m <ReconfigParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:param_val-val is deprecated.  Use task3-srv:param_val instead.")
  (param_val m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReconfigParams-request>) ostream)
  "Serializes a message object of type '<ReconfigParams-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'param_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'param_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'param_val))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'param_val))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReconfigParams-request>) istream)
  "Deserializes a message object of type '<ReconfigParams-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'param_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param_val) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'param_val) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReconfigParams-request>)))
  "Returns string type for a service object of type '<ReconfigParams-request>"
  "task3/ReconfigParamsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReconfigParams-request)))
  "Returns string type for a service object of type 'ReconfigParams-request"
  "task3/ReconfigParamsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReconfigParams-request>)))
  "Returns md5sum for a message object of type '<ReconfigParams-request>"
  "ca89989307a87a3268666e3ae28823bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReconfigParams-request)))
  "Returns md5sum for a message object of type 'ReconfigParams-request"
  "ca89989307a87a3268666e3ae28823bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReconfigParams-request>)))
  "Returns full string definition for message of type '<ReconfigParams-request>"
  (cl:format cl:nil "string param_name~%string param_val~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReconfigParams-request)))
  "Returns full string definition for message of type 'ReconfigParams-request"
  (cl:format cl:nil "string param_name~%string param_val~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReconfigParams-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'param_name))
     4 (cl:length (cl:slot-value msg 'param_val))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReconfigParams-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReconfigParams-request
    (cl:cons ':param_name (param_name msg))
    (cl:cons ':param_val (param_val msg))
))
;//! \htmlinclude ReconfigParams-response.msg.html

(cl:defclass <ReconfigParams-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ReconfigParams-response (<ReconfigParams-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReconfigParams-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReconfigParams-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<ReconfigParams-response> is deprecated: use task3-srv:ReconfigParams-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ReconfigParams-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:success-val is deprecated.  Use task3-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReconfigParams-response>) ostream)
  "Serializes a message object of type '<ReconfigParams-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReconfigParams-response>) istream)
  "Deserializes a message object of type '<ReconfigParams-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReconfigParams-response>)))
  "Returns string type for a service object of type '<ReconfigParams-response>"
  "task3/ReconfigParamsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReconfigParams-response)))
  "Returns string type for a service object of type 'ReconfigParams-response"
  "task3/ReconfigParamsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReconfigParams-response>)))
  "Returns md5sum for a message object of type '<ReconfigParams-response>"
  "ca89989307a87a3268666e3ae28823bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReconfigParams-response)))
  "Returns md5sum for a message object of type 'ReconfigParams-response"
  "ca89989307a87a3268666e3ae28823bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReconfigParams-response>)))
  "Returns full string definition for message of type '<ReconfigParams-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReconfigParams-response)))
  "Returns full string definition for message of type 'ReconfigParams-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReconfigParams-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReconfigParams-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReconfigParams-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReconfigParams)))
  'ReconfigParams-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReconfigParams)))
  'ReconfigParams-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReconfigParams)))
  "Returns string type for a service object of type '<ReconfigParams>"
  "task3/ReconfigParams")