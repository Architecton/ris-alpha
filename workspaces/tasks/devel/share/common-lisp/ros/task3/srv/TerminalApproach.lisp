; Auto-generated. Do not edit!


(cl:in-package task3-srv)


;//! \htmlinclude TerminalApproach-request.msg.html

(cl:defclass <TerminalApproach-request> (roslisp-msg-protocol:ros-message)
  ((feedback
    :reader feedback
    :initarg :feedback
    :type task3-msg:TerminalApproachFeedback
    :initform (cl:make-instance 'task3-msg:TerminalApproachFeedback)))
)

(cl:defclass TerminalApproach-request (<TerminalApproach-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TerminalApproach-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TerminalApproach-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<TerminalApproach-request> is deprecated: use task3-srv:TerminalApproach-request instead.")))

(cl:ensure-generic-function 'feedback-val :lambda-list '(m))
(cl:defmethod feedback-val ((m <TerminalApproach-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task3-srv:feedback-val is deprecated.  Use task3-srv:feedback instead.")
  (feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TerminalApproach-request>) ostream)
  "Serializes a message object of type '<TerminalApproach-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TerminalApproach-request>) istream)
  "Deserializes a message object of type '<TerminalApproach-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TerminalApproach-request>)))
  "Returns string type for a service object of type '<TerminalApproach-request>"
  "task3/TerminalApproachRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TerminalApproach-request)))
  "Returns string type for a service object of type 'TerminalApproach-request"
  "task3/TerminalApproachRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TerminalApproach-request>)))
  "Returns md5sum for a message object of type '<TerminalApproach-request>"
  "fe183daa6c268d4e2a978bceb0e5896f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TerminalApproach-request)))
  "Returns md5sum for a message object of type 'TerminalApproach-request"
  "fe183daa6c268d4e2a978bceb0e5896f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TerminalApproach-request>)))
  "Returns full string definition for message of type '<TerminalApproach-request>"
  (cl:format cl:nil "TerminalApproachFeedback feedback~%~%================================================================================~%MSG: task3/TerminalApproachFeedback~%#Center x coordinate of the window representing the area in which to keep the ring center.~%int32 target_center_x~%~%#index of the x coordinate of the ring center.~%int32 center_x~%~%#side length of the window in which to keep the center of the ellipse.~%int32 window_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TerminalApproach-request)))
  "Returns full string definition for message of type 'TerminalApproach-request"
  (cl:format cl:nil "TerminalApproachFeedback feedback~%~%================================================================================~%MSG: task3/TerminalApproachFeedback~%#Center x coordinate of the window representing the area in which to keep the ring center.~%int32 target_center_x~%~%#index of the x coordinate of the ring center.~%int32 center_x~%~%#side length of the window in which to keep the center of the ellipse.~%int32 window_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TerminalApproach-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TerminalApproach-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TerminalApproach-request
    (cl:cons ':feedback (feedback msg))
))
;//! \htmlinclude TerminalApproach-response.msg.html

(cl:defclass <TerminalApproach-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TerminalApproach-response (<TerminalApproach-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TerminalApproach-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TerminalApproach-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task3-srv:<TerminalApproach-response> is deprecated: use task3-srv:TerminalApproach-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TerminalApproach-response>) ostream)
  "Serializes a message object of type '<TerminalApproach-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TerminalApproach-response>) istream)
  "Deserializes a message object of type '<TerminalApproach-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TerminalApproach-response>)))
  "Returns string type for a service object of type '<TerminalApproach-response>"
  "task3/TerminalApproachResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TerminalApproach-response)))
  "Returns string type for a service object of type 'TerminalApproach-response"
  "task3/TerminalApproachResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TerminalApproach-response>)))
  "Returns md5sum for a message object of type '<TerminalApproach-response>"
  "fe183daa6c268d4e2a978bceb0e5896f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TerminalApproach-response)))
  "Returns md5sum for a message object of type 'TerminalApproach-response"
  "fe183daa6c268d4e2a978bceb0e5896f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TerminalApproach-response>)))
  "Returns full string definition for message of type '<TerminalApproach-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TerminalApproach-response)))
  "Returns full string definition for message of type 'TerminalApproach-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TerminalApproach-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TerminalApproach-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TerminalApproach-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TerminalApproach)))
  'TerminalApproach-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TerminalApproach)))
  'TerminalApproach-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TerminalApproach)))
  "Returns string type for a service object of type '<TerminalApproach>"
  "task3/TerminalApproach")