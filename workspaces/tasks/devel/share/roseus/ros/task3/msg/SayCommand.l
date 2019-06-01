;; Auto-generated. Do not edit!


(when (boundp 'task3::SayCommand)
  (if (not (find-package "TASK3"))
    (make-package "TASK3"))
  (shadow 'SayCommand (find-package "TASK3")))
(unless (find-package "TASK3::SAYCOMMAND")
  (make-package "TASK3::SAYCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SayCommand.msg.html


(defclass task3::SayCommand
  :super ros::object
  :slots (_text ))

(defmethod task3::SayCommand
  (:init
   (&key
    ((:text __text) "")
    )
   (send-super :init)
   (setq _text (string __text))
   self)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:serialization-length
   ()
   (+
    ;; string _text
    4 (length _text)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get task3::SayCommand :md5sum-) "74697ed3d931f6eede8bf3a8dfeca160")
(setf (get task3::SayCommand :datatype-) "task3/SayCommand")
(setf (get task3::SayCommand :definition-)
      "string text  #text to say. See sound_player.py for list of supported commands.

")



(provide :task3/SayCommand "74697ed3d931f6eede8bf3a8dfeca160")


