;; Auto-generated. Do not edit!


(when (boundp 'task3::CylinderData)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'CylinderData (find-package "TASK3")))
(unless (find-package "TASK3::CYLINDERDATA")
  (make-package "TASK3::CYLINDERDATA"))

(in-package "ROS")
;;//! \htmlinclude CylinderData.msg.html


(defclass task3::CylinderData
  :super ros::object
  :slots (_found _dpt _agl _timestamp _perp_agl _perp_y_itrcpt ))

(defmethod task3::CylinderData
  (:init
   (&key
    ((:found __found) 0)
    ((:dpt __dpt) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:agl __agl) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:timestamp __timestamp) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:perp_agl __perp_agl) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:perp_y_itrcpt __perp_y_itrcpt) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _found (round __found))
   (setq _dpt __dpt)
   (setq _agl __agl)
   (setq _timestamp __timestamp)
   (setq _perp_agl __perp_agl)
   (setq _perp_y_itrcpt __perp_y_itrcpt)
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
  (:perp_agl
   (&optional __perp_agl)
   (if __perp_agl (setq _perp_agl __perp_agl)) _perp_agl)
  (:perp_y_itrcpt
   (&optional __perp_y_itrcpt)
   (if __perp_y_itrcpt (setq _perp_y_itrcpt __perp_y_itrcpt)) _perp_y_itrcpt)
  (:serialization-length
   ()
   (+
    ;; uint8 _found
    1
    ;; float64[] _dpt
    (* 8    (length _dpt)) 4
    ;; float64[] _agl
    (* 8    (length _agl)) 4
    ;; float64[] _timestamp
    (* 8    (length _timestamp)) 4
    ;; float64[] _perp_agl
    (* 8    (length _perp_agl)) 4
    ;; float64[] _perp_y_itrcpt
    (* 8    (length _perp_y_itrcpt)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _found
       (write-byte _found s)
     ;; float64[] _dpt
     (write-long (length _dpt) s)
     (dotimes (i (length _dpt))
       (sys::poke (elt _dpt i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _agl
     (write-long (length _agl) s)
     (dotimes (i (length _agl))
       (sys::poke (elt _agl i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _timestamp
     (write-long (length _timestamp) s)
     (dotimes (i (length _timestamp))
       (sys::poke (elt _timestamp i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _perp_agl
     (write-long (length _perp_agl) s)
     (dotimes (i (length _perp_agl))
       (sys::poke (elt _perp_agl i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _perp_y_itrcpt
     (write-long (length _perp_y_itrcpt) s)
     (dotimes (i (length _perp_y_itrcpt))
       (sys::poke (elt _perp_y_itrcpt i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _found
     (setq _found (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64[] _dpt
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dpt (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _dpt i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _agl
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _agl (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _agl i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _timestamp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _timestamp (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _timestamp i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _perp_agl
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _perp_agl (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _perp_agl i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _perp_y_itrcpt
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _perp_y_itrcpt (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _perp_y_itrcpt i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get task3::CylinderData :md5sum-) "d912b32b2cc4be2dc6d9a88df7bfe800")
(setf (get task3::CylinderData :datatype-) "task3/CylinderData")
(setf (get task3::CylinderData :definition-)
      "#Found flag that takes on values 1 or 0 (cylinder detected or not)
uint8 found

#Depth value at pixel representing the centre of the found cylinder
#Contains garbage if found flag value equal to 0
float64[] dpt

#angle_min + index_center*angle_increment
float64[] agl

#result of rospy.Time.now().to_time() when image taken
float64[] timestamp

#angle of line perpendicular to the face of the cylinder
float64[] perp_agl

#y intercept of the line perpendicular to the face of the cylinder
float64[] perp_y_itrcpt

")



(provide :task3/CylinderData "d912b32b2cc4be2dc6d9a88df7bfe800")


