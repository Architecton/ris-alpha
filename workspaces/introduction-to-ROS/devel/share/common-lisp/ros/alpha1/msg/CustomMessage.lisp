; Auto-generated. Do not edit!


(cl:in-package alpha1-msg)


;//! \htmlinclude CustomMessage.msg.html

(cl:defclass <CustomMessage> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass CustomMessage (<CustomMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alpha1-msg:<CustomMessage> is deprecated: use alpha1-msg:CustomMessage instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <CustomMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha1-msg:id-val is deprecated.  Use alpha1-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <CustomMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha1-msg:message-val is deprecated.  Use alpha1-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomMessage>) ostream)
  "Serializes a message object of type '<CustomMessage>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomMessage>) istream)
  "Deserializes a message object of type '<CustomMessage>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomMessage>)))
  "Returns string type for a message object of type '<CustomMessage>"
  "alpha1/CustomMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomMessage)))
  "Returns string type for a message object of type 'CustomMessage"
  "alpha1/CustomMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomMessage>)))
  "Returns md5sum for a message object of type '<CustomMessage>"
  "d8525a085116cba018593b4c7c160cc7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomMessage)))
  "Returns md5sum for a message object of type 'CustomMessage"
  "d8525a085116cba018593b4c7c160cc7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomMessage>)))
  "Returns full string definition for message of type '<CustomMessage>"
  (cl:format cl:nil "uint64 id~%string message~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomMessage)))
  "Returns full string definition for message of type 'CustomMessage"
  (cl:format cl:nil "uint64 id~%string message~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomMessage>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomMessage
    (cl:cons ':id (id msg))
    (cl:cons ':message (message msg))
))
