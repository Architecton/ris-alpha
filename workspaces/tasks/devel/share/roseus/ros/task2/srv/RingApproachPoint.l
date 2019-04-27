;; Auto-generated. Do not edit!


(when (boundp 'task2::RingApproachPoint)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'RingApproachPoint (find-package "TASK2")))
(unless (find-package "TASK2::RINGAPPROACHPOINT")
  (make-package "TASK2::RINGAPPROACHPOINT"))
(unless (find-package "TASK2::RINGAPPROACHPOINTREQUEST")
  (make-package "TASK2::RINGAPPROACHPOINTREQUEST"))
(unless (find-package "TASK2::RINGAPPROACHPOINTRESPONSE")
  (make-package "TASK2::RINGAPPROACHPOINTRESPONSE"))

(in-package "ROS")





(defclass task2::RingApproachPointRequest
  :super ros::object
  :slots (_input_x _input_y ))

(defmethod task2::RingApproachPointRequest
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

(defclass task2::RingApproachPointResponse
  :super ros::object
  :slots (_output_x _output_y _output_z _output_w ))

(defmethod task2::RingApproachPointResponse
  (:init
   (&key
    ((:output_x __output_x) 0.0)
    ((:output_y __output_y) 0.0)
    ((:output_z __output_z) 0.0)
    ((:output_w __output_w) 0.0)
    )
   (send-super :init)
   (setq _output_x (float __output_x))
   (setq _output_y (float __output_y))
   (setq _output_z (float __output_z))
   (setq _output_w (float __output_w))
   self)
  (:output_x
   (&optional __output_x)
   (if __output_x (setq _output_x __output_x)) _output_x)
  (:output_y
   (&optional __output_y)
   (if __output_y (setq _output_y __output_y)) _output_y)
  (:output_z
   (&optional __output_z)
   (if __output_z (setq _output_z __output_z)) _output_z)
  (:output_w
   (&optional __output_w)
   (if __output_w (setq _output_w __output_w)) _output_w)
  (:serialization-length
   ()
   (+
    ;; float64 _output_x
    8
    ;; float64 _output_y
    8
    ;; float64 _output_z
    8
    ;; float64 _output_w
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
     ;; float64 _output_z
       (sys::poke _output_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _output_w
       (sys::poke _output_w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _output_x
     (setq _output_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _output_y
     (setq _output_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _output_z
     (setq _output_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _output_w
     (setq _output_w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass task2::RingApproachPoint
  :super ros::object
  :slots ())

(setf (get task2::RingApproachPoint :md5sum-) "a0a873596cba774a4f04b2ea2ebf3221")
(setf (get task2::RingApproachPoint :datatype-) "task2/RingApproachPoint")
(setf (get task2::RingApproachPoint :request) task2::RingApproachPointRequest)
(setf (get task2::RingApproachPoint :response) task2::RingApproachPointResponse)

(defmethod task2::RingApproachPointRequest
  (:response () (instance task2::RingApproachPointResponse :init)))

(setf (get task2::RingApproachPointRequest :md5sum-) "a0a873596cba774a4f04b2ea2ebf3221")
(setf (get task2::RingApproachPointRequest :datatype-) "task2/RingApproachPointRequest")
(setf (get task2::RingApproachPointRequest :definition-)
      "float64 input_x
float64 input_y
---
float64 output_x
float64 output_y
float64 output_z
float64 output_w
")

(setf (get task2::RingApproachPointResponse :md5sum-) "a0a873596cba774a4f04b2ea2ebf3221")
(setf (get task2::RingApproachPointResponse :datatype-) "task2/RingApproachPointResponse")
(setf (get task2::RingApproachPointResponse :definition-)
      "float64 input_x
float64 input_y
---
float64 output_x
float64 output_y
float64 output_z
float64 output_w
")



(provide :task2/RingApproachPoint "a0a873596cba774a4f04b2ea2ebf3221")


