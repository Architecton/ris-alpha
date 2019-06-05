;; Auto-generated. Do not edit!


(when (boundp 'task3::QRDetector)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'QRDetector (find-package "TASK3")))
(unless (find-package "TASK3::QRDETECTOR")
  (make-package "TASK3::QRDETECTOR"))
(unless (find-package "TASK3::QRDETECTORREQUEST")
  (make-package "TASK3::QRDETECTORREQUEST"))
(unless (find-package "TASK3::QRDETECTORRESPONSE")
  (make-package "TASK3::QRDETECTORRESPONSE"))

(in-package "ROS")





(defclass task3::QRDetectorRequest
  :super ros::object
  :slots (_flg ))

(defmethod task3::QRDetectorRequest
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

(defclass task3::QRDetectorResponse
  :super ros::object
  :slots (_res ))

(defmethod task3::QRDetectorResponse
  (:init
   (&key
    ((:res __res) "")
    )
   (send-super :init)
   (setq _res (string __res))
   self)
  (:res
   (&optional __res)
   (if __res (setq _res __res)) _res)
  (:serialization-length
   ()
   (+
    ;; string _res
    4 (length _res)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _res
       (write-long (length _res) s) (princ _res s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _res
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _res (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass task3::QRDetector
  :super ros::object
  :slots ())

(setf (get task3::QRDetector :md5sum-) "74768431c7b5d3256bc92cadde0c032a")
(setf (get task3::QRDetector :datatype-) "task3/QRDetector")
(setf (get task3::QRDetector :request) task3::QRDetectorRequest)
(setf (get task3::QRDetector :response) task3::QRDetectorResponse)

(defmethod task3::QRDetectorRequest
  (:response () (instance task3::QRDetectorResponse :init)))

(setf (get task3::QRDetectorRequest :md5sum-) "74768431c7b5d3256bc92cadde0c032a")
(setf (get task3::QRDetectorRequest :datatype-) "task3/QRDetectorRequest")
(setf (get task3::QRDetectorRequest :definition-)
      "int64 flg
---
string res

")

(setf (get task3::QRDetectorResponse :md5sum-) "74768431c7b5d3256bc92cadde0c032a")
(setf (get task3::QRDetectorResponse :datatype-) "task3/QRDetectorResponse")
(setf (get task3::QRDetectorResponse :definition-)
      "int64 flg
---
string res

")



(provide :task3/QRDetector "74768431c7b5d3256bc92cadde0c032a")


