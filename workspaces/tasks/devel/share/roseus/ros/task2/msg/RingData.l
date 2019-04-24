;; Auto-generated. Do not edit!


(when (boundp 'task2::RingData)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'RingData (find-package "TASK2")))
(unless (find-package "TASK2::RINGDATA")
  (make-package "TASK2::RINGDATA"))

(in-package "ROS")
;;//! \htmlinclude RingData.msg.html


(defclass task2::RingData
  :super ros::object
  :slots (_center_x _center_y _rad _im ))

(defmethod task2::RingData
  (:init
   (&key
    ((:center_x __center_x) 0)
    ((:center_y __center_y) 0)
    ((:rad __rad) 0)
    ((:im __im) (make-array 0 :initial-element 0 :element-type :char))
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
    ;; int32 _center_x
    4
    ;; int32 _center_y
    4
    ;; int32 _rad
    4
    ;; uint8[] _im
    (* 1    (length _im)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _center_x
       (write-long _center_x s)
     ;; int32 _center_y
       (write-long _center_y s)
     ;; int32 _rad
       (write-long _rad s)
     ;; uint8[] _im
     (write-long (length _im) s)
     (princ _im s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _center_x
     (setq _center_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _center_y
     (setq _center_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rad
     (setq _rad (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _im
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _im (make-array n :element-type :char))
     (replace _im buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get task2::RingData :md5sum-) "b518b5d90f383e720d8073f3b71cedb3")
(setf (get task2::RingData :datatype-) "task2/RingData")
(setf (get task2::RingData :definition-)
      "int32 center_x
int32 center_y
int32 rad
uint8[] im

")



(provide :task2/RingData "b518b5d90f383e720d8073f3b71cedb3")


