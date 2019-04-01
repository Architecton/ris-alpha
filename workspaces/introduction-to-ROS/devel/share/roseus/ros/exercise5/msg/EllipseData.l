;; Auto-generated. Do not edit!


(when (boundp 'exercise5::EllipseData)
  (if (not (find-package "EXERCISE5"))
    (make-package "EXERCISE5"))
  (shadow 'EllipseData (find-package "EXERCISE5")))
(unless (find-package "EXERCISE5::ELLIPSEDATA")
  (make-package "EXERCISE5::ELLIPSEDATA"))

(in-package "ROS")
;;//! \htmlinclude EllipseData.msg.html


(defclass exercise5::EllipseData
  :super ros::object
  :slots (_found _dpt _agl _timestamp ))

(defmethod exercise5::EllipseData
  (:init
   (&key
    ((:found __found) 0)
    ((:dpt __dpt) 0.0)
    ((:agl __agl) 0.0)
    ((:timestamp __timestamp) 0.0)
    )
   (send-super :init)
   (setq _found (round __found))
   (setq _dpt (float __dpt))
   (setq _agl (float __agl))
   (setq _timestamp (float __timestamp))
   self)
  (:found
   (&optional __found)
   (if __found (setq _found __found)) _found)
  (:dpt
   (&optional __dpt)
   (if __dpt (setq _dpt __dpt)) _dpt)
  (:agl
   (&optional __agl)
   (if __agl (setq _agl __agl)) _agl)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:serialization-length
   ()
   (+
    ;; uint8 _found
    1
    ;; float64 _dpt
    8
    ;; float64 _agl
    8
    ;; float64 _timestamp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _found
       (write-byte _found s)
     ;; float64 _dpt
       (sys::poke _dpt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _agl
       (sys::poke _agl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _timestamp
       (sys::poke _timestamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _found
     (setq _found (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _dpt
     (setq _dpt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _agl
     (setq _agl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _timestamp
     (setq _timestamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get exercise5::EllipseData :md5sum-) "36c8d02dac602442e37993aa5885ef00")
(setf (get exercise5::EllipseData :datatype-) "exercise5/EllipseData")
(setf (get exercise5::EllipseData :definition-)
      "#Found flag that takes on values 1 or 0 (ellipse detected or not)
uint8 found

#Depth value at pixel representing the centre of the found ellipse
#Contains garbage if found flag value equal to 0
float64 dpt

#angle_min + index_center*angle_increment
float64 agl

#result of rospy.Time.now().to_time() when image taken
float64 timestamp

")



(provide :exercise5/EllipseData "36c8d02dac602442e37993aa5885ef00")


