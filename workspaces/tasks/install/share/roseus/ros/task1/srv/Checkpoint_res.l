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
  :slots (_num_of_checkpoints ))

(defmethod task1::Checkpoint_resRequest
  (:init
   (&key
    ((:num_of_checkpoints __num_of_checkpoints) 0)
    )
   (send-super :init)
   (setq _num_of_checkpoints (round __num_of_checkpoints))
   self)
  (:num_of_checkpoints
   (&optional __num_of_checkpoints)
   (if __num_of_checkpoints (setq _num_of_checkpoints __num_of_checkpoints)) _num_of_checkpoints)
  (:serialization-length
   ()
   (+
    ;; uint64 _num_of_checkpoints
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _num_of_checkpoints
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _num_of_checkpoints (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _num_of_checkpoints) (= (length (_num_of_checkpoints . bv)) 2)) ;; bignum
              (write-long (ash (elt (_num_of_checkpoints . bv) 0) 0) s)
              (write-long (ash (elt (_num_of_checkpoints . bv) 1) -1) s))
             ((and (class _num_of_checkpoints) (= (length (_num_of_checkpoints . bv)) 1)) ;; big1
              (write-long (elt (_num_of_checkpoints . bv) 0) s)
              (write-long (if (>= _num_of_checkpoints 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _num_of_checkpoints s)(write-long (if (>= _num_of_checkpoints 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _num_of_checkpoints
     
#+(or :alpha :irix6 :x86_64)
      (setf _num_of_checkpoints (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _num_of_checkpoints (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
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

(setf (get task1::Checkpoint_res :md5sum-) "164415de33c55ff5b8477a9721394803")
(setf (get task1::Checkpoint_res :datatype-) "task1/Checkpoint_res")
(setf (get task1::Checkpoint_res :request) task1::Checkpoint_resRequest)
(setf (get task1::Checkpoint_res :response) task1::Checkpoint_resResponse)

(defmethod task1::Checkpoint_resRequest
  (:response () (instance task1::Checkpoint_resResponse :init)))

(setf (get task1::Checkpoint_resRequest :md5sum-) "164415de33c55ff5b8477a9721394803")
(setf (get task1::Checkpoint_resRequest :datatype-) "task1/Checkpoint_resRequest")
(setf (get task1::Checkpoint_resRequest :definition-)
      "uint64 num_of_checkpoints
---
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

(setf (get task1::Checkpoint_resResponse :md5sum-) "164415de33c55ff5b8477a9721394803")
(setf (get task1::Checkpoint_resResponse :datatype-) "task1/Checkpoint_resResponse")
(setf (get task1::Checkpoint_resResponse :definition-)
      "uint64 num_of_checkpoints
---
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



(provide :task1/Checkpoint_res "164415de33c55ff5b8477a9721394803")


