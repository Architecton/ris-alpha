;; Auto-generated. Do not edit!


(when (boundp 'task3::EllipseLocator)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'EllipseLocator (find-package "TASK3")))
(unless (find-package "TASK3::ELLIPSELOCATOR")
  (make-package "TASK3::ELLIPSELOCATOR"))
(unless (find-package "TASK3::ELLIPSELOCATORREQUEST")
  (make-package "TASK3::ELLIPSELOCATORREQUEST"))
(unless (find-package "TASK3::ELLIPSELOCATORRESPONSE")
  (make-package "TASK3::ELLIPSELOCATORRESPONSE"))

(in-package "ROS")





(defclass task3::EllipseLocatorRequest
  :super ros::object
  :slots ())

(defmethod task3::EllipseLocatorRequest
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

(defclass task3::EllipseLocatorResponse
  :super ros::object
  :slots (_target ))

(defmethod task3::EllipseLocatorResponse
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

(defclass task3::EllipseLocator
  :super ros::object
  :slots ())

(setf (get task3::EllipseLocator :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task3::EllipseLocator :datatype-) "task3/EllipseLocator")
(setf (get task3::EllipseLocator :request) task3::EllipseLocatorRequest)
(setf (get task3::EllipseLocator :response) task3::EllipseLocatorResponse)

(defmethod task3::EllipseLocatorRequest
  (:response () (instance task3::EllipseLocatorResponse :init)))

(setf (get task3::EllipseLocatorRequest :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task3::EllipseLocatorRequest :datatype-) "task3/EllipseLocatorRequest")
(setf (get task3::EllipseLocatorRequest :definition-)
      "---
float64[] target

")

(setf (get task3::EllipseLocatorResponse :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task3::EllipseLocatorResponse :datatype-) "task3/EllipseLocatorResponse")
(setf (get task3::EllipseLocatorResponse :definition-)
      "---
float64[] target

")



(provide :task3/EllipseLocator "7b497188d656d59d92c0ddf8ac50fe8a")


