; Auto-generated. Do not edit!


(cl:in-package exercise5-msg)


;//! \htmlinclude EllipseData.msg.html

(cl:defclass <EllipseData> (roslisp-msg-protocol:ros-message)
  ((found
    :reader found
    :initarg :found
    :type cl:fixnum
    :initform 0)
   (dpt
    :reader dpt
    :initarg :dpt
    :type cl:float
    :initform 0.0)
   (agl
    :reader agl
    :initarg :agl
    :type cl:float
    :initform 0.0)
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:float
    :initform 0.0))
)

(cl:defclass EllipseData (<EllipseData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EllipseData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EllipseData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name exercise5-msg:<EllipseData> is deprecated: use exercise5-msg:EllipseData instead.")))

(cl:ensure-generic-function 'found-val :lambda-list '(m))
(cl:defmethod found-val ((m <EllipseData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise5-msg:found-val is deprecated.  Use exercise5-msg:found instead.")
  (found m))

(cl:ensure-generic-function 'dpt-val :lambda-list '(m))
(cl:defmethod dpt-val ((m <EllipseData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise5-msg:dpt-val is deprecated.  Use exercise5-msg:dpt instead.")
  (dpt m))

(cl:ensure-generic-function 'agl-val :lambda-list '(m))
(cl:defmethod agl-val ((m <EllipseData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise5-msg:agl-val is deprecated.  Use exercise5-msg:agl instead.")
  (agl m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <EllipseData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise5-msg:timestamp-val is deprecated.  Use exercise5-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EllipseData>) ostream)
  "Serializes a message object of type '<EllipseData>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'found)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dpt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'agl))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EllipseData>) istream)
  "Deserializes a message object of type '<EllipseData>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'found)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dpt) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'agl) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timestamp) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EllipseData>)))
  "Returns string type for a message object of type '<EllipseData>"
  "exercise5/EllipseData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EllipseData)))
  "Returns string type for a message object of type 'EllipseData"
  "exercise5/EllipseData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EllipseData>)))
  "Returns md5sum for a message object of type '<EllipseData>"
  "36c8d02dac602442e37993aa5885ef00")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EllipseData)))
  "Returns md5sum for a message object of type 'EllipseData"
  "36c8d02dac602442e37993aa5885ef00")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EllipseData>)))
  "Returns full string definition for message of type '<EllipseData>"
  (cl:format cl:nil "#Found flag that takes on values 1 or 0 (ellipse detected or not)~%uint8 found~%~%#Depth value at pixel representing the centre of the found ellipse~%#Contains garbage if found flag value equal to 0~%float64 dpt~%~%#angle_min + index_center*angle_increment~%float64 agl~%~%#result of rospy.Time.now().to_time() when image taken~%float64 timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EllipseData)))
  "Returns full string definition for message of type 'EllipseData"
  (cl:format cl:nil "#Found flag that takes on values 1 or 0 (ellipse detected or not)~%uint8 found~%~%#Depth value at pixel representing the centre of the found ellipse~%#Contains garbage if found flag value equal to 0~%float64 dpt~%~%#angle_min + index_center*angle_increment~%float64 agl~%~%#result of rospy.Time.now().to_time() when image taken~%float64 timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EllipseData>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EllipseData>))
  "Converts a ROS message object to a list"
  (cl:list 'EllipseData
    (cl:cons ':found (found msg))
    (cl:cons ':dpt (dpt msg))
    (cl:cons ':agl (agl msg))
    (cl:cons ':timestamp (timestamp msg))
))
