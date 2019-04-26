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
  :slots (_timestamp _center_x _center_y _minor_axis _major_axis ))

(defmethod task2::ApproachImageFeedback
  (:init
   (&key
    ((:timestamp __timestamp) (instance ros::time :init))
    ((:center_x __center_x) 0)
    ((:center_y __center_y) 0)
    ((:minor_axis __minor_axis) 0)
    ((:major_axis __major_axis) 0)
    )
   (send-super :init)
   (setq _timestamp __timestamp)
   (setq _center_x (round __center_x))
   (setq _center_y (round __center_y))
   (setq _minor_axis (round __minor_axis))
   (setq _major_axis (round __major_axis))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:center_x
   (&optional __center_x)
   (if __center_x (setq _center_x __center_x)) _center_x)
  (:center_y
   (&optional __center_y)
   (if __center_y (setq _center_y __center_y)) _center_y)
  (:minor_axis
   (&optional __minor_axis)
   (if __minor_axis (setq _minor_axis __minor_axis)) _minor_axis)
  (:major_axis
   (&optional __major_axis)
   (if __major_axis (setq _major_axis __major_axis)) _major_axis)
  (:serialization-length
   ()
   (+
    ;; time _timestamp
    8
    ;; int32 _center_x
    4
    ;; int32 _center_y
    4
    ;; int32 _minor_axis
    4
    ;; int32 _major_axis
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _timestamp
       (write-long (send _timestamp :sec) s) (write-long (send _timestamp :nsec) s)
     ;; int32 _center_x
       (write-long _center_x s)
     ;; int32 _center_y
       (write-long _center_y s)
     ;; int32 _minor_axis
       (write-long _minor_axis s)
     ;; int32 _major_axis
       (write-long _major_axis s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _timestamp
     (send _timestamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _timestamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _center_x
     (setq _center_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _center_y
     (setq _center_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _minor_axis
     (setq _minor_axis (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _major_axis
     (setq _major_axis (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get task2::ApproachImageFeedback :md5sum-) "9f0d914c11b2e37db5f51064189d6c63")
(setf (get task2::ApproachImageFeedback :datatype-) "task2/ApproachImageFeedback")
(setf (get task2::ApproachImageFeedback :definition-)
      "#coordinates of the center of the ring
time timestamp
int32 center_x
int32 center_y
int32 minor_axis
int32 major_axis

")



(provide :task2/ApproachImageFeedback "9f0d914c11b2e37db5f51064189d6c63")


