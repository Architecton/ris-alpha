; Auto-generated. Do not edit!


(cl:in-package task3-msg)


;//! \htmlinclude CylinderImageFeedback.msg.html

(cl:defclass <CylinderImageFeedback> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0)
   (center_x
    :reader center_x
    :initarg :center_x
    :type cl:integer
    :initform 0)
   (center_y
    :reader center_y
    :initarg :center_y
    :type cl:integer
    :initform 0)
   (minor_axis
    :reader minor_axis
    :initarg :minor_axis
    :type cl:integer
    :initform 0)
   (major_axis
    :reader major_axis
    :initarg :major_axis
    :type cl:integer
    :initform 0)
   (dpt
    :reader dpt
    :initarg :dpt
    :type cl:float
    :initform 0.0))
)

(cl:defclass CylinderImageFeedback (<CylinderImageFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CylinderImageFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CylinderImageFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-msg:<CylinderImageFeedback> is deprecated: use task3-msg:CylinderImageFeedback instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <CylinderImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:timestamp-val is deprecated.  Use task3-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'center_x-val :lambda-list '(m))
(cl:defmethod center_x-val ((m <CylinderImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:center_x-val is deprecated.  Use task3-msg:center_x instead.")
  (center_x m))

(cl:ensure-generic-function 'center_y-val :lambda-list '(m))
(cl:defmethod center_y-val ((m <CylinderImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:center_y-val is deprecated.  Use task3-msg:center_y instead.")
  (center_y m))

(cl:ensure-generic-function 'minor_axis-val :lambda-list '(m))
(cl:defmethod minor_axis-val ((m <CylinderImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:minor_axis-val is deprecated.  Use task3-msg:minor_axis instead.")
  (minor_axis m))

(cl:ensure-generic-function 'major_axis-val :lambda-list '(m))
(cl:defmethod major_axis-val ((m <CylinderImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:major_axis-val is deprecated.  Use task3-msg:major_axis instead.")
  (major_axis m))

(cl:ensure-generic-function 'dpt-val :lambda-list '(m))
(cl:defmethod dpt-val ((m <CylinderImageFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:dpt-val is deprecated.  Use task3-msg:dpt instead.")
  (dpt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CylinderImageFeedback>) ostream)
  "Serializes a message object of type '<CylinderImageFeedback>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'timestamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'timestamp) (cl:floor (cl:slot-value msg 'timestamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
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
  (cl:let* ((signed (cl:slot-value msg 'minor_axis)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'major_axis)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dpt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CylinderImageFeedback>) istream)
  "Deserializes a message object of type '<CylinderImageFeedback>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'minor_axis) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'major_axis) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dpt) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CylinderImageFeedback>)))
  "Returns string type for a message object of type '<CylinderImageFeedback>"
  "task3/CylinderImageFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CylinderImageFeedback)))
  "Returns string type for a message object of type 'CylinderImageFeedback"
  "task3/CylinderImageFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CylinderImageFeedback>)))
  "Returns md5sum for a message object of type '<CylinderImageFeedback>"
  "48f6d07ab2de708512ad475e0ac59310")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CylinderImageFeedback)))
  "Returns md5sum for a message object of type 'CylinderImageFeedback"
  "48f6d07ab2de708512ad475e0ac59310")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CylinderImageFeedback>)))
  "Returns full string definition for message of type '<CylinderImageFeedback>"
  (cl:format cl:nil "time timestamp~%int32 center_x~%int32 center_y~%int32 minor_axis~%int32 major_axis~%float32 dpt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CylinderImageFeedback)))
  "Returns full string definition for message of type 'CylinderImageFeedback"
  (cl:format cl:nil "time timestamp~%int32 center_x~%int32 center_y~%int32 minor_axis~%int32 major_axis~%float32 dpt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CylinderImageFeedback>))
  (cl:+ 0
     8
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CylinderImageFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'CylinderImageFeedback
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':center_x (center_x msg))
    (cl:cons ':center_y (center_y msg))
    (cl:cons ':minor_axis (minor_axis msg))
    (cl:cons ':major_axis (major_axis msg))
    (cl:cons ':dpt (dpt msg))
))
