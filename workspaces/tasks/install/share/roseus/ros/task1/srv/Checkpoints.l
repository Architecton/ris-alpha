;; Auto-generated. Do not edit!


(when (boundp 'task1::Checkpoints)
  (if (not (find-package "TASK1"))
    (make-package "TASK1"))
  (shadow 'Checkpoints (find-package "TASK1")))
(unless (find-package "TASK1::CHECKPOINTS")
  (make-package "TASK1::CHECKPOINTS"))
(unless (find-package "TASK1::CHECKPOINTSREQUEST")
  (make-package "TASK1::CHECKPOINTSREQUEST"))
(unless (find-package "TASK1::CHECKPOINTSRESPONSE")
  (make-package "TASK1::CHECKPOINTSRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass task1::CheckpointsRequest
  :super ros::object
  :slots ())

(defmethod task1::CheckpointsRequest
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

(defclass task1::CheckpointsResponse
  :super ros::object
  :slots (_points ))

(defmethod task1::CheckpointsResponse
  (:init
   (&key
    ((:points __points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass task1::Checkpoints
  :super ros::object
  :slots ())

(setf (get task1::Checkpoints :md5sum-) "3fb3f9dacc279b964c4c8341122c34df")
(setf (get task1::Checkpoints :datatype-) "task1/Checkpoints")
(setf (get task1::Checkpoints :request) task1::CheckpointsRequest)
(setf (get task1::Checkpoints :response) task1::CheckpointsResponse)

(defmethod task1::CheckpointsRequest
  (:response () (instance task1::CheckpointsResponse :init)))

(setf (get task1::CheckpointsRequest :md5sum-) "3fb3f9dacc279b964c4c8341122c34df")
(setf (get task1::CheckpointsRequest :datatype-) "task1/CheckpointsRequest")
(setf (get task1::CheckpointsRequest :definition-)
      "---
geometry_msgs/Point[] points

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get task1::CheckpointsResponse :md5sum-) "3fb3f9dacc279b964c4c8341122c34df")
(setf (get task1::CheckpointsResponse :datatype-) "task1/CheckpointsResponse")
(setf (get task1::CheckpointsResponse :definition-)
      "---
geometry_msgs/Point[] points

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :task1/Checkpoints "3fb3f9dacc279b964c4c8341122c34df")


