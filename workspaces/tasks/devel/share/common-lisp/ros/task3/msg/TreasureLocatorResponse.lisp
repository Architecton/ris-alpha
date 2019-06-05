; Auto-generated. Do not edit!


(cl:in-package task3-msg)


;//! \htmlinclude TreasureLocatorResponse.msg.html

(cl:defclass <TreasureLocatorResponse> (roslisp-msg-protocol:ros-message)
  ((treasure_x
    :reader treasure_x
    :initarg :treasure_x
    :type cl:float
    :initform 0.0)
   (treasure_y
    :reader treasure_y
    :initarg :treasure_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass TreasureLocatorResponse (<TreasureLocatorResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TreasureLocatorResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TreasureLocatorResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-msg:<TreasureLocatorResponse> is deprecated: use task3-msg:TreasureLocatorResponse instead.")))

(cl:ensure-generic-function 'treasure_x-val :lambda-list '(m))
(cl:defmethod treasure_x-val ((m <TreasureLocatorResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:treasure_x-val is deprecated.  Use task3-msg:treasure_x instead.")
  (treasure_x m))

(cl:ensure-generic-function 'treasure_y-val :lambda-list '(m))
(cl:defmethod treasure_y-val ((m <TreasureLocatorResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:treasure_y-val is deprecated.  Use task3-msg:treasure_y instead.")
  (treasure_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TreasureLocatorResponse>) ostream)
  "Serializes a message object of type '<TreasureLocatorResponse>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'treasure_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'treasure_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TreasureLocatorResponse>) istream)
  "Deserializes a message object of type '<TreasureLocatorResponse>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'treasure_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'treasure_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TreasureLocatorResponse>)))
  "Returns string type for a message object of type '<TreasureLocatorResponse>"
  "task3/TreasureLocatorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TreasureLocatorResponse)))
  "Returns string type for a message object of type 'TreasureLocatorResponse"
  "task3/TreasureLocatorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TreasureLocatorResponse>)))
  "Returns md5sum for a message object of type '<TreasureLocatorResponse>"
  "35a8c353b62fb549dc16741d0d6d9d13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TreasureLocatorResponse)))
  "Returns md5sum for a message object of type 'TreasureLocatorResponse"
  "35a8c353b62fb549dc16741d0d6d9d13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TreasureLocatorResponse>)))
  "Returns full string definition for message of type '<TreasureLocatorResponse>"
  (cl:format cl:nil "float64 treasure_x~%float64 treasure_y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TreasureLocatorResponse)))
  "Returns full string definition for message of type 'TreasureLocatorResponse"
  (cl:format cl:nil "float64 treasure_x~%float64 treasure_y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TreasureLocatorResponse>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TreasureLocatorResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'TreasureLocatorResponse
    (cl:cons ':treasure_x (treasure_x msg))
    (cl:cons ':treasure_y (treasure_y msg))
))
