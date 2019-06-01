;; Auto-generated. Do not edit!


(when (boundp 'task3::ValidRegionsMapResponse)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'ValidRegionsMapResponse (find-package "TASK3")))
(unless (find-package "TASK3::VALIDREGIONSMAPRESPONSE")
  (make-package "TASK3::VALIDREGIONSMAPRESPONSE"))

(in-package "ROS")
;;//! \htmlinclude ValidRegionsMapResponse.msg.html


(defclass task3::ValidRegionsMapResponse
  :super ros::object
  :slots (_output_x _output_y ))

(defmethod task3::ValidRegionsMapResponse
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

(setf (get task3::ValidRegionsMapResponse :md5sum-) "afbd32084a014b9ac53ccb0b88a798f5")
(setf (get task3::ValidRegionsMapResponse :datatype-) "task3/ValidRegionsMapResponse")
(setf (get task3::ValidRegionsMapResponse :definition-)
      "float64 output_x
float64 output_y
")



(provide :task3/ValidRegionsMapResponse "afbd32084a014b9ac53ccb0b88a798f5")


