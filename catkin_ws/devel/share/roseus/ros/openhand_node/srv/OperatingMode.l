;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::OperatingMode)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'OperatingMode (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::OPERATINGMODE")
  (make-package "OPENHAND_NODE::OPERATINGMODE"))
(unless (find-package "OPENHAND_NODE::OPERATINGMODEREQUEST")
  (make-package "OPENHAND_NODE::OPERATINGMODEREQUEST"))
(unless (find-package "OPENHAND_NODE::OPERATINGMODERESPONSE")
  (make-package "OPENHAND_NODE::OPERATINGMODERESPONSE"))

(in-package "ROS")





(defclass openhand_node::OperatingModeRequest
  :super ros::object
  :slots (_pos_control _servo_indices ))

(defmethod openhand_node::OperatingModeRequest
  (:init
   (&key
    ((:pos_control __pos_control) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:servo_indices __servo_indices) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _pos_control __pos_control)
   (setq _servo_indices __servo_indices)
   self)
  (:pos_control
   (&optional __pos_control)
   (if __pos_control (setq _pos_control __pos_control)) _pos_control)
  (:servo_indices
   (&optional __servo_indices)
   (if __servo_indices (setq _servo_indices __servo_indices)) _servo_indices)
  (:serialization-length
   ()
   (+
    ;; bool[] _pos_control
    (* 1    (length _pos_control)) 4
    ;; int32[] _servo_indices
    (* 4    (length _servo_indices)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _pos_control
     (write-long (length _pos_control) s)
     (dotimes (i (length _pos_control))
       (if (elt _pos_control i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; int32[] _servo_indices
     (write-long (length _servo_indices) s)
     (dotimes (i (length _servo_indices))
       (write-long (elt _servo_indices i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _pos_control
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos_control (make-list n))
     (dotimes (i n)
     (setf (elt _pos_control i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; int32[] _servo_indices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servo_indices (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _servo_indices i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand_node::OperatingModeResponse
  :super ros::object
  :slots (_err ))

(defmethod openhand_node::OperatingModeResponse
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

(defclass openhand_node::OperatingMode
  :super ros::object
  :slots ())

(setf (get openhand_node::OperatingMode :md5sum-) "de2e40c8f82c8a51269f155066572b24")
(setf (get openhand_node::OperatingMode :datatype-) "openhand_node/OperatingMode")
(setf (get openhand_node::OperatingMode :request) openhand_node::OperatingModeRequest)
(setf (get openhand_node::OperatingMode :response) openhand_node::OperatingModeResponse)

(defmethod openhand_node::OperatingModeRequest
  (:response () (instance openhand_node::OperatingModeResponse :init)))

(setf (get openhand_node::OperatingModeRequest :md5sum-) "de2e40c8f82c8a51269f155066572b24")
(setf (get openhand_node::OperatingModeRequest :datatype-) "openhand_node/OperatingModeRequest")
(setf (get openhand_node::OperatingModeRequest :definition-)
      "bool[] pos_control
int32[] servo_indices
---
int32 err

")

(setf (get openhand_node::OperatingModeResponse :md5sum-) "de2e40c8f82c8a51269f155066572b24")
(setf (get openhand_node::OperatingModeResponse :datatype-) "openhand_node/OperatingModeResponse")
(setf (get openhand_node::OperatingModeResponse :definition-)
      "bool[] pos_control
int32[] servo_indices
---
int32 err

")



(provide :openhand_node/OperatingMode "de2e40c8f82c8a51269f155066572b24")


