;; Auto-generated. Do not edit!


(when (boundp 'task2::GetRingColor)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'GetRingColor (find-package "TASK2")))
(unless (find-package "TASK2::GETRINGCOLOR")
  (make-package "TASK2::GETRINGCOLOR"))
(unless (find-package "TASK2::GETRINGCOLORREQUEST")
  (make-package "TASK2::GETRINGCOLORREQUEST"))
(unless (find-package "TASK2::GETRINGCOLORRESPONSE")
  (make-package "TASK2::GETRINGCOLORRESPONSE"))

(in-package "ROS")





(defclass task2::GetRingColorRequest
  :super ros::object
  :slots (_start ))

(defmethod task2::GetRingColorRequest
  (:init
   (&key
    ((:start __start) 0)
    )
   (send-super :init)
   (setq _start (round __start))
   self)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:serialization-length
   ()
   (+
    ;; int64 _start
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _start
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _start (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _start) (= (length (_start . bv)) 2)) ;; bignum
              (write-long (ash (elt (_start . bv) 0) 0) s)
              (write-long (ash (elt (_start . bv) 1) -1) s))
             ((and (class _start) (= (length (_start . bv)) 1)) ;; big1
              (write-long (elt (_start . bv) 0) s)
              (write-long (if (>= _start 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _start s)(write-long (if (>= _start 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _start
#+(or :alpha :irix6 :x86_64)
      (setf _start (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _start (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass task2::GetRingColorResponse
  :super ros::object
  :slots (_color ))

(defmethod task2::GetRingColorResponse
  (:init
   (&key
    ((:color __color) 0)
    )
   (send-super :init)
   (setq _color (round __color))
   self)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:serialization-length
   ()
   (+
    ;; int64 _color
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _color
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _color (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _color) (= (length (_color . bv)) 2)) ;; bignum
              (write-long (ash (elt (_color . bv) 0) 0) s)
              (write-long (ash (elt (_color . bv) 1) -1) s))
             ((and (class _color) (= (length (_color . bv)) 1)) ;; big1
              (write-long (elt (_color . bv) 0) s)
              (write-long (if (>= _color 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _color s)(write-long (if (>= _color 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _color
#+(or :alpha :irix6 :x86_64)
      (setf _color (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _color (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass task2::GetRingColor
  :super ros::object
  :slots ())

(setf (get task2::GetRingColor :md5sum-) "f1520819364d5ba5d943a48edb027a19")
(setf (get task2::GetRingColor :datatype-) "task2/GetRingColor")
(setf (get task2::GetRingColor :request) task2::GetRingColorRequest)
(setf (get task2::GetRingColor :response) task2::GetRingColorResponse)

(defmethod task2::GetRingColorRequest
  (:response () (instance task2::GetRingColorResponse :init)))

(setf (get task2::GetRingColorRequest :md5sum-) "f1520819364d5ba5d943a48edb027a19")
(setf (get task2::GetRingColorRequest :datatype-) "task2/GetRingColorRequest")
(setf (get task2::GetRingColorRequest :definition-)
      "int64 start
---
int64 color
")

(setf (get task2::GetRingColorResponse :md5sum-) "f1520819364d5ba5d943a48edb027a19")
(setf (get task2::GetRingColorResponse :datatype-) "task2/GetRingColorResponse")
(setf (get task2::GetRingColorResponse :definition-)
      "int64 start
---
int64 color
")



(provide :task2/GetRingColor "f1520819364d5ba5d943a48edb027a19")


