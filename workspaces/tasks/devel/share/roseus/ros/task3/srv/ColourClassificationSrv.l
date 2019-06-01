;; Auto-generated. Do not edit!


(when (boundp 'task3::ColourClassificationSrv)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'ColourClassificationSrv (find-package "TASK3")))
(unless (find-package "TASK3::COLOURCLASSIFICATIONSRV")
  (make-package "TASK3::COLOURCLASSIFICATIONSRV"))
(unless (find-package "TASK3::COLOURCLASSIFICATIONSRVREQUEST")
  (make-package "TASK3::COLOURCLASSIFICATIONSRVREQUEST"))
(unless (find-package "TASK3::COLOURCLASSIFICATIONSRVRESPONSE")
  (make-package "TASK3::COLOURCLASSIFICATIONSRVRESPONSE"))

(in-package "ROS")





(defclass task3::ColourClassificationSrvRequest
  :super ros::object
  :slots (_features_mat _num_features ))

(defmethod task3::ColourClassificationSrvRequest
  (:init
   (&key
    ((:features_mat __features_mat) (make-array 0 :initial-element 0 :element-type :integer))
    ((:num_features __num_features) 0)
    )
   (send-super :init)
   (setq _features_mat __features_mat)
   (setq _num_features (round __num_features))
   self)
  (:features_mat
   (&optional __features_mat)
   (if __features_mat (setq _features_mat __features_mat)) _features_mat)
  (:num_features
   (&optional __num_features)
   (if __num_features (setq _num_features __num_features)) _num_features)
  (:serialization-length
   ()
   (+
    ;; int64[] _features_mat
    (* 8    (length _features_mat)) 4
    ;; int64 _num_features
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _features_mat
     (write-long (length _features_mat) s)
     (dotimes (i (length _features_mat))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _features_mat i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _features_mat i)) (= (length ((elt _features_mat i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _features_mat i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _features_mat i) . bv) 1) -1) s))
             ((and (class (elt _features_mat i)) (= (length ((elt _features_mat i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _features_mat i) . bv) 0) s)
              (write-long (if (>= (elt _features_mat i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _features_mat i) s)(write-long (if (>= (elt _features_mat i) 0) 0 #xffffffff) s)))
       )
     ;; int64 _num_features
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _num_features (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _num_features) (= (length (_num_features . bv)) 2)) ;; bignum
              (write-long (ash (elt (_num_features . bv) 0) 0) s)
              (write-long (ash (elt (_num_features . bv) 1) -1) s))
             ((and (class _num_features) (= (length (_num_features . bv)) 1)) ;; big1
              (write-long (elt (_num_features . bv) 0) s)
              (write-long (if (>= _num_features 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _num_features s)(write-long (if (>= _num_features 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _features_mat
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _features_mat (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _features_mat i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _features_mat i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; int64 _num_features
#+(or :alpha :irix6 :x86_64)
      (setf _num_features (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _num_features (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass task3::ColourClassificationSrvResponse
  :super ros::object
  :slots (_res ))

(defmethod task3::ColourClassificationSrvResponse
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

(defclass task3::ColourClassificationSrv
  :super ros::object
  :slots ())

(setf (get task3::ColourClassificationSrv :md5sum-) "caf04d413f9e4daef949309d687bb7a1")
(setf (get task3::ColourClassificationSrv :datatype-) "task3/ColourClassificationSrv")
(setf (get task3::ColourClassificationSrv :request) task3::ColourClassificationSrvRequest)
(setf (get task3::ColourClassificationSrv :response) task3::ColourClassificationSrvResponse)

(defmethod task3::ColourClassificationSrvRequest
  (:response () (instance task3::ColourClassificationSrvResponse :init)))

(setf (get task3::ColourClassificationSrvRequest :md5sum-) "caf04d413f9e4daef949309d687bb7a1")
(setf (get task3::ColourClassificationSrvRequest :datatype-) "task3/ColourClassificationSrvRequest")
(setf (get task3::ColourClassificationSrvRequest :definition-)
      "int64[] features_mat
int64 num_features
---
string res

")

(setf (get task3::ColourClassificationSrvResponse :md5sum-) "caf04d413f9e4daef949309d687bb7a1")
(setf (get task3::ColourClassificationSrvResponse :datatype-) "task3/ColourClassificationSrvResponse")
(setf (get task3::ColourClassificationSrvResponse :definition-)
      "int64[] features_mat
int64 num_features
---
string res

")



(provide :task3/ColourClassificationSrv "caf04d413f9e4daef949309d687bb7a1")


