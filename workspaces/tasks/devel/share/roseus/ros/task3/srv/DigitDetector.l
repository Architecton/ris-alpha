;; Auto-generated. Do not edit!


(when (boundp 'task3::DigitDetector)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'DigitDetector (find-package "TASK3")))
(unless (find-package "TASK3::DIGITDETECTOR")
  (make-package "TASK3::DIGITDETECTOR"))
(unless (find-package "TASK3::DIGITDETECTORREQUEST")
  (make-package "TASK3::DIGITDETECTORREQUEST"))
(unless (find-package "TASK3::DIGITDETECTORRESPONSE")
  (make-package "TASK3::DIGITDETECTORRESPONSE"))

(in-package "ROS")





(defclass task3::DigitDetectorRequest
  :super ros::object
  :slots (_flg ))

(defmethod task3::DigitDetectorRequest
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

(defclass task3::DigitDetectorResponse
  :super ros::object
  :slots (_result ))

(defmethod task3::DigitDetectorResponse
  (:init
   (&key
    ((:result __result) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int64[] _result
    (* 8    (length _result)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _result
     (write-long (length _result) s)
     (dotimes (i (length _result))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _result i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _result i)) (= (length ((elt _result i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _result i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _result i) . bv) 1) -1) s))
             ((and (class (elt _result i)) (= (length ((elt _result i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _result i) . bv) 0) s)
              (write-long (if (>= (elt _result i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _result i) s)(write-long (if (>= (elt _result i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _result
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _result (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _result i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _result i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;;
   self)
  )

(defclass task3::DigitDetector
  :super ros::object
  :slots ())

(setf (get task3::DigitDetector :md5sum-) "64fdfdf2315ce0489e0badef6a400485")
(setf (get task3::DigitDetector :datatype-) "task3/DigitDetector")
(setf (get task3::DigitDetector :request) task3::DigitDetectorRequest)
(setf (get task3::DigitDetector :response) task3::DigitDetectorResponse)

(defmethod task3::DigitDetectorRequest
  (:response () (instance task3::DigitDetectorResponse :init)))

(setf (get task3::DigitDetectorRequest :md5sum-) "64fdfdf2315ce0489e0badef6a400485")
(setf (get task3::DigitDetectorRequest :datatype-) "task3/DigitDetectorRequest")
(setf (get task3::DigitDetectorRequest :definition-)
      "int64 flg
---
int64[] result

")

(setf (get task3::DigitDetectorResponse :md5sum-) "64fdfdf2315ce0489e0badef6a400485")
(setf (get task3::DigitDetectorResponse :datatype-) "task3/DigitDetectorResponse")
(setf (get task3::DigitDetectorResponse :definition-)
      "int64 flg
---
int64[] result

")



(provide :task3/DigitDetector "64fdfdf2315ce0489e0badef6a400485")


