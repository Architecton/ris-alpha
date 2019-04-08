;; Auto-generated. Do not edit!


(when (boundp 'task2::TerminalApproachFeedback)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'TerminalApproachFeedback (find-package "TASK2")))
(unless (find-package "TASK2::TERMINALAPPROACHFEEDBACK")
  (make-package "TASK2::TERMINALAPPROACHFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude TerminalApproachFeedback.msg.html


(defclass task2::TerminalApproachFeedback
  :super ros::object
  :slots (_target_center_x _center_x _window_size ))

(defmethod task2::TerminalApproachFeedback
  (:init
   (&key
    ((:target_center_x __target_center_x) 0)
    ((:center_x __center_x) 0)
    ((:window_size __window_size) 0)
    )
   (send-super :init)
   (setq _target_center_x (round __target_center_x))
   (setq _center_x (round __center_x))
   (setq _window_size (round __window_size))
   self)
  (:target_center_x
   (&optional __target_center_x)
   (if __target_center_x (setq _target_center_x __target_center_x)) _target_center_x)
  (:center_x
   (&optional __center_x)
   (if __center_x (setq _center_x __center_x)) _center_x)
  (:window_size
   (&optional __window_size)
   (if __window_size (setq _window_size __window_size)) _window_size)
  (:serialization-length
   ()
   (+
    ;; int32 _target_center_x
    4
    ;; int32 _center_x
    4
    ;; int32 _window_size
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _target_center_x
       (write-long _target_center_x s)
     ;; int32 _center_x
       (write-long _center_x s)
     ;; int32 _window_size
       (write-long _window_size s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _target_center_x
     (setq _target_center_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _center_x
     (setq _center_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _window_size
     (setq _window_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get task2::TerminalApproachFeedback :md5sum-) "8251b1bb88dbf79ef5ad5d622a580458")
(setf (get task2::TerminalApproachFeedback :datatype-) "task2/TerminalApproachFeedback")
(setf (get task2::TerminalApproachFeedback :definition-)
      "#Center x coordinate of the window representing the area in which to keep the ring center.
int32 target_center_x

#index of the x coordinate of the ring center.
int32 center_x

#side length of the window in which to keep the center of the ellipse.
int32 window_size

")



(provide :task2/TerminalApproachFeedback "8251b1bb88dbf79ef5ad5d622a580458")


