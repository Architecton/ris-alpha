;; Auto-generated. Do not edit!


(when (boundp 'task2::SayCommand)
  (if (not (find-package "TASK2"))
    (make-package "TASK2"))
  (shadow 'SayCommand (find-package "TASK2")))
(unless (find-package "TASK2::SAYCOMMAND")
  (make-package "TASK2::SAYCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SayCommand.msg.html


(defclass task2::SayCommand
  :super ros::object
  :slots (_text ))

(defmethod task2::SayCommand
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

(setf (get task2::SayCommand :md5sum-) "74697ed3d931f6eede8bf3a8dfeca160")
(setf (get task2::SayCommand :datatype-) "task2/SayCommand")
(setf (get task2::SayCommand :definition-)
      "string text  #text to say. See sound_player.py for list of supported commands.

")



(provide :task2/SayCommand "74697ed3d931f6eede8bf3a8dfeca160")


