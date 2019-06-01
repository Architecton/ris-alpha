;; Auto-generated. Do not edit!


(when (boundp 'task3::TerminalApproach)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'TerminalApproach (find-package "TASK3")))
(unless (find-package "TASK3::TERMINALAPPROACH")
  (make-package "TASK3::TERMINALAPPROACH"))
(unless (find-package "TASK3::TERMINALAPPROACHREQUEST")
  (make-package "TASK3::TERMINALAPPROACHREQUEST"))
(unless (find-package "TASK3::TERMINALAPPROACHRESPONSE")
  (make-package "TASK3::TERMINALAPPROACHRESPONSE"))

(in-package "ROS")





(defclass task3::TerminalApproachRequest
  :super ros::object
  :slots (_feedback ))

(defmethod task3::TerminalApproachRequest
  (:init
   (&key
    ((:feedback __feedback) (instance task3::TerminalApproachFeedback :init))
    )
   (send-super :init)
   (setq _feedback __feedback)
   self)
  (:feedback
   (&rest __feedback)
   (if (keywordp (car __feedback))
       (send* _feedback __feedback)
     (progn
       (if __feedback (setq _feedback (car __feedback)))
       _feedback)))
  (:serialization-length
   ()
   (+
    ;; task3/TerminalApproachFeedback _feedback
    (send _feedback :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; task3/TerminalApproachFeedback _feedback
       (send _feedback :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; task3/TerminalApproachFeedback _feedback
     (send _feedback :deserialize buf ptr-) (incf ptr- (send _feedback :serialization-length))
   ;;
   self)
  )

(defclass task3::TerminalApproachResponse
  :super ros::object
  :slots ())

(defmethod task3::TerminalApproachResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass task3::TerminalApproach
  :super ros::object
  :slots ())

(setf (get task3::TerminalApproach :md5sum-) "fe183daa6c268d4e2a978bceb0e5896f")
(setf (get task3::TerminalApproach :datatype-) "task3/TerminalApproach")
(setf (get task3::TerminalApproach :request) task3::TerminalApproachRequest)
(setf (get task3::TerminalApproach :response) task3::TerminalApproachResponse)

(defmethod task3::TerminalApproachRequest
  (:response () (instance task3::TerminalApproachResponse :init)))

(setf (get task3::TerminalApproachRequest :md5sum-) "fe183daa6c268d4e2a978bceb0e5896f")
(setf (get task3::TerminalApproachRequest :datatype-) "task3/TerminalApproachRequest")
(setf (get task3::TerminalApproachRequest :definition-)
      "TerminalApproachFeedback feedback

================================================================================
MSG: task3/TerminalApproachFeedback
#Center x coordinate of the window representing the area in which to keep the ring center.
int32 target_center_x

#index of the x coordinate of the ring center.
int32 center_x

#side length of the window in which to keep the center of the ellipse.
int32 window_size
---

")

(setf (get task3::TerminalApproachResponse :md5sum-) "fe183daa6c268d4e2a978bceb0e5896f")
(setf (get task3::TerminalApproachResponse :datatype-) "task3/TerminalApproachResponse")
(setf (get task3::TerminalApproachResponse :definition-)
      "TerminalApproachFeedback feedback

================================================================================
MSG: task3/TerminalApproachFeedback
#Center x coordinate of the window representing the area in which to keep the ring center.
int32 target_center_x

#index of the x coordinate of the ring center.
int32 center_x

#side length of the window in which to keep the center of the ellipse.
int32 window_size
---

")



(provide :task3/TerminalApproach "fe183daa6c268d4e2a978bceb0e5896f")


