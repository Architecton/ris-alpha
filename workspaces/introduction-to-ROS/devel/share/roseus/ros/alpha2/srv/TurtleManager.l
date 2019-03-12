;; Auto-generated. Do not edit!


(when (boundp 'alpha2::TurtleManager)
  (if (not (find-package "ALPHA2"))
    (make-package "ALPHA2"))
  (shadow 'TurtleManager (find-package "ALPHA2")))
(unless (find-package "ALPHA2::TURTLEMANAGER")
  (make-package "ALPHA2::TURTLEMANAGER"))
(unless (find-package "ALPHA2::TURTLEMANAGERREQUEST")
  (make-package "ALPHA2::TURTLEMANAGERREQUEST"))
(unless (find-package "ALPHA2::TURTLEMANAGERRESPONSE")
  (make-package "ALPHA2::TURTLEMANAGERRESPONSE"))

(in-package "ROS")





(defclass alpha2::TurtleManagerRequest
  :super ros::object
  :slots (_trajection _duration ))

(defmethod alpha2::TurtleManagerRequest
  (:init
   (&key
    ((:trajection __trajection) "")
    ((:duration __duration) 0)
    )
   (send-super :init)
   (setq _trajection (string __trajection))
   (setq _duration (round __duration))
   self)
  (:trajection
   (&optional __trajection)
   (if __trajection (setq _trajection __trajection)) _trajection)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; string _trajection
    4 (length _trajection)
    ;; uint64 _duration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _trajection
       (write-long (length _trajection) s) (princ _trajection s)
     ;; uint64 _duration
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _duration (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _duration) (= (length (_duration . bv)) 2)) ;; bignum
              (write-long (ash (elt (_duration . bv) 0) 0) s)
              (write-long (ash (elt (_duration . bv) 1) -1) s))
             ((and (class _duration) (= (length (_duration . bv)) 1)) ;; big1
              (write-long (elt (_duration . bv) 0) s)
              (write-long (if (>= _duration 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _duration s)(write-long (if (>= _duration 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _trajection
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _trajection (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint64 _duration
     
#+(or :alpha :irix6 :x86_64)
      (setf _duration (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _duration (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass alpha2::TurtleManagerResponse
  :super ros::object
  :slots (_lastmovement ))

(defmethod alpha2::TurtleManagerResponse
  (:init
   (&key
    ((:lastmovement __lastmovement) "")
    )
   (send-super :init)
   (setq _lastmovement (string __lastmovement))
   self)
  (:lastmovement
   (&optional __lastmovement)
   (if __lastmovement (setq _lastmovement __lastmovement)) _lastmovement)
  (:serialization-length
   ()
   (+
    ;; string _lastmovement
    4 (length _lastmovement)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _lastmovement
       (write-long (length _lastmovement) s) (princ _lastmovement s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _lastmovement
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _lastmovement (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass alpha2::TurtleManager
  :super ros::object
  :slots ())

(setf (get alpha2::TurtleManager :md5sum-) "c4a7b5d4e57b122dab2b47a5dca00961")
(setf (get alpha2::TurtleManager :datatype-) "alpha2/TurtleManager")
(setf (get alpha2::TurtleManager :request) alpha2::TurtleManagerRequest)
(setf (get alpha2::TurtleManager :response) alpha2::TurtleManagerResponse)

(defmethod alpha2::TurtleManagerRequest
  (:response () (instance alpha2::TurtleManagerResponse :init)))

(setf (get alpha2::TurtleManagerRequest :md5sum-) "c4a7b5d4e57b122dab2b47a5dca00961")
(setf (get alpha2::TurtleManagerRequest :datatype-) "alpha2/TurtleManagerRequest")
(setf (get alpha2::TurtleManagerRequest :definition-)
      "string trajection
uint64 duration
---
string lastmovement
")

(setf (get alpha2::TurtleManagerResponse :md5sum-) "c4a7b5d4e57b122dab2b47a5dca00961")
(setf (get alpha2::TurtleManagerResponse :datatype-) "alpha2/TurtleManagerResponse")
(setf (get alpha2::TurtleManagerResponse :definition-)
      "string trajection
uint64 duration
---
string lastmovement
")



(provide :alpha2/TurtleManager "c4a7b5d4e57b122dab2b47a5dca00961")


