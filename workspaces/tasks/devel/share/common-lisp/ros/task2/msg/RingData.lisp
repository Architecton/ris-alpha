; Auto-generated. Do not edit!


(cl:in-package task2-msg)


;//! \htmlinclude RingData.msg.html

(cl:defclass <RingData> (roslisp-msg-protocol:ros-message)
  ((center_x
    :reader center_x
    :initarg :center_x
    :type cl:integer
    :initform 0)
   (center_y
    :reader center_y
    :initarg :center_y
    :type cl:integer
    :initform 0)
   (rad
    :reader rad
    :initarg :rad
    :type cl:integer
    :initform 0)
   (im
    :reader im
    :initarg :im
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass RingData (<RingData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RingData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RingData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-msg:<RingData> is deprecated: use task2-msg:RingData instead.")))

(cl:ensure-generic-function 'center_x-val :lambda-list '(m))
(cl:defmethod center_x-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:center_x-val is deprecated.  Use task2-msg:center_x instead.")
  (center_x m))

(cl:ensure-generic-function 'center_y-val :lambda-list '(m))
(cl:defmethod center_y-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:center_y-val is deprecated.  Use task2-msg:center_y instead.")
  (center_y m))

(cl:ensure-generic-function 'rad-val :lambda-list '(m))
(cl:defmethod rad-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:rad-val is deprecated.  Use task2-msg:rad instead.")
  (rad m))

(cl:ensure-generic-function 'im-val :lambda-list '(m))
(cl:defmethod im-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-msg:im-val is deprecated.  Use task2-msg:im instead.")
  (im m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RingData>) ostream)
  "Serializes a message object of type '<RingData>"
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
  (cl:let* ((signed (cl:slot-value msg 'rad)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'im))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'im))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RingData>) istream)
  "Deserializes a message object of type '<RingData>"
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
      (cl:setf (cl:slot-value msg 'rad) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'im) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'im)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RingData>)))
  "Returns string type for a message object of type '<RingData>"
  "task2/RingData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RingData)))
  "Returns string type for a message object of type 'RingData"
  "task2/RingData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RingData>)))
  "Returns md5sum for a message object of type '<RingData>"
  "b518b5d90f383e720d8073f3b71cedb3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RingData)))
  "Returns md5sum for a message object of type 'RingData"
  "b518b5d90f383e720d8073f3b71cedb3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RingData>)))
  "Returns full string definition for message of type '<RingData>"
  (cl:format cl:nil "int32 center_x~%int32 center_y~%int32 rad~%uint8[] im~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RingData)))
  "Returns full string definition for message of type 'RingData"
  (cl:format cl:nil "int32 center_x~%int32 center_y~%int32 rad~%uint8[] im~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RingData>))
  (cl:+ 0
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'im) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RingData>))
  "Converts a ROS message object to a list"
  (cl:list 'RingData
    (cl:cons ':center_x (center_x msg))
    (cl:cons ':center_y (center_y msg))
    (cl:cons ':rad (rad msg))
    (cl:cons ':im (im msg))
))
