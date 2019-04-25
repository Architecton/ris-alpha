;; Auto-generated. Do not edit!


(when (boundp 'task2::ValidRegionsMap)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'ValidRegionsMap (find-package "TASK2")))
(unless (find-package "TASK2::VALIDREGIONSMAP")
  (make-package "TASK2::VALIDREGIONSMAP"))
(unless (find-package "TASK2::VALIDREGIONSMAPREQUEST")
  (make-package "TASK2::VALIDREGIONSMAPREQUEST"))
(unless (find-package "TASK2::VALIDREGIONSMAPRESPONSE")
  (make-package "TASK2::VALIDREGIONSMAPRESPONSE"))

(in-package "ROS")





(defclass task2::ValidRegionsMapRequest
  :super ros::object
  :slots (_input_x _input_y ))

(defmethod task2::ValidRegionsMapRequest
  (:init
   (&key
    ((:input_x __input_x) 0.0)
    ((:input_y __input_y) 0.0)
    )
   (send-super :init)
   (setq _input_x (float __input_x))
   (setq _input_y (float __input_y))
   self)
  (:input_x
   (&optional __input_x)
   (if __input_x (setq _input_x __input_x)) _input_x)
  (:input_y
   (&optional __input_y)
   (if __input_y (setq _input_y __input_y)) _input_y)
  (:serialization-length
   ()
   (+
    ;; float64 _input_x
    8
    ;; float64 _input_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _input_x
       (sys::poke _input_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _input_y
       (sys::poke _input_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _input_x
     (setq _input_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _input_y
     (setq _input_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass task2::ValidRegionsMapResponse
  :super ros::object
  :slots (_output_x _output_y ))

(defmethod task2::ValidRegionsMapResponse
  (:init
   (&key
    ((:output_x __output_x) 0.0)
    ((:output_y __output_y) 0.0)
    )
   (send-super :init)
   (setq _output_x (float __output_x))
   (setq _output_y (float __output_y))
   self)
  (:output_x
   (&optional __output_x)
   (if __output_x (setq _output_x __output_x)) _output_x)
  (:output_y
   (&optional __output_y)
   (if __output_y (setq _output_y __output_y)) _output_y)
  (:serialization-length
   ()
   (+
    ;; float64 _output_x
    8
    ;; float64 _output_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _output_x
       (sys::poke _output_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _output_y
       (sys::poke _output_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _output_x
     (setq _output_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _output_y
     (setq _output_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass task2::ValidRegionsMap
  :super ros::object
  :slots ())

(setf (get task2::ValidRegionsMap :md5sum-) "ba554fc9d98703ab25e4d0b10b456967")
(setf (get task2::ValidRegionsMap :datatype-) "task2/ValidRegionsMap")
(setf (get task2::ValidRegionsMap :request) task2::ValidRegionsMapRequest)
(setf (get task2::ValidRegionsMap :response) task2::ValidRegionsMapResponse)

(defmethod task2::ValidRegionsMapRequest
  (:response () (instance task2::ValidRegionsMapResponse :init)))

(setf (get task2::ValidRegionsMapRequest :md5sum-) "ba554fc9d98703ab25e4d0b10b456967")
(setf (get task2::ValidRegionsMapRequest :datatype-) "task2/ValidRegionsMapRequest")
(setf (get task2::ValidRegionsMapRequest :definition-)
      "float64 input_x
float64 input_y
---
float64 output_x
float64 output_y
")

(setf (get task2::ValidRegionsMapResponse :md5sum-) "ba554fc9d98703ab25e4d0b10b456967")
(setf (get task2::ValidRegionsMapResponse :datatype-) "task2/ValidRegionsMapResponse")
(setf (get task2::ValidRegionsMapResponse :definition-)
      "float64 input_x
float64 input_y
---
float64 output_x
float64 output_y
")



(provide :task2/ValidRegionsMap "ba554fc9d98703ab25e4d0b10b456967")

