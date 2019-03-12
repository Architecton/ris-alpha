;; Auto-generated. Do not edit!


(when (boundp 'alpha1::MultIntegers)
  (if (not (find-package "ALPHA1"))
    (make-package "ALPHA1"))
  (shadow 'MultIntegers (find-package "ALPHA1")))
(unless (find-package "ALPHA1::MULTINTEGERS")
  (make-package "ALPHA1::MULTINTEGERS"))
(unless (find-package "ALPHA1::MULTINTEGERSREQUEST")
  (make-package "ALPHA1::MULTINTEGERSREQUEST"))
(unless (find-package "ALPHA1::MULTINTEGERSRESPONSE")
  (make-package "ALPHA1::MULTINTEGERSRESPONSE"))

(in-package "ROS")





(defclass alpha1::MultIntegersRequest
  :super ros::object
  :slots (_int_list ))

(defmethod alpha1::MultIntegersRequest
  (:init
   (&key
    ((:int_list __int_list) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _int_list __int_list)
   self)
  (:int_list
   (&optional __int_list)
   (if __int_list (setq _int_list __int_list)) _int_list)
  (:serialization-length
   ()
   (+
    ;; int64[] _int_list
    (* 8    (length _int_list)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[] _int_list
     (write-long (length _int_list) s)
     (dotimes (i (length _int_list))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _int_list i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _int_list i)) (= (length ((elt _int_list i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _int_list i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _int_list i) . bv) 1) -1) s))
             ((and (class (elt _int_list i)) (= (length ((elt _int_list i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _int_list i) . bv) 0) s)
              (write-long (if (>= (elt _int_list i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _int_list i) s)(write-long (if (>= (elt _int_list i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[] _int_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _int_list (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _int_list i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _int_list i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass alpha1::MultIntegersResponse
  :super ros::object
  :slots (_result ))

(defmethod alpha1::MultIntegersResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int64 _result
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _result
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _result (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _result) (= (length (_result . bv)) 2)) ;; bignum
              (write-long (ash (elt (_result . bv) 0) 0) s)
              (write-long (ash (elt (_result . bv) 1) -1) s))
             ((and (class _result) (= (length (_result . bv)) 1)) ;; big1
              (write-long (elt (_result . bv) 0) s)
              (write-long (if (>= _result 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _result s)(write-long (if (>= _result 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _result
#+(or :alpha :irix6 :x86_64)
      (setf _result (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _result (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass alpha1::MultIntegers
  :super ros::object
  :slots ())

(setf (get alpha1::MultIntegers :md5sum-) "99989b30d784b92ec8440f11988612b9")
(setf (get alpha1::MultIntegers :datatype-) "alpha1/MultIntegers")
(setf (get alpha1::MultIntegers :request) alpha1::MultIntegersRequest)
(setf (get alpha1::MultIntegers :response) alpha1::MultIntegersResponse)

(defmethod alpha1::MultIntegersRequest
  (:response () (instance alpha1::MultIntegersResponse :init)))

(setf (get alpha1::MultIntegersRequest :md5sum-) "99989b30d784b92ec8440f11988612b9")
(setf (get alpha1::MultIntegersRequest :datatype-) "alpha1/MultIntegersRequest")
(setf (get alpha1::MultIntegersRequest :definition-)
      "int64[] int_list
---
int64 result
")

(setf (get alpha1::MultIntegersResponse :md5sum-) "99989b30d784b92ec8440f11988612b9")
(setf (get alpha1::MultIntegersResponse :datatype-) "alpha1/MultIntegersResponse")
(setf (get alpha1::MultIntegersResponse :definition-)
      "int64[] int_list
---
int64 result
")



(provide :alpha1/MultIntegers "99989b30d784b92ec8440f11988612b9")


