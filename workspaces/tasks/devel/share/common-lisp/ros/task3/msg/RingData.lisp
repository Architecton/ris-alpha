; Auto-generated. Do not edit!


(cl:in-package task3-msg)


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
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass RingData (<RingData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RingData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RingData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-msg:<RingData> is deprecated: use task3-msg:RingData instead.")))

(cl:ensure-generic-function 'center_x-val :lambda-list '(m))
(cl:defmethod center_x-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:center_x-val is deprecated.  Use task3-msg:center_x instead.")
  (center_x m))

(cl:ensure-generic-function 'center_y-val :lambda-list '(m))
(cl:defmethod center_y-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:center_y-val is deprecated.  Use task3-msg:center_y instead.")
  (center_y m))

(cl:ensure-generic-function 'rad-val :lambda-list '(m))
(cl:defmethod rad-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:rad-val is deprecated.  Use task3-msg:rad instead.")
  (rad m))

(cl:ensure-generic-function 'im-val :lambda-list '(m))
(cl:defmethod im-val ((m <RingData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-msg:im-val is deprecated.  Use task3-msg:im instead.")
  (im m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RingData>) ostream)
  "Serializes a message object of type '<RingData>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'center_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'center_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'center_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'center_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'center_y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'center_y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'center_y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'center_y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rad)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rad)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rad)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rad)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'im))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'im))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RingData>) istream)
  "Deserializes a message object of type '<RingData>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'center_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'center_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'center_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'center_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'center_y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'center_y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'center_y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'center_y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rad)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rad)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rad)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rad)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'im) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'im)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RingData>)))
  "Returns string type for a message object of type '<RingData>"
  "task3/RingData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RingData)))
  "Returns string type for a message object of type 'RingData"
  "task3/RingData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RingData>)))
  "Returns md5sum for a message object of type '<RingData>"
  "46389819cec53f990d59caf4d9e9561f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RingData)))
  "Returns md5sum for a message object of type 'RingData"
  "46389819cec53f990d59caf4d9e9561f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RingData>)))
  "Returns full string definition for message of type '<RingData>"
  (cl:format cl:nil "uint32 center_x~%uint32 center_y~%uint32 rad~%uint32[] im~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RingData)))
  "Returns full string definition for message of type 'RingData"
  (cl:format cl:nil "uint32 center_x~%uint32 center_y~%uint32 rad~%uint32[] im~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RingData>))
  (cl:+ 0
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'im) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RingData>))
  "Converts a ROS message object to a list"
  (cl:list 'RingData
    (cl:cons ':center_x (center_x msg))
    (cl:cons ':center_y (center_y msg))
    (cl:cons ':rad (rad msg))
    (cl:cons ':im (im msg))
))
