;; Auto-generated. Do not edit!


(when (boundp 'task3::ScanFlag)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'ScanFlag (find-package "TASK3")))
(unless (find-package "TASK3::SCANFLAG")
  (make-package "TASK3::SCANFLAG"))

(in-package "ROS")
;;//! \htmlinclude ScanFlag.msg.html


(defclass task3::ScanFlag
  :super ros::object
  :slots (_flag ))

(defmethod task3::ScanFlag
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

(setf (get task3::ScanFlag :md5sum-) "b6a8907dbdc46dea839fb59e243dc983")
(setf (get task3::ScanFlag :datatype-) "task3/ScanFlag")
(setf (get task3::ScanFlag :definition-)
      "uint8 flag
")



(provide :task3/ScanFlag "b6a8907dbdc46dea839fb59e243dc983")


