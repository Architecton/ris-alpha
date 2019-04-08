;; Auto-generated. Do not edit!


(when (boundp 'task2::TerminalApproach)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'TerminalApproach (find-package "TASK2")))
(unless (find-package "TASK2::TERMINALAPPROACH")
  (make-package "TASK2::TERMINALAPPROACH"))
(unless (find-package "TASK2::TERMINALAPPROACHREQUEST")
  (make-package "TASK2::TERMINALAPPROACHREQUEST"))
(unless (find-package "TASK2::TERMINALAPPROACHRESPONSE")
  (make-package "TASK2::TERMINALAPPROACHRESPONSE"))

(in-package "ROS")





(defclass task2::TerminalApproachRequest
  :super ros::object
  :slots (_feedback ))

(defmethod task2::TerminalApproachRequest
  (:init
   (&key
    ((:feedback __feedback) (instance task2::TerminalApproachFeedback :init))
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
    ;; task2/TerminalApproachFeedback _feedback
    (send _feedback :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; task2/TerminalApproachFeedback _feedback
       (send _feedback :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; task2/TerminalApproachFeedback _feedback
     (send _feedback :deserialize buf ptr-) (incf ptr- (send _feedback :serialization-length))
   ;;
   self)
  )

(defclass task2::TerminalApproachResponse
  :super ros::object
  :slots ())

(defmethod task2::TerminalApproachResponse
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

(defclass task2::TerminalApproach
  :super ros::object
  :slots ())

(setf (get task2::TerminalApproach :md5sum-) "fe183daa6c268d4e2a978bceb0e5896f")
(setf (get task2::TerminalApproach :datatype-) "task2/TerminalApproach")
(setf (get task2::TerminalApproach :request) task2::TerminalApproachRequest)
(setf (get task2::TerminalApproach :response) task2::TerminalApproachResponse)

(defmethod task2::TerminalApproachRequest
  (:response () (instance task2::TerminalApproachResponse :init)))

(setf (get task2::TerminalApproachRequest :md5sum-) "fe183daa6c268d4e2a978bceb0e5896f")
(setf (get task2::TerminalApproachRequest :datatype-) "task2/TerminalApproachRequest")
(setf (get task2::TerminalApproachRequest :definition-)
      "TerminalApproachFeedback feedback

================================================================================
MSG: task2/TerminalApproachFeedback
#Center x coordinate of the window representing the area in which to keep the ring center.
int32 target_center_x

#index of the x coordinate of the ring center.
int32 center_x

#side length of the window in which to keep the center of the ellipse.
int32 window_size
---

")

(setf (get task2::TerminalApproachResponse :md5sum-) "fe183daa6c268d4e2a978bceb0e5896f")
(setf (get task2::TerminalApproachResponse :datatype-) "task2/TerminalApproachResponse")
(setf (get task2::TerminalApproachResponse :definition-)
      "TerminalApproachFeedback feedback

================================================================================
MSG: task2/TerminalApproachFeedback
#Center x coordinate of the window representing the area in which to keep the ring center.
int32 target_center_x

#index of the x coordinate of the ring center.
int32 center_x

#side length of the window in which to keep the center of the ellipse.
int32 window_size
---

")



(provide :task2/TerminalApproach "fe183daa6c268d4e2a978bceb0e5896f")


