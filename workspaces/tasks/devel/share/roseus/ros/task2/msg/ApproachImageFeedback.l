;; Auto-generated. Do not edit!


(when (boundp 'task2::ApproachImageFeedback)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'ApproachImageFeedback (find-package "TASK2")))
(unless (find-package "TASK2::APPROACHIMAGEFEEDBACK")
  (make-package "TASK2::APPROACHIMAGEFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude ApproachImageFeedback.msg.html


(defclass task2::ApproachImageFeedback
  :super ros::object
  :slots (_center_x _center_y ))

(defmethod task2::ApproachImageFeedback
  (:init
   (&key
    ((:center_x __center_x) 0)
    ((:center_y __center_y) 0)
    )
   (send-super :init)
   (setq _center_x (round __center_x))
   (setq _center_y (round __center_y))
   self)
  (:center_x
   (&optional __center_x)
   (if __center_x (setq _center_x __center_x)) _center_x)
  (:center_y
   (&optional __center_y)
   (if __center_y (setq _center_y __center_y)) _center_y)
  (:serialization-length
   ()
   (+
    ;; int32 _center_x
    4
    ;; int32 _center_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _center_x
       (write-long _center_x s)
     ;; int32 _center_y
       (write-long _center_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _center_x
     (setq _center_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _center_y
     (setq _center_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get task2::ApproachImageFeedback :md5sum-) "a3d3daadf2714704bb8322e86f0fde87")
(setf (get task2::ApproachImageFeedback :datatype-) "task2/ApproachImageFeedback")
(setf (get task2::ApproachImageFeedback :definition-)
      "#coordinates of the center of the ring
int32 center_x
int32 center_y

")



(provide :task2/ApproachImageFeedback "a3d3daadf2714704bb8322e86f0fde87")


