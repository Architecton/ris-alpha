; Auto-generated. Do not edit!


(cl:in-package task1-msg)


;//! \htmlinclude ScanFlag.msg.html

(cl:defclass <ScanFlag> (roslisp-msg-protocol:ros-message)
  ((flag
    :reader flag
    :initarg :flag
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ScanFlag (<ScanFlag>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScanFlag>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScanFlag)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1-msg:<ScanFlag> is deprecated: use task1-msg:ScanFlag instead.")))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <ScanFlag>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task1-msg:flag-val is deprecated.  Use task1-msg:flag instead.")
  (flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScanFlag>) ostream)
  "Serializes a message object of type '<ScanFlag>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flag)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScanFlag>) istream)
  "Deserializes a message object of type '<ScanFlag>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flag)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScanFlag>)))
  "Returns string type for a message object of type '<ScanFlag>"
  "task1/ScanFlag")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScanFlag)))
  "Returns string type for a message object of type 'ScanFlag"
  "task1/ScanFlag")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScanFlag>)))
  "Returns md5sum for a message object of type '<ScanFlag>"
  "b6a8907dbdc46dea839fb59e243dc983")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScanFlag)))
  "Returns md5sum for a message object of type 'ScanFlag"
  "b6a8907dbdc46dea839fb59e243dc983")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScanFlag>)))
  "Returns full string definition for message of type '<ScanFlag>"
  (cl:format cl:nil "uint8 flag~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScanFlag)))
  "Returns full string definition for message of type 'ScanFlag"
  (cl:format cl:nil "uint8 flag~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScanFlag>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScanFlag>))
  "Converts a ROS message object to a list"
  (cl:list 'ScanFlag
    (cl:cons ':flag (flag msg))
))
