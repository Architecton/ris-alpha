;; Auto-generated. Do not edit!


(when (boundp 'task3::CheckpointProcessor)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'CheckpointProcessor (find-package "TASK3")))
(unless (find-package "TASK3::CHECKPOINTPROCESSOR")
  (make-package "TASK3::CHECKPOINTPROCESSOR"))
(unless (find-package "TASK3::CHECKPOINTPROCESSORREQUEST")
  (make-package "TASK3::CHECKPOINTPROCESSORREQUEST"))
(unless (find-package "TASK3::CHECKPOINTPROCESSORRESPONSE")
  (make-package "TASK3::CHECKPOINTPROCESSORRESPONSE"))

(in-package "ROS")





(defclass task3::CheckpointProcessorRequest
  :super ros::object
  :slots (_input_x _input_y ))

(defmethod task3::CheckpointProcessorRequest
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

(defclass task3::CheckpointProcessorResponse
  :super ros::object
  :slots (_output_x _output_y _valid ))

(defmethod task3::CheckpointProcessorResponse
  (:init
   (&key
    ((:output_x __output_x) 0.0)
    ((:output_y __output_y) 0.0)
    ((:valid __valid) nil)
    )
   (send-super :init)
   (setq _output_x (float __output_x))
   (setq _output_y (float __output_y))
   (setq _valid __valid)
   self)
  (:output_x
   (&optional __output_x)
   (if __output_x (setq _output_x __output_x)) _output_x)
  (:output_y
   (&optional __output_y)
   (if __output_y (setq _output_y __output_y)) _output_y)
  (:valid
   (&optional __valid)
   (if __valid (setq _valid __valid)) _valid)
  (:serialization-length
   ()
   (+
    ;; float64 _output_x
    8
    ;; float64 _output_y
    8
    ;; bool _valid
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _output_x
       (sys::poke _output_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _output_y
       (sys::poke _output_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _valid
       (if _valid (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _output_x
     (setq _output_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _output_y
     (setq _output_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _valid
     (setq _valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass task3::CheckpointProcessor
  :super ros::object
  :slots ())

(setf (get task3::CheckpointProcessor :md5sum-) "af3f94b765997022c6ac0867e7797cba")
(setf (get task3::CheckpointProcessor :datatype-) "task3/CheckpointProcessor")
(setf (get task3::CheckpointProcessor :request) task3::CheckpointProcessorRequest)
(setf (get task3::CheckpointProcessor :response) task3::CheckpointProcessorResponse)

(defmethod task3::CheckpointProcessorRequest
  (:response () (instance task3::CheckpointProcessorResponse :init)))

(setf (get task3::CheckpointProcessorRequest :md5sum-) "af3f94b765997022c6ac0867e7797cba")
(setf (get task3::CheckpointProcessorRequest :datatype-) "task3/CheckpointProcessorRequest")
(setf (get task3::CheckpointProcessorRequest :definition-)
      "float64 input_x
float64 input_y
---
float64 output_x
float64 output_y
bool valid
")

(setf (get task3::CheckpointProcessorResponse :md5sum-) "af3f94b765997022c6ac0867e7797cba")
(setf (get task3::CheckpointProcessorResponse :datatype-) "task3/CheckpointProcessorResponse")
(setf (get task3::CheckpointProcessorResponse :definition-)
      "float64 input_x
float64 input_y
---
float64 output_x
float64 output_y
bool valid
")



(provide :task3/CheckpointProcessor "af3f94b765997022c6ac0867e7797cba")


