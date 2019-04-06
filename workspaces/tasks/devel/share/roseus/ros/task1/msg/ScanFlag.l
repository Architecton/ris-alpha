;; Auto-generated. Do not edit!


(when (boundp 'task1::ScanFlag)
  (if (not (find-package "TASK1"))
    (make-package "TASK1"))
  (shadow 'ScanFlag (find-package "TASK1")))
(unless (find-package "TASK1::SCANFLAG")
  (make-package "TASK1::SCANFLAG"))

(in-package "ROS")
;;//! \htmlinclude ScanFlag.msg.html


(defclass task1::ScanFlag
  :super ros::object
  :slots (_flag ))

(defmethod task1::ScanFlag
  (:init
   (&key
    ((:flag __flag) 0)
    )
   (send-super :init)
   (setq _flag (round __flag))
   self)
  (:flag
   (&optional __flag)
   (if __flag (setq _flag __flag)) _flag)
  (:serialization-length
   ()
   (+
    ;; uint8 _flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _flag
       (write-byte _flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _flag
     (setq _flag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get task1::ScanFlag :md5sum-) "b6a8907dbdc46dea839fb59e243dc983")
(setf (get task1::ScanFlag :datatype-) "task1/ScanFlag")
(setf (get task1::ScanFlag :definition-)
      "uint8 flag
")



(provide :task1/ScanFlag "b6a8907dbdc46dea839fb59e243dc983")


