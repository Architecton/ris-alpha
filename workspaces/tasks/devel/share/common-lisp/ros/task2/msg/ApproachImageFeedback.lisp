; Auto-generated. Do not edit!


(cl:in-package task2-msg)


;//! \htmlinclude ApproachImageFeedback.msg.html

(cl:defclass <ApproachImageFeedback> (roslisp-msg-protocol:ros-message)
  ((center_x
    :reader center_x
    :initarg :center_x
    :type cl:integer
    :initform 0)
   (center_y
    :reader center_y
    :initarg :center_y
    :type cl:integer
    :initform 0))
)

(cl:defclass ApproachImageFeedback (<ApproachImageFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ApproachImageFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ApproachImageFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-msg:<ApproachImageFeedback> is deprecated: use task2-msg:ApproachImageFeedback instead.")))

(cl:ensure-generic-function 'center_x-val :lambda-list '(m))
(cl:defmethod center_x-val ((m <ApproachImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:center_x-val is deprecated.  Use task2-msg:center_x instead.")
  (center_x m))

(cl:ensure-generic-function 'center_y-val :lambda-list '(m))
(cl:defmethod center_y-val ((m <ApproachImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:center_y-val is deprecated.  Use task2-msg:center_y instead.")
  (center_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ApproachImageFeedback>) ostream)
  "Serializes a message object of type '<ApproachImageFeedback>"
  (cl:let* ((signed (cl:slot-value msg 'center_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'center_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ApproachImageFeedback>) istream)
  "Deserializes a message object of type '<ApproachImageFeedback>"
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
      (cl:setf (cl:slot-value msg 'center_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ApproachImageFeedback>)))
  "Returns string type for a message object of type '<ApproachImageFeedback>"
  "task2/ApproachImageFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ApproachImageFeedback)))
  "Returns string type for a message object of type 'ApproachImageFeedback"
  "task2/ApproachImageFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ApproachImageFeedback>)))
  "Returns md5sum for a message object of type '<ApproachImageFeedback>"
  "a3d3daadf2714704bb8322e86f0fde87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ApproachImageFeedback)))
  "Returns md5sum for a message object of type 'ApproachImageFeedback"
  "a3d3daadf2714704bb8322e86f0fde87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ApproachImageFeedback>)))
  "Returns full string definition for message of type '<ApproachImageFeedback>"
  (cl:format cl:nil "#coordinates of the center of the ring~%int32 center_x~%int32 center_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ApproachImageFeedback)))
  "Returns full string definition for message of type 'ApproachImageFeedback"
  (cl:format cl:nil "#coordinates of the center of the ring~%int32 center_x~%int32 center_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ApproachImageFeedback>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ApproachImageFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'ApproachImageFeedback
    (cl:cons ':center_x (center_x msg))
    (cl:cons ':center_y (center_y msg))
))
