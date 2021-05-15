;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::TorqueServos)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'TorqueServos (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::TORQUESERVOS")
  (make-package "OPENHAND_NODE::TORQUESERVOS"))
(unless (find-package "OPENHAND_NODE::TORQUESERVOSREQUEST")
  (make-package "OPENHAND_NODE::TORQUESERVOSREQUEST"))
(unless (find-package "OPENHAND_NODE::TORQUESERVOSRESPONSE")
  (make-package "OPENHAND_NODE::TORQUESERVOSRESPONSE"))

(in-package "ROS")





(defclass openhand_node::TorqueServosRequest
  :super ros::object
  :slots (_servo_indices _torq ))

(defmethod openhand_node::TorqueServosRequest
  (:init
   (&key
    ((:servo_indices __servo_indices) (make-array 0 :initial-element 0 :element-type :integer))
    ((:torq __torq) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _servo_indices __servo_indices)
   (setq _torq __torq)
   self)
  (:servo_indices
   (&optional __servo_indices)
   (if __servo_indices (setq _servo_indices __servo_indices)) _servo_indices)
  (:torq
   (&optional __torq)
   (if __torq (setq _torq __torq)) _torq)
  (:serialization-length
   ()
   (+
    ;; int32[] _servo_indices
    (* 4    (length _servo_indices)) 4
    ;; float32[] _torq
    (* 4    (length _torq)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _servo_indices
     (write-long (length _servo_indices) s)
     (dotimes (i (length _servo_indices))
       (write-long (elt _servo_indices i) s)
       )
     ;; float32[] _torq
     (write-long (length _torq) s)
     (dotimes (i (length _torq))
       (sys::poke (elt _torq i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _servo_indices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servo_indices (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _servo_indices i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _torq
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _torq (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _torq i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand_node::TorqueServosResponse
  :super ros::object
  :slots (_err ))

(defmethod openhand_node::TorqueServosResponse
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

(defclass openhand_node::TorqueServos
  :super ros::object
  :slots ())

(setf (get openhand_node::TorqueServos :md5sum-) "5ef27f5b23c316f62d99934009982e26")
(setf (get openhand_node::TorqueServos :datatype-) "openhand_node/TorqueServos")
(setf (get openhand_node::TorqueServos :request) openhand_node::TorqueServosRequest)
(setf (get openhand_node::TorqueServos :response) openhand_node::TorqueServosResponse)

(defmethod openhand_node::TorqueServosRequest
  (:response () (instance openhand_node::TorqueServosResponse :init)))

(setf (get openhand_node::TorqueServosRequest :md5sum-) "5ef27f5b23c316f62d99934009982e26")
(setf (get openhand_node::TorqueServosRequest :datatype-) "openhand_node/TorqueServosRequest")
(setf (get openhand_node::TorqueServosRequest :definition-)
      "int32[] servo_indices
float32[] torq
---
int32 err

")

(setf (get openhand_node::TorqueServosResponse :md5sum-) "5ef27f5b23c316f62d99934009982e26")
(setf (get openhand_node::TorqueServosResponse :datatype-) "openhand_node/TorqueServosResponse")
(setf (get openhand_node::TorqueServosResponse :definition-)
      "int32[] servo_indices
float32[] torq
---
int32 err

")



(provide :openhand_node/TorqueServos "5ef27f5b23c316f62d99934009982e26")


