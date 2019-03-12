; Auto-generated. Do not edit!


(cl:in-package alpha2-srv)


;//! \htmlinclude TurtleManager-request.msg.html

(cl:defclass <TurtleManager-request> (roslisp-msg-protocol:ros-message)
  ((trajection
    :reader trajection
    :initarg :trajection
    :type cl:string
    :initform "")
   (duration
    :reader duration
    :initarg :duration
    :type cl:integer
    :initform 0))
)

(cl:defclass TurtleManager-request (<TurtleManager-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleManager-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleManager-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alpha2-srv:<TurtleManager-request> is deprecated: use alpha2-srv:TurtleManager-request instead.")))

(cl:ensure-generic-function 'trajection-val :lambda-list '(m))
(cl:defmethod trajection-val ((m <TurtleManager-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha2-srv:trajection-val is deprecated.  Use alpha2-srv:trajection instead.")
  (trajection m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <TurtleManager-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha2-srv:duration-val is deprecated.  Use alpha2-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleManager-request>) ostream)
  "Serializes a message object of type '<TurtleManager-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trajection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trajection))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'duration)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleManager-request>) istream)
  "Deserializes a message object of type '<TurtleManager-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trajection) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trajection) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'duration)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleManager-request>)))
  "Returns string type for a service object of type '<TurtleManager-request>"
  "alpha2/TurtleManagerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleManager-request)))
  "Returns string type for a service object of type 'TurtleManager-request"
  "alpha2/TurtleManagerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleManager-request>)))
  "Returns md5sum for a message object of type '<TurtleManager-request>"
  "c4a7b5d4e57b122dab2b47a5dca00961")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleManager-request)))
  "Returns md5sum for a message object of type 'TurtleManager-request"
  "c4a7b5d4e57b122dab2b47a5dca00961")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleManager-request>)))
  "Returns full string definition for message of type '<TurtleManager-request>"
  (cl:format cl:nil "string trajection~%uint64 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleManager-request)))
  "Returns full string definition for message of type 'TurtleManager-request"
  (cl:format cl:nil "string trajection~%uint64 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleManager-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'trajection))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleManager-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleManager-request
    (cl:cons ':trajection (trajection msg))
    (cl:cons ':duration (duration msg))
))
;//! \htmlinclude TurtleManager-response.msg.html

(cl:defclass <TurtleManager-response> (roslisp-msg-protocol:ros-message)
  ((lastmovement
    :reader lastmovement
    :initarg :lastmovement
    :type cl:string
    :initform ""))
)

(cl:defclass TurtleManager-response (<TurtleManager-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleManager-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleManager-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alpha2-srv:<TurtleManager-response> is deprecated: use alpha2-srv:TurtleManager-response instead.")))

(cl:ensure-generic-function 'lastmovement-val :lambda-list '(m))
(cl:defmethod lastmovement-val ((m <TurtleManager-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alpha2-srv:lastmovement-val is deprecated.  Use alpha2-srv:lastmovement instead.")
  (lastmovement m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleManager-response>) ostream)
  "Serializes a message object of type '<TurtleManager-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'lastmovement))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'lastmovement))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleManager-response>) istream)
  "Deserializes a message object of type '<TurtleManager-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lastmovement) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'lastmovement) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleManager-response>)))
  "Returns string type for a service object of type '<TurtleManager-response>"
  "alpha2/TurtleManagerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleManager-response)))
  "Returns string type for a service object of type 'TurtleManager-response"
  "alpha2/TurtleManagerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleManager-response>)))
  "Returns md5sum for a message object of type '<TurtleManager-response>"
  "c4a7b5d4e57b122dab2b47a5dca00961")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleManager-response)))
  "Returns md5sum for a message object of type 'TurtleManager-response"
  "c4a7b5d4e57b122dab2b47a5dca00961")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleManager-response>)))
  "Returns full string definition for message of type '<TurtleManager-response>"
  (cl:format cl:nil "string lastmovement~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleManager-response)))
  "Returns full string definition for message of type 'TurtleManager-response"
  (cl:format cl:nil "string lastmovement~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleManager-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'lastmovement))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleManager-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleManager-response
    (cl:cons ':lastmovement (lastmovement msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TurtleManager)))
  'TurtleManager-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TurtleManager)))
  'TurtleManager-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleManager)))
  "Returns string type for a service object of type '<TurtleManager>"
  "alpha2/TurtleManager")