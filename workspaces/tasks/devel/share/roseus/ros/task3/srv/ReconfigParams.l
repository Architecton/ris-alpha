;; Auto-generated. Do not edit!


(when (boundp 'task3::ReconfigParams)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'ReconfigParams (find-package "TASK3")))
(unless (find-package "TASK3::RECONFIGPARAMS")
  (make-package "TASK3::RECONFIGPARAMS"))
(unless (find-package "TASK3::RECONFIGPARAMSREQUEST")
  (make-package "TASK3::RECONFIGPARAMSREQUEST"))
(unless (find-package "TASK3::RECONFIGPARAMSRESPONSE")
  (make-package "TASK3::RECONFIGPARAMSRESPONSE"))

(in-package "ROS")





(defclass task3::ReconfigParamsRequest
  :super ros::object
  :slots (_param_name _param_val ))

(defmethod task3::ReconfigParamsRequest
  (:init
   (&key
    ((:param_name __param_name) "")
    ((:param_val __param_val) 0.0)
    )
   (send-super :init)
   (setq _param_name (string __param_name))
   (setq _param_val (float __param_val))
   self)
  (:param_name
   (&optional __param_name)
   (if __param_name (setq _param_name __param_name)) _param_name)
  (:param_val
   (&optional __param_val)
   (if __param_val (setq _param_val __param_val)) _param_val)
  (:serialization-length
   ()
   (+
    ;; string _param_name
    4 (length _param_name)
    ;; float64 _param_val
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _param_name
       (write-long (length _param_name) s) (princ _param_name s)
     ;; float64 _param_val
       (sys::poke _param_val (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _param_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _param_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _param_val
     (setq _param_val (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass task3::ReconfigParamsResponse
  :super ros::object
  :slots (_success ))

(defmethod task3::ReconfigParamsResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass task3::ReconfigParams
  :super ros::object
  :slots ())

(setf (get task3::ReconfigParams :md5sum-) "64fd125ad82319180ca7fa695a94eece")
(setf (get task3::ReconfigParams :datatype-) "task3/ReconfigParams")
(setf (get task3::ReconfigParams :request) task3::ReconfigParamsRequest)
(setf (get task3::ReconfigParams :response) task3::ReconfigParamsResponse)

(defmethod task3::ReconfigParamsRequest
  (:response () (instance task3::ReconfigParamsResponse :init)))

(setf (get task3::ReconfigParamsRequest :md5sum-) "64fd125ad82319180ca7fa695a94eece")
(setf (get task3::ReconfigParamsRequest :datatype-) "task3/ReconfigParamsRequest")
(setf (get task3::ReconfigParamsRequest :definition-)
      "string param_name
float64 param_val
---
bool success

")

(setf (get task3::ReconfigParamsResponse :md5sum-) "64fd125ad82319180ca7fa695a94eece")
(setf (get task3::ReconfigParamsResponse :datatype-) "task3/ReconfigParamsResponse")
(setf (get task3::ReconfigParamsResponse :definition-)
      "string param_name
float64 param_val
---
bool success

")



(provide :task3/ReconfigParams "64fd125ad82319180ca7fa695a94eece")


