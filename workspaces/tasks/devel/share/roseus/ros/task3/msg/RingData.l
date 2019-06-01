;; Auto-generated. Do not edit!


(when (boundp 'task3::RingData)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'RingData (find-package "TASK3")))
(unless (find-package "TASK3::RINGDATA")
  (make-package "TASK3::RINGDATA"))

(in-package "ROS")
;;//! \htmlinclude RingData.msg.html


(defclass task3::RingData
  :super ros::object
  :slots (_center_x _center_y _rad _im ))

(defmethod task3::RingData
  (:init
   (&key
    ((:center_x __center_x) 0)
    ((:center_y __center_y) 0)
    ((:rad __rad) 0)
    ((:im __im) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _center_x (round __center_x))
   (setq _center_y (round __center_y))
   (setq _rad (round __rad))
   (setq _im __im)
   self)
  (:center_x
   (&optional __center_x)
   (if __center_x (setq _center_x __center_x)) _center_x)
  (:center_y
   (&optional __center_y)
   (if __center_y (setq _center_y __center_y)) _center_y)
  (:rad
   (&optional __rad)
   (if __rad (setq _rad __rad)) _rad)
  (:im
   (&optional __im)
   (if __im (setq _im __im)) _im)
  (:serialization-length
   ()
   (+
    ;; uint32 _center_x
    4
    ;; uint32 _center_y
    4
    ;; uint32 _rad
    4
    ;; uint32[] _im
    (* 4    (length _im)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _center_x
       (write-long _center_x s)
     ;; uint32 _center_y
       (write-long _center_y s)
     ;; uint32 _rad
       (write-long _rad s)
     ;; uint32[] _im
     (write-long (length _im) s)
     (dotimes (i (length _im))
       (write-long (elt _im i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _center_x
     (setq _center_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _center_y
     (setq _center_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _rad
     (setq _rad (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32[] _im
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _im (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _im i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get task3::RingData :md5sum-) "46389819cec53f990d59caf4d9e9561f")
(setf (get task3::RingData :datatype-) "task3/RingData")
(setf (get task3::RingData :definition-)
      "uint32 center_x
uint32 center_y
uint32 rad
uint32[] im
")



(provide :task3/RingData "46389819cec53f990d59caf4d9e9561f")


