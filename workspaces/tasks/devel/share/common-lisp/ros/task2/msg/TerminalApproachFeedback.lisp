; Auto-generated. Do not edit!


(cl:in-package task2-msg)


;//! \htmlinclude TerminalApproachFeedback.msg.html

(cl:defclass <TerminalApproachFeedback> (roslisp-msg-protocol:ros-message)
  ((target_center_x
    :reader target_center_x
    :initarg :target_center_x
    :type cl:integer
    :initform 0)
   (center_x
    :reader center_x
    :initarg :center_x
    :type cl:integer
    :initform 0)
   (window_size
    :reader window_size
    :initarg :window_size
    :type cl:integer
    :initform 0))
)

(cl:defclass TerminalApproachFeedback (<TerminalApproachFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TerminalApproachFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TerminalApproachFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-msg:<TerminalApproachFeedback> is deprecated: use task2-msg:TerminalApproachFeedback instead.")))

(cl:ensure-generic-function 'target_center_x-val :lambda-list '(m))
(cl:defmethod target_center_x-val ((m <TerminalApproachFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:target_center_x-val is deprecated.  Use task2-msg:target_center_x instead.")
  (target_center_x m))

(cl:ensure-generic-function 'center_x-val :lambda-list '(m))
(cl:defmethod center_x-val ((m <TerminalApproachFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:center_x-val is deprecated.  Use task2-msg:center_x instead.")
  (center_x m))

(cl:ensure-generic-function 'window_size-val :lambda-list '(m))
(cl:defmethod window_size-val ((m <TerminalApproachFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:window_size-val is deprecated.  Use task2-msg:window_size instead.")
  (window_size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TerminalApproachFeedback>) ostream)
  "Serializes a message object of type '<TerminalApproachFeedback>"
  (cl:let* ((signed (cl:slot-value msg 'target_center_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'center_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'window_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TerminalApproachFeedback>) istream)
  "Deserializes a message object of type '<TerminalApproachFeedback>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target_center_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'center_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'window_size) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TerminalApproachFeedback>)))
  "Returns string type for a message object of type '<TerminalApproachFeedback>"
  "task2/TerminalApproachFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TerminalApproachFeedback)))
  "Returns string type for a message object of type 'TerminalApproachFeedback"
  "task2/TerminalApproachFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TerminalApproachFeedback>)))
  "Returns md5sum for a message object of type '<TerminalApproachFeedback>"
  "8251b1bb88dbf79ef5ad5d622a580458")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TerminalApproachFeedback)))
  "Returns md5sum for a message object of type 'TerminalApproachFeedback"
  "8251b1bb88dbf79ef5ad5d622a580458")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TerminalApproachFeedback>)))
  "Returns full string definition for message of type '<TerminalApproachFeedback>"
  (cl:format cl:nil "#Center x coordinate of the window representing the area in which to keep the ring center.~%int32 target_center_x~%~%#index of the x coordinate of the ring center.~%int32 center_x~%~%#side length of the window in which to keep the center of the ellipse.~%int32 window_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TerminalApproachFeedback)))
  "Returns full string definition for message of type 'TerminalApproachFeedback"
  (cl:format cl:nil "#Center x coordinate of the window representing the area in which to keep the ring center.~%int32 target_center_x~%~%#index of the x coordinate of the ring center.~%int32 center_x~%~%#side length of the window in which to keep the center of the ellipse.~%int32 window_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TerminalApproachFeedback>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TerminalApproachFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'TerminalApproachFeedback
    (cl:cons ':target_center_x (target_center_x msg))
    (cl:cons ':center_x (center_x msg))
    (cl:cons ':window_size (window_size msg))
))
