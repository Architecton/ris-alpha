;; Auto-generated. Do not edit!


(when (boundp 'task2::FeatureBuilder)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'FeatureBuilder (find-package "TASK2")))
(unless (find-package "TASK2::FEATUREBUILDER")
  (make-package "TASK2::FEATUREBUILDER"))
(unless (find-package "TASK2::FEATUREBUILDERREQUEST")
  (make-package "TASK2::FEATUREBUILDERREQUEST"))
(unless (find-package "TASK2::FEATUREBUILDERRESPONSE")
  (make-package "TASK2::FEATUREBUILDERRESPONSE"))

(in-package "ROS")





(defclass task2::FeatureBuilderRequest
  :super ros::object
  :slots (_flg ))

(defmethod task2::FeatureBuilderRequest
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

(defclass task2::FeatureBuilderResponse
  :super ros::object
  :slots (_res ))

(defmethod task2::FeatureBuilderResponse
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

(defclass task2::FeatureBuilder
  :super ros::object
  :slots ())

(setf (get task2::FeatureBuilder :md5sum-) "74768431c7b5d3256bc92cadde0c032a")
(setf (get task2::FeatureBuilder :datatype-) "task2/FeatureBuilder")
(setf (get task2::FeatureBuilder :request) task2::FeatureBuilderRequest)
(setf (get task2::FeatureBuilder :response) task2::FeatureBuilderResponse)

(defmethod task2::FeatureBuilderRequest
  (:response () (instance task2::FeatureBuilderResponse :init)))

(setf (get task2::FeatureBuilderRequest :md5sum-) "74768431c7b5d3256bc92cadde0c032a")
(setf (get task2::FeatureBuilderRequest :datatype-) "task2/FeatureBuilderRequest")
(setf (get task2::FeatureBuilderRequest :definition-)
      "int64 flg
---
string res

")

(setf (get task2::FeatureBuilderResponse :md5sum-) "74768431c7b5d3256bc92cadde0c032a")
(setf (get task2::FeatureBuilderResponse :datatype-) "task2/FeatureBuilderResponse")
(setf (get task2::FeatureBuilderResponse :definition-)
      "int64 flg
---
string res

")



(provide :task2/FeatureBuilder "74768431c7b5d3256bc92cadde0c032a")


