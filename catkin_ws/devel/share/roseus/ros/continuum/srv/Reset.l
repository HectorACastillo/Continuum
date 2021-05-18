;; Auto-generated. Do not edit!


(when (boundp 'continuum::Reset)
  (if (not (find-package "CONTINUUM"))
    (make-package "CONTINUUM"))
  (shadow 'Reset (find-package "CONTINUUM")))
(unless (find-package "CONTINUUM::RESET")
  (make-package "CONTINUUM::RESET"))
(unless (find-package "CONTINUUM::RESETREQUEST")
  (make-package "CONTINUUM::RESETREQUEST"))
(unless (find-package "CONTINUUM::RESETRESPONSE")
  (make-package "CONTINUUM::RESETRESPONSE"))

(in-package "ROS")





(defclass continuum::ResetRequest
  :super ros::object
  :slots ())

(defmethod continuum::ResetRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass continuum::ResetResponse
  :super ros::object
  :slots (_err ))

(defmethod continuum::ResetResponse
  (:init
   (&key
    ((:err __err) 0)
    )
   (send-super :init)
   (setq _err (round __err))
   self)
  (:err
   (&optional __err)
   (if __err (setq _err __err)) _err)
  (:serialization-length
   ()
   (+
    ;; int32 _err
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _err
       (write-long _err s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _err
     (setq _err (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass continuum::Reset
  :super ros::object
  :slots ())

(setf (get continuum::Reset :md5sum-) "b6e094011a4dfaee5eddf447220446cf")
(setf (get continuum::Reset :datatype-) "continuum/Reset")
(setf (get continuum::Reset :request) continuum::ResetRequest)
(setf (get continuum::Reset :response) continuum::ResetResponse)

(defmethod continuum::ResetRequest
  (:response () (instance continuum::ResetResponse :init)))

(setf (get continuum::ResetRequest :md5sum-) "b6e094011a4dfaee5eddf447220446cf")
(setf (get continuum::ResetRequest :datatype-) "continuum/ResetRequest")
(setf (get continuum::ResetRequest :definition-)
      "---
int32 err
")

(setf (get continuum::ResetResponse :md5sum-) "b6e094011a4dfaee5eddf447220446cf")
(setf (get continuum::ResetResponse :datatype-) "continuum/ResetResponse")
(setf (get continuum::ResetResponse :definition-)
      "---
int32 err
")



(provide :continuum/Reset "b6e094011a4dfaee5eddf447220446cf")


