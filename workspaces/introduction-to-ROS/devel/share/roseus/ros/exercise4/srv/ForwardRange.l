;; Auto-generated. Do not edit!


(when (boundp 'exercise4::ForwardRange)
  (if (not (find-package "EXERCISE4"))
    (make-package "EXERCISE4"))
  (shadow 'ForwardRange (find-package "EXERCISE4")))
(unless (find-package "EXERCISE4::FORWARDRANGE")
  (make-package "EXERCISE4::FORWARDRANGE"))
(unless (find-package "EXERCISE4::FORWARDRANGEREQUEST")
  (make-package "EXERCISE4::FORWARDRANGEREQUEST"))
(unless (find-package "EXERCISE4::FORWARDRANGERESPONSE")
  (make-package "EXERCISE4::FORWARDRANGERESPONSE"))

(in-package "ROS")





(defclass exercise4::ForwardRangeRequest
  :super ros::object
  :slots ())

(defmethod exercise4::ForwardRangeRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass exercise4::ForwardRangeResponse
  :super ros::object
  :slots (_distance ))

(defmethod exercise4::ForwardRangeResponse
  (:init
   (&key
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass exercise4::ForwardRange
  :super ros::object
  :slots ())

(setf (get exercise4::ForwardRange :md5sum-) "6e77fb10f0c8b4833ec273aa9ac74459")
(setf (get exercise4::ForwardRange :datatype-) "exercise4/ForwardRange")
(setf (get exercise4::ForwardRange :request) exercise4::ForwardRangeRequest)
(setf (get exercise4::ForwardRange :response) exercise4::ForwardRangeResponse)

(defmethod exercise4::ForwardRangeRequest
  (:response () (instance exercise4::ForwardRangeResponse :init)))

(setf (get exercise4::ForwardRangeRequest :md5sum-) "6e77fb10f0c8b4833ec273aa9ac74459")
(setf (get exercise4::ForwardRangeRequest :datatype-) "exercise4/ForwardRangeRequest")
(setf (get exercise4::ForwardRangeRequest :definition-)
      "---
float32 distance
")

(setf (get exercise4::ForwardRangeResponse :md5sum-) "6e77fb10f0c8b4833ec273aa9ac74459")
(setf (get exercise4::ForwardRangeResponse :datatype-) "exercise4/ForwardRangeResponse")
(setf (get exercise4::ForwardRangeResponse :definition-)
      "---
float32 distance
")



(provide :exercise4/ForwardRange "6e77fb10f0c8b4833ec273aa9ac74459")


