;; Auto-generated. Do not edit!


(when (boundp 'task3::CylinderLocator)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'CylinderLocator (find-package "TASK3")))
(unless (find-package "TASK3::CYLINDERLOCATOR")
  (make-package "TASK3::CYLINDERLOCATOR"))
(unless (find-package "TASK3::CYLINDERLOCATORREQUEST")
  (make-package "TASK3::CYLINDERLOCATORREQUEST"))
(unless (find-package "TASK3::CYLINDERLOCATORRESPONSE")
  (make-package "TASK3::CYLINDERLOCATORRESPONSE"))

(in-package "ROS")





(defclass task3::CylinderLocatorRequest
  :super ros::object
  :slots ())

(defmethod task3::CylinderLocatorRequest
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

(defclass task3::CylinderLocatorResponse
  :super ros::object
  :slots (_target ))

(defmethod task3::CylinderLocatorResponse
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

(defclass task3::CylinderLocator
  :super ros::object
  :slots ())

(setf (get task3::CylinderLocator :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task3::CylinderLocator :datatype-) "task3/CylinderLocator")
(setf (get task3::CylinderLocator :request) task3::CylinderLocatorRequest)
(setf (get task3::CylinderLocator :response) task3::CylinderLocatorResponse)

(defmethod task3::CylinderLocatorRequest
  (:response () (instance task3::CylinderLocatorResponse :init)))

(setf (get task3::CylinderLocatorRequest :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task3::CylinderLocatorRequest :datatype-) "task3/CylinderLocatorRequest")
(setf (get task3::CylinderLocatorRequest :definition-)
      "---
float64[] target

")

(setf (get task3::CylinderLocatorResponse :md5sum-) "7b497188d656d59d92c0ddf8ac50fe8a")
(setf (get task3::CylinderLocatorResponse :datatype-) "task3/CylinderLocatorResponse")
(setf (get task3::CylinderLocatorResponse :definition-)
      "---
float64[] target

")



(provide :task3/CylinderLocator "7b497188d656d59d92c0ddf8ac50fe8a")


