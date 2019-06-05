;; Auto-generated. Do not edit!


(when (boundp 'task3::TreasureLocatorResponse)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'TreasureLocatorResponse (find-package "TASK3")))
(unless (find-package "TASK3::TREASURELOCATORRESPONSE")
  (make-package "TASK3::TREASURELOCATORRESPONSE"))

(in-package "ROS")
;;//! \htmlinclude TreasureLocatorResponse.msg.html


(defclass task3::TreasureLocatorResponse
  :super ros::object
  :slots (_treasure_x _treasure_y ))

(defmethod task3::TreasureLocatorResponse
  (:init
   (&key
    ((:treasure_x __treasure_x) 0.0)
    ((:treasure_y __treasure_y) 0.0)
    )
   (send-super :init)
   (setq _treasure_x (float __treasure_x))
   (setq _treasure_y (float __treasure_y))
   self)
  (:treasure_x
   (&optional __treasure_x)
   (if __treasure_x (setq _treasure_x __treasure_x)) _treasure_x)
  (:treasure_y
   (&optional __treasure_y)
   (if __treasure_y (setq _treasure_y __treasure_y)) _treasure_y)
  (:serialization-length
   ()
   (+
    ;; float64 _treasure_x
    8
    ;; float64 _treasure_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _treasure_x
       (sys::poke _treasure_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _treasure_y
       (sys::poke _treasure_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _treasure_x
     (setq _treasure_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _treasure_y
     (setq _treasure_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get task3::TreasureLocatorResponse :md5sum-) "35a8c353b62fb549dc16741d0d6d9d13")
(setf (get task3::TreasureLocatorResponse :datatype-) "task3/TreasureLocatorResponse")
(setf (get task3::TreasureLocatorResponse :definition-)
      "float64 treasure_x
float64 treasure_y
")



(provide :task3/TreasureLocatorResponse "35a8c353b62fb549dc16741d0d6d9d13")


