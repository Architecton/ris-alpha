;; Auto-generated. Do not edit!


(when (boundp 'alpha1::SumIntegers)
  (if (not (find-package "ALPHA1"))
    (make-package "ALPHA1"))
  (shadow 'SumIntegers (find-package "ALPHA1")))
(unless (find-package "ALPHA1::SUMINTEGERS")
  (make-package "ALPHA1::SUMINTEGERS"))
(unless (find-package "ALPHA1::SUMINTEGERSREQUEST")
  (make-package "ALPHA1::SUMINTEGERSREQUEST"))
(unless (find-package "ALPHA1::SUMINTEGERSRESPONSE")
  (make-package "ALPHA1::SUMINTEGERSRESPONSE"))

(in-package "ROS")





(defclass alpha1::SumIntegersRequest
  :super ros::object
  :slots (_numbers ))

(defmethod alpha1::SumIntegersRequest
  (:init
   (&key
    ((:numbers __numbers) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _numbers __numbers)
   self)
  (:numbers
   (&optional __numbers)
   (if __numbers (setq _numbers __numbers)) _numbers)
  (:serialization-length
   ()
   (+
    ;; int64[] _numbers
    (* 8    (length _numbers)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _numbers
     (write-long (length _numbers) s)
     (dotimes (i (length _numbers))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _numbers i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _numbers i)) (= (length ((elt _numbers i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _numbers i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _numbers i) . bv) 1) -1) s))
             ((and (class (elt _numbers i)) (= (length ((elt _numbers i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _numbers i) . bv) 0) s)
              (write-long (if (>= (elt _numbers i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _numbers i) s)(write-long (if (>= (elt _numbers i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _numbers
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _numbers (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _numbers i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _numbers i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass alpha1::SumIntegersResponse
  :super ros::object
  :slots (_sum ))

(defmethod alpha1::SumIntegersResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int64 _sum
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _sum
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _sum (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _sum) (= (length (_sum . bv)) 2)) ;; bignum
              (write-long (ash (elt (_sum . bv) 0) 0) s)
              (write-long (ash (elt (_sum . bv) 1) -1) s))
             ((and (class _sum) (= (length (_sum . bv)) 1)) ;; big1
              (write-long (elt (_sum . bv) 0) s)
              (write-long (if (>= _sum 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _sum s)(write-long (if (>= _sum 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _sum
#+(or :alpha :irix6 :x86_64)
      (setf _sum (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _sum (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass alpha1::SumIntegers
  :super ros::object
  :slots ())

(setf (get alpha1::SumIntegers :md5sum-) "ee52d55541e33a838f1823a8e8489c7d")
(setf (get alpha1::SumIntegers :datatype-) "alpha1/SumIntegers")
(setf (get alpha1::SumIntegers :request) alpha1::SumIntegersRequest)
(setf (get alpha1::SumIntegers :response) alpha1::SumIntegersResponse)

(defmethod alpha1::SumIntegersRequest
  (:response () (instance alpha1::SumIntegersResponse :init)))

(setf (get alpha1::SumIntegersRequest :md5sum-) "ee52d55541e33a838f1823a8e8489c7d")
(setf (get alpha1::SumIntegersRequest :datatype-) "alpha1/SumIntegersRequest")
(setf (get alpha1::SumIntegersRequest :definition-)
      "int64[] numbers
---
int64 sum
")

(setf (get alpha1::SumIntegersResponse :md5sum-) "ee52d55541e33a838f1823a8e8489c7d")
(setf (get alpha1::SumIntegersResponse :datatype-) "alpha1/SumIntegersResponse")
(setf (get alpha1::SumIntegersResponse :definition-)
      "int64[] numbers
---
int64 sum
")



(provide :alpha1/SumIntegers "ee52d55541e33a838f1823a8e8489c7d")


