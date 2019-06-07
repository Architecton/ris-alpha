;; Auto-generated. Do not edit!


(when (boundp 'task3::MapDetector)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'MapDetector (find-package "TASK3")))
(unless (find-package "TASK3::MAPDETECTOR")
  (make-package "TASK3::MAPDETECTOR"))
(unless (find-package "TASK3::MAPDETECTORREQUEST")
  (make-package "TASK3::MAPDETECTORREQUEST"))
(unless (find-package "TASK3::MAPDETECTORRESPONSE")
  (make-package "TASK3::MAPDETECTORRESPONSE"))

(in-package "ROS")





(defclass task3::MapDetectorRequest
  :super ros::object
  :slots (_flg ))

(defmethod task3::MapDetectorRequest
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

(defclass task3::MapDetectorResponse
  :super ros::object
  :slots (_treasure_x _treasure_y ))

(defmethod task3::MapDetectorResponse
  (:init
   (&key
    ((:treasure_x __treasure_x) 0.0)
    ((:treasure_y __treasure_y) 0.0)
    )
   (send-super :init)
   (setq _treasure_x (float __treasure_x))
   (setq _treasure_y (float __treasure_y))
   self)
  (:treasure_x
   (&optional __treasure_x)
   (if __treasure_x (setq _treasure_x __treasure_x)) _treasure_x)
  (:treasure_y
   (&optional __treasure_y)
   (if __treasure_y (setq _treasure_y __treasure_y)) _treasure_y)
  (:serialization-length
   ()
   (+
    ;; float64 _treasure_x
    8
    ;; float64 _treasure_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _treasure_x
       (sys::poke _treasure_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _treasure_y
       (sys::poke _treasure_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _treasure_x
     (setq _treasure_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _treasure_y
     (setq _treasure_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass task3::MapDetector
  :super ros::object
  :slots ())

(setf (get task3::MapDetector :md5sum-) "5c0167ecd7748962f1d9e21ddb0b0dae")
(setf (get task3::MapDetector :datatype-) "task3/MapDetector")
(setf (get task3::MapDetector :request) task3::MapDetectorRequest)
(setf (get task3::MapDetector :response) task3::MapDetectorResponse)

(defmethod task3::MapDetectorRequest
  (:response () (instance task3::MapDetectorResponse :init)))

(setf (get task3::MapDetectorRequest :md5sum-) "5c0167ecd7748962f1d9e21ddb0b0dae")
(setf (get task3::MapDetectorRequest :datatype-) "task3/MapDetectorRequest")
(setf (get task3::MapDetectorRequest :definition-)
      "int64 flg
---
float64 treasure_x
float64 treasure_y
")

(setf (get task3::MapDetectorResponse :md5sum-) "5c0167ecd7748962f1d9e21ddb0b0dae")
(setf (get task3::MapDetectorResponse :datatype-) "task3/MapDetectorResponse")
(setf (get task3::MapDetectorResponse :definition-)
      "int64 flg
---
float64 treasure_x
float64 treasure_y
")



(provide :task3/MapDetector "5c0167ecd7748962f1d9e21ddb0b0dae")


