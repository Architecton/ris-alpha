;; Auto-generated. Do not edit!


(when (boundp 'task3::EllipseImageFeedback)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'EllipseImageFeedback (find-package "TASK3")))
(unless (find-package "TASK3::ELLIPSEIMAGEFEEDBACK")
  (make-package "TASK3::ELLIPSEIMAGEFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude EllipseImageFeedback.msg.html


(defclass task3::EllipseImageFeedback
  :super ros::object
  :slots (_timestamp _center_x _center_y _minor_axis _major_axis _dpt ))

(defmethod task3::EllipseImageFeedback
  (:init
   (&key
    ((:timestamp __timestamp) (instance ros::time :init))
    ((:center_x __center_x) 0)
    ((:center_y __center_y) 0)
    ((:minor_axis __minor_axis) 0)
    ((:major_axis __major_axis) 0)
    ((:dpt __dpt) 0.0)
    )
   (send-super :init)
   (setq _timestamp __timestamp)
   (setq _center_x (round __center_x))
   (setq _center_y (round __center_y))
   (setq _minor_axis (round __minor_axis))
   (setq _major_axis (round __major_axis))
   (setq _dpt (float __dpt))
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
  (:dpt
   (&optional __dpt)
   (if __dpt (setq _dpt __dpt)) _dpt)
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
    ;; float32 _dpt
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
     ;; float32 _dpt
       (sys::poke _dpt (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _dpt
     (setq _dpt (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get task3::EllipseImageFeedback :md5sum-) "48f6d07ab2de708512ad475e0ac59310")
(setf (get task3::EllipseImageFeedback :datatype-) "task3/EllipseImageFeedback")
(setf (get task3::EllipseImageFeedback :definition-)
      "time timestamp
int32 center_x
int32 center_y
int32 minor_axis
int32 major_axis
float32 dpt

")



(provide :task3/EllipseImageFeedback "48f6d07ab2de708512ad475e0ac59310")


