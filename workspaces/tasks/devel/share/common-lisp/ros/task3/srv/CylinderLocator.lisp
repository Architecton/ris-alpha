; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude CylinderLocator-request.msg.html

(cl:defclass <CylinderLocator-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CylinderLocator-request (<CylinderLocator-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CylinderLocator-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CylinderLocator-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<CylinderLocator-request> is deprecated: use task3-srv:CylinderLocator-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CylinderLocator-request>) ostream)
  "Serializes a message object of type '<CylinderLocator-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CylinderLocator-request>) istream)
  "Deserializes a message object of type '<CylinderLocator-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CylinderLocator-request>)))
  "Returns string type for a service object of type '<CylinderLocator-request>"
  "task3/CylinderLocatorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CylinderLocator-request)))
  "Returns string type for a service object of type 'CylinderLocator-request"
  "task3/CylinderLocatorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CylinderLocator-request>)))
  "Returns md5sum for a message object of type '<CylinderLocator-request>"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CylinderLocator-request)))
  "Returns md5sum for a message object of type 'CylinderLocator-request"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CylinderLocator-request>)))
  "Returns full string definition for message of type '<CylinderLocator-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CylinderLocator-request)))
  "Returns full string definition for message of type 'CylinderLocator-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CylinderLocator-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CylinderLocator-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CylinderLocator-request
))
;//! \htmlinclude CylinderLocator-response.msg.html

(cl:defclass <CylinderLocator-response> (roslisp-msg-protocol:ros-message)
  ((target
    :reader target
    :initarg :target
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass CylinderLocator-response (<CylinderLocator-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CylinderLocator-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CylinderLocator-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<CylinderLocator-response> is deprecated: use task3-srv:CylinderLocator-response instead.")))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <CylinderLocator-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:target-val is deprecated.  Use task3-srv:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CylinderLocator-response>) ostream)
  "Serializes a message object of type '<CylinderLocator-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'target))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CylinderLocator-response>) istream)
  "Deserializes a message object of type '<CylinderLocator-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'target) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'target)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CylinderLocator-response>)))
  "Returns string type for a service object of type '<CylinderLocator-response>"
  "task3/CylinderLocatorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CylinderLocator-response)))
  "Returns string type for a service object of type 'CylinderLocator-response"
  "task3/CylinderLocatorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CylinderLocator-response>)))
  "Returns md5sum for a message object of type '<CylinderLocator-response>"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CylinderLocator-response)))
  "Returns md5sum for a message object of type 'CylinderLocator-response"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CylinderLocator-response>)))
  "Returns full string definition for message of type '<CylinderLocator-response>"
  (cl:format cl:nil "float64[] target~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CylinderLocator-response)))
  "Returns full string definition for message of type 'CylinderLocator-response"
  (cl:format cl:nil "float64[] target~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CylinderLocator-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'target) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CylinderLocator-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CylinderLocator-response
    (cl:cons ':target (target msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CylinderLocator)))
  'CylinderLocator-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CylinderLocator)))
  'CylinderLocator-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CylinderLocator)))
  "Returns string type for a service object of type '<CylinderLocator>"
  "task3/CylinderLocator")