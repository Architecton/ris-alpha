; Auto-generated. Do not edit!


(cl:in-package task2-srv)


;//! \htmlinclude ColourClassificationSrv-request.msg.html

(cl:defclass <ColourClassificationSrv-request> (roslisp-msg-protocol:ros-message)
  ((features_mat
    :reader features_mat
    :initarg :features_mat
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (num_features
    :reader num_features
    :initarg :num_features
    :type cl:integer
    :initform 0))
)

(cl:defclass ColourClassificationSrv-request (<ColourClassificationSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ColourClassificationSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ColourClassificationSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<ColourClassificationSrv-request> is deprecated: use task2-srv:ColourClassificationSrv-request instead.")))

(cl:ensure-generic-function 'features_mat-val :lambda-list '(m))
(cl:defmethod features_mat-val ((m <ColourClassificationSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:features_mat-val is deprecated.  Use task2-srv:features_mat instead.")
  (features_mat m))

(cl:ensure-generic-function 'num_features-val :lambda-list '(m))
(cl:defmethod num_features-val ((m <ColourClassificationSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:num_features-val is deprecated.  Use task2-srv:num_features instead.")
  (num_features m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ColourClassificationSrv-request>) ostream)
  "Serializes a message object of type '<ColourClassificationSrv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'features_mat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'features_mat))
  (cl:let* ((signed (cl:slot-value msg 'num_features)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ColourClassificationSrv-request>) istream)
  "Deserializes a message object of type '<ColourClassificationSrv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'features_mat) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'features_mat)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_features) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ColourClassificationSrv-request>)))
  "Returns string type for a service object of type '<ColourClassificationSrv-request>"
  "task2/ColourClassificationSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColourClassificationSrv-request)))
  "Returns string type for a service object of type 'ColourClassificationSrv-request"
  "task2/ColourClassificationSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ColourClassificationSrv-request>)))
  "Returns md5sum for a message object of type '<ColourClassificationSrv-request>"
  "caf04d413f9e4daef949309d687bb7a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ColourClassificationSrv-request)))
  "Returns md5sum for a message object of type 'ColourClassificationSrv-request"
  "caf04d413f9e4daef949309d687bb7a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ColourClassificationSrv-request>)))
  "Returns full string definition for message of type '<ColourClassificationSrv-request>"
  (cl:format cl:nil "int64[] features_mat~%int64 num_features~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ColourClassificationSrv-request)))
  "Returns full string definition for message of type 'ColourClassificationSrv-request"
  (cl:format cl:nil "int64[] features_mat~%int64 num_features~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ColourClassificationSrv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'features_mat) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ColourClassificationSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ColourClassificationSrv-request
    (cl:cons ':features_mat (features_mat msg))
    (cl:cons ':num_features (num_features msg))
))
;//! \htmlinclude ColourClassificationSrv-response.msg.html

(cl:defclass <ColourClassificationSrv-response> (roslisp-msg-protocol:ros-message)
  ((res
    :reader res
    :initarg :res
    :type cl:string
    :initform ""))
)

(cl:defclass ColourClassificationSrv-response (<ColourClassificationSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ColourClassificationSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ColourClassificationSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task2-srv:<ColourClassificationSrv-response> is deprecated: use task2-srv:ColourClassificationSrv-response instead.")))

(cl:ensure-generic-function 'res-val :lambda-list '(m))
(cl:defmethod res-val ((m <ColourClassificationSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task2-srv:res-val is deprecated.  Use task2-srv:res instead.")
  (res m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ColourClassificationSrv-response>) ostream)
  "Serializes a message object of type '<ColourClassificationSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'res))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'res))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ColourClassificationSrv-response>) istream)
  "Deserializes a message object of type '<ColourClassificationSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'res) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'res) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ColourClassificationSrv-response>)))
  "Returns string type for a service object of type '<ColourClassificationSrv-response>"
  "task2/ColourClassificationSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColourClassificationSrv-response)))
  "Returns string type for a service object of type 'ColourClassificationSrv-response"
  "task2/ColourClassificationSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ColourClassificationSrv-response>)))
  "Returns md5sum for a message object of type '<ColourClassificationSrv-response>"
  "caf04d413f9e4daef949309d687bb7a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ColourClassificationSrv-response)))
  "Returns md5sum for a message object of type 'ColourClassificationSrv-response"
  "caf04d413f9e4daef949309d687bb7a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ColourClassificationSrv-response>)))
  "Returns full string definition for message of type '<ColourClassificationSrv-response>"
  (cl:format cl:nil "string res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ColourClassificationSrv-response)))
  "Returns full string definition for message of type 'ColourClassificationSrv-response"
  (cl:format cl:nil "string res~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ColourClassificationSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'res))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ColourClassificationSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ColourClassificationSrv-response
    (cl:cons ':res (res msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ColourClassificationSrv)))
  'ColourClassificationSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ColourClassificationSrv)))
  'ColourClassificationSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColourClassificationSrv)))
  "Returns string type for a service object of type '<ColourClassificationSrv>"
  "task2/ColourClassificationSrv")