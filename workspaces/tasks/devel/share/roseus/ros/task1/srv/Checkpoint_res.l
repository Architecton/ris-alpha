;; Auto-generated. Do not edit!


(when (boundp 'task1::Checkpoint_res)
  (if (not (find-package "TASK1"))
    (make-package "TASK1"))
  (shadow 'Checkpoint_res (find-package "TASK1")))
(unless (find-package "TASK1::CHECKPOINT_RES")
  (make-package "TASK1::CHECKPOINT_RES"))
(unless (find-package "TASK1::CHECKPOINT_RESREQUEST")
  (make-package "TASK1::CHECKPOINT_RESREQUEST"))
(unless (find-package "TASK1::CHECKPOINT_RESRESPONSE")
  (make-package "TASK1::CHECKPOINT_RESRESPONSE"))

(in-package "ROS")





(defclass task1::Checkpoint_resRequest
  :super ros::object
  :slots ())

(defmethod task1::Checkpoint_resRequest
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

(defclass task1::Checkpoint_resResponse
  :super ros::object
  :slots (_points ))

(defmethod task1::Checkpoint_resResponse
  (:init
   (&key
    ((:points __points) (instance task1::Checkpoints :init))
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
    ;; task1/Checkpoints _points
    (send _points :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; task1/Checkpoints _points
       (send _points :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; task1/Checkpoints _points
     (send _points :deserialize buf ptr-) (incf ptr- (send _points :serialization-length))
   ;;
   self)
  )

(defclass task1::Checkpoint_res
  :super ros::object
  :slots ())

(setf (get task1::Checkpoint_res :md5sum-) "f7b43fb4c3dc044f1ecb1f843f952947")
(setf (get task1::Checkpoint_res :datatype-) "task1/Checkpoint_res")
(setf (get task1::Checkpoint_res :request) task1::Checkpoint_resRequest)
(setf (get task1::Checkpoint_res :response) task1::Checkpoint_resResponse)

(defmethod task1::Checkpoint_resRequest
  (:response () (instance task1::Checkpoint_resResponse :init)))

(setf (get task1::Checkpoint_resRequest :md5sum-) "f7b43fb4c3dc044f1ecb1f843f952947")
(setf (get task1::Checkpoint_resRequest :datatype-) "task1/Checkpoint_resRequest")
(setf (get task1::Checkpoint_resRequest :definition-)
      "---
Checkpoints points

================================================================================
MSG: task1/Checkpoints
geometry_msgs/Point[] points
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get task1::Checkpoint_resResponse :md5sum-) "f7b43fb4c3dc044f1ecb1f843f952947")
(setf (get task1::Checkpoint_resResponse :datatype-) "task1/Checkpoint_resResponse")
(setf (get task1::Checkpoint_resResponse :definition-)
      "---
Checkpoints points

================================================================================
MSG: task1/Checkpoints
geometry_msgs/Point[] points
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :task1/Checkpoint_res "f7b43fb4c3dc044f1ecb1f843f952947")


