;; Auto-generated. Do not edit!


(when (boundp 'task3::CheckpointProcessorResponse)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'CheckpointProcessorResponse (find-package "TASK3")))
(unless (find-package "TASK3::CHECKPOINTPROCESSORRESPONSE")
  (make-package "TASK3::CHECKPOINTPROCESSORRESPONSE"))

(in-package "ROS")
;;//! \htmlinclude CheckpointProcessorResponse.msg.html


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

(setf (get task3::CheckpointProcessorResponse :md5sum-) "d43cce861a65119db3648d950c7f417f")
(setf (get task3::CheckpointProcessorResponse :datatype-) "task3/CheckpointProcessorResponse")
(setf (get task3::CheckpointProcessorResponse :definition-)
      "float64 output_x
float64 output_y
bool valid
")



(provide :task3/CheckpointProcessorResponse "d43cce861a65119db3648d950c7f417f")


