; Auto-generated. Do not edit!


(cl:in-package task1-srv)


;//! \htmlinclude EllipseLocator-request.msg.html

(cl:defclass <EllipseLocator-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass EllipseLocator-request (<EllipseLocator-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EllipseLocator-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EllipseLocator-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1-srv:<EllipseLocator-request> is deprecated: use task1-srv:EllipseLocator-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EllipseLocator-request>) ostream)
  "Serializes a message object of type '<EllipseLocator-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EllipseLocator-request>) istream)
  "Deserializes a message object of type '<EllipseLocator-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EllipseLocator-request>)))
  "Returns string type for a service object of type '<EllipseLocator-request>"
  "task1/EllipseLocatorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EllipseLocator-request)))
  "Returns string type for a service object of type 'EllipseLocator-request"
  "task1/EllipseLocatorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EllipseLocator-request>)))
  "Returns md5sum for a message object of type '<EllipseLocator-request>"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EllipseLocator-request)))
  "Returns md5sum for a message object of type 'EllipseLocator-request"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EllipseLocator-request>)))
  "Returns full string definition for message of type '<EllipseLocator-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EllipseLocator-request)))
  "Returns full string definition for message of type 'EllipseLocator-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EllipseLocator-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EllipseLocator-request>))
  "Converts a ROS message object to a list"
  (cl:list 'EllipseLocator-request
))
;//! \htmlinclude EllipseLocator-response.msg.html

(cl:defclass <EllipseLocator-response> (roslisp-msg-protocol:ros-message)
  ((target
    :reader target
    :initarg :target
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass EllipseLocator-response (<EllipseLocator-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EllipseLocator-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EllipseLocator-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1-srv:<EllipseLocator-response> is deprecated: use task1-srv:EllipseLocator-response instead.")))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <EllipseLocator-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task1-srv:target-val is deprecated.  Use task1-srv:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EllipseLocator-response>) ostream)
  "Serializes a message object of type '<EllipseLocator-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EllipseLocator-response>) istream)
  "Deserializes a message object of type '<EllipseLocator-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EllipseLocator-response>)))
  "Returns string type for a service object of type '<EllipseLocator-response>"
  "task1/EllipseLocatorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EllipseLocator-response)))
  "Returns string type for a service object of type 'EllipseLocator-response"
  "task1/EllipseLocatorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EllipseLocator-response>)))
  "Returns md5sum for a message object of type '<EllipseLocator-response>"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EllipseLocator-response)))
  "Returns md5sum for a message object of type 'EllipseLocator-response"
  "7b497188d656d59d92c0ddf8ac50fe8a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EllipseLocator-response>)))
  "Returns full string definition for message of type '<EllipseLocator-response>"
  (cl:format cl:nil "float64[] target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EllipseLocator-response)))
  "Returns full string definition for message of type 'EllipseLocator-response"
  (cl:format cl:nil "float64[] target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EllipseLocator-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'target) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EllipseLocator-response>))
  "Converts a ROS message object to a list"
  (cl:list 'EllipseLocator-response
    (cl:cons ':target (target msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'EllipseLocator)))
  'EllipseLocator-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'EllipseLocator)))
  'EllipseLocator-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EllipseLocator)))
  "Returns string type for a service object of type '<EllipseLocator>"
  "task1/EllipseLocator")