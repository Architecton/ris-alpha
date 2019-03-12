;; Auto-generated. Do not edit!


(when (boundp 'alpha1::CustomMessage)
  (if (not (find-package "ALPHA1"))
    (make-package "ALPHA1"))
  (shadow 'CustomMessage (find-package "ALPHA1")))
(unless (find-package "ALPHA1::CUSTOMMESSAGE")
  (make-package "ALPHA1::CUSTOMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude CustomMessage.msg.html


(defclass alpha1::CustomMessage
  :super ros::object
  :slots (_id _message ))

(defmethod alpha1::CustomMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _message (string __message))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; uint64 _id
    8
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _id
     
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get alpha1::CustomMessage :md5sum-) "d8525a085116cba018593b4c7c160cc7")
(setf (get alpha1::CustomMessage :datatype-) "alpha1/CustomMessage")
(setf (get alpha1::CustomMessage :definition-)
      "uint64 id
string message
")



(provide :alpha1/CustomMessage "d8525a085116cba018593b4c7c160cc7")


