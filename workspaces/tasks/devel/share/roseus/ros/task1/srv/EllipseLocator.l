;; Auto-generated. Do not edit!


(when (boundp 'task1::EllipseLocator)
  (if (not (find-package "TASK1"))
    (make-package "TASK1"))
  (shadow 'EllipseLocator (find-package "TASK1")))
(unless (find-package "TASK1::ELLIPSELOCATOR")
  (make-package "TASK1::ELLIPSELOCATOR"))
(unless (find-package "TASK1::ELLIPSELOCATORREQUEST")
  (make-package "TASK1::ELLIPSELOCATORREQUEST"))
(unless (find-package "TASK1::ELLIPSELOCATORRESPONSE")
  (make-package "TASK1::ELLIPSELOCATORRESPONSE"))

(in-package "ROS")





(defclass task1::EllipseLocatorRequest
  :super ros::object
  :slots ())

(defmethod task1::EllipseLocatorRequest
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

(defclass task1::EllipseLocatorResponse
  :super ros::object
  :slots (_target ))

(defmethod task1::EllipseLocatorResponse
  (:init
   (&key
    ((:target __target) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _target __target)
   self)
  (:target
   (&optional __target)
   (if __target (setq _target __target)) _target)
  (:serialization-length
   ()
   (+
    ;; float64[] _target
    (* 8    (length _target)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _target
     (write-long (length _target) s)
     (dotimes (i (length _target))
       (sys::poke (elt _target i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _target
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _target (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _target i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass task1::EllipseLocator
  :super ros::object
  :slots ())

(setf (get task1::EllipseLocator :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task1::EllipseLocator :datatype-) "task1/EllipseLocator")
(setf (get task1::EllipseLocator :request) task1::EllipseLocatorRequest)
(setf (get task1::EllipseLocator :response) task1::EllipseLocatorResponse)

(defmethod task1::EllipseLocatorRequest
  (:response () (instance task1::EllipseLocatorResponse :init)))

(setf (get task1::EllipseLocatorRequest :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task1::EllipseLocatorRequest :datatype-) "task1/EllipseLocatorRequest")
(setf (get task1::EllipseLocatorRequest :definition-)
      "---
float64[] target
")

(setf (get task1::EllipseLocatorResponse :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task1::EllipseLocatorResponse :datatype-) "task1/EllipseLocatorResponse")
(setf (get task1::EllipseLocatorResponse :definition-)
      "---
float64[] target
")



(provide :task1/EllipseLocator "7b497188d656d59d92c0ddf8ac50fe8a")


