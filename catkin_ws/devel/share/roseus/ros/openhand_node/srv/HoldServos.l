;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::HoldServos)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'HoldServos (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::HOLDSERVOS")
  (make-package "OPENHAND_NODE::HOLDSERVOS"))
(unless (find-package "OPENHAND_NODE::HOLDSERVOSREQUEST")
  (make-package "OPENHAND_NODE::HOLDSERVOSREQUEST"))
(unless (find-package "OPENHAND_NODE::HOLDSERVOSRESPONSE")
  (make-package "OPENHAND_NODE::HOLDSERVOSRESPONSE"))

(in-package "ROS")





(defclass openhand_node::HoldServosRequest
  :super ros::object
  :slots (_offset_scale ))

(defmethod openhand_node::HoldServosRequest
  (:init
   (&key
    ((:offset_scale __offset_scale) 0)
    )
   (send-super :init)
   (setq _offset_scale (round __offset_scale))
   self)
  (:offset_scale
   (&optional __offset_scale)
   (if __offset_scale (setq _offset_scale __offset_scale)) _offset_scale)
  (:serialization-length
   ()
   (+
    ;; int32 _offset_scale
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _offset_scale
       (write-long _offset_scale s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _offset_scale
     (setq _offset_scale (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass openhand_node::HoldServosResponse
  :super ros::object
  :slots (_err ))

(defmethod openhand_node::HoldServosResponse
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

(defclass openhand_node::HoldServos
  :super ros::object
  :slots ())

(setf (get openhand_node::HoldServos :md5sum-) "9012ec588f6488638f420162efc2fcb2")
(setf (get openhand_node::HoldServos :datatype-) "openhand_node/HoldServos")
(setf (get openhand_node::HoldServos :request) openhand_node::HoldServosRequest)
(setf (get openhand_node::HoldServos :response) openhand_node::HoldServosResponse)

(defmethod openhand_node::HoldServosRequest
  (:response () (instance openhand_node::HoldServosResponse :init)))

(setf (get openhand_node::HoldServosRequest :md5sum-) "9012ec588f6488638f420162efc2fcb2")
(setf (get openhand_node::HoldServosRequest :datatype-) "openhand_node/HoldServosRequest")
(setf (get openhand_node::HoldServosRequest :definition-)
      "int32 offset_scale
---
int32 err

")

(setf (get openhand_node::HoldServosResponse :md5sum-) "9012ec588f6488638f420162efc2fcb2")
(setf (get openhand_node::HoldServosResponse :datatype-) "openhand_node/HoldServosResponse")
(setf (get openhand_node::HoldServosResponse :definition-)
      "int32 offset_scale
---
int32 err

")



(provide :openhand_node/HoldServos "9012ec588f6488638f420162efc2fcb2")


