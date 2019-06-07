;; Auto-generated. Do not edit!


(when (boundp 'task3::CylinderLocation)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'CylinderLocation (find-package "TASK3")))
(unless (find-package "TASK3::CYLINDERLOCATION")
  (make-package "TASK3::CYLINDERLOCATION"))
(unless (find-package "TASK3::CYLINDERLOCATIONREQUEST")
  (make-package "TASK3::CYLINDERLOCATIONREQUEST"))
(unless (find-package "TASK3::CYLINDERLOCATIONRESPONSE")
  (make-package "TASK3::CYLINDERLOCATIONRESPONSE"))

(in-package "ROS")





(defclass task3::CylinderLocationRequest
  :super ros::object
  :slots (_flg ))

(defmethod task3::CylinderLocationRequest
  (:init
   (&key
    ((:flg __flg) 0)
    )
   (send-super :init)
   (setq _flg (round __flg))
   self)
  (:flg
   (&optional __flg)
   (if __flg (setq _flg __flg)) _flg)
  (:serialization-length
   ()
   (+
    ;; int64 _flg
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _flg
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _flg (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _flg) (= (length (_flg . bv)) 2)) ;; bignum
              (write-long (ash (elt (_flg . bv) 0) 0) s)
              (write-long (ash (elt (_flg . bv) 1) -1) s))
             ((and (class _flg) (= (length (_flg . bv)) 1)) ;; big1
              (write-long (elt (_flg . bv) 0) s)
              (write-long (if (>= _flg 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _flg s)(write-long (if (>= _flg 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _flg
#+(or :alpha :irix6 :x86_64)
      (setf _flg (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _flg (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass task3::CylinderLocationResponse
  :super ros::object
  :slots (_found _x _y _z _x_a _y_a _z_a ))

(defmethod task3::CylinderLocationResponse
  (:init
   (&key
    ((:found __found) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:x_a __x_a) 0.0)
    ((:y_a __y_a) 0.0)
    ((:z_a __z_a) 0.0)
    )
   (send-super :init)
   (setq _found (round __found))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _x_a (float __x_a))
   (setq _y_a (float __y_a))
   (setq _z_a (float __z_a))
   self)
  (:found
   (&optional __found)
   (if __found (setq _found __found)) _found)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:x_a
   (&optional __x_a)
   (if __x_a (setq _x_a __x_a)) _x_a)
  (:y_a
   (&optional __y_a)
   (if __y_a (setq _y_a __y_a)) _y_a)
  (:z_a
   (&optional __z_a)
   (if __z_a (setq _z_a __z_a)) _z_a)
  (:serialization-length
   ()
   (+
    ;; uint8 _found
    1
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _x_a
    8
    ;; float64 _y_a
    8
    ;; float64 _z_a
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _found
       (write-byte _found s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x_a
       (sys::poke _x_a (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_a
       (sys::poke _y_a (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z_a
       (sys::poke _z_a (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _found
     (setq _found (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x_a
     (setq _x_a (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_a
     (setq _y_a (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z_a
     (setq _z_a (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass task3::CylinderLocation
  :super ros::object
  :slots ())

(setf (get task3::CylinderLocation :md5sum-) "449ac22520dbd7a67ea7d1766a88f2a4")
(setf (get task3::CylinderLocation :datatype-) "task3/CylinderLocation")
(setf (get task3::CylinderLocation :request) task3::CylinderLocationRequest)
(setf (get task3::CylinderLocation :response) task3::CylinderLocationResponse)

(defmethod task3::CylinderLocationRequest
  (:response () (instance task3::CylinderLocationResponse :init)))

(setf (get task3::CylinderLocationRequest :md5sum-) "449ac22520dbd7a67ea7d1766a88f2a4")
(setf (get task3::CylinderLocationRequest :datatype-) "task3/CylinderLocationRequest")
(setf (get task3::CylinderLocationRequest :definition-)
      "int64 flg
---

uint8 found


float64 x
float64 y
float64 z


float64 x_a
float64 y_a
float64 z_a

")

(setf (get task3::CylinderLocationResponse :md5sum-) "449ac22520dbd7a67ea7d1766a88f2a4")
(setf (get task3::CylinderLocationResponse :datatype-) "task3/CylinderLocationResponse")
(setf (get task3::CylinderLocationResponse :definition-)
      "int64 flg
---

uint8 found


float64 x
float64 y
float64 z


float64 x_a
float64 y_a
float64 z_a

")



(provide :task3/CylinderLocation "449ac22520dbd7a67ea7d1766a88f2a4")


