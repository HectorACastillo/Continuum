;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::ReadLoad)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'ReadLoad (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::READLOAD")
  (make-package "OPENHAND_NODE::READLOAD"))
(unless (find-package "OPENHAND_NODE::READLOADREQUEST")
  (make-package "OPENHAND_NODE::READLOADREQUEST"))
(unless (find-package "OPENHAND_NODE::READLOADRESPONSE")
  (make-package "OPENHAND_NODE::READLOADRESPONSE"))

(in-package "ROS")





(defclass openhand_node::ReadLoadRequest
  :super ros::object
  :slots ())

(defmethod openhand_node::ReadLoadRequest
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

(defclass openhand_node::ReadLoadResponse
  :super ros::object
  :slots (_load ))

(defmethod openhand_node::ReadLoadResponse
  (:init
   (&key
    ((:load __load) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _load __load)
   self)
  (:load
   (&optional __load)
   (if __load (setq _load __load)) _load)
  (:serialization-length
   ()
   (+
    ;; float32[] _load
    (* 4    (length _load)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _load
     (write-long (length _load) s)
     (dotimes (i (length _load))
       (sys::poke (elt _load i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _load
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _load (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _load i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand_node::ReadLoad
  :super ros::object
  :slots ())

(setf (get openhand_node::ReadLoad :md5sum-) "484bc5de2725aa512e1b0578d3e540c4")
(setf (get openhand_node::ReadLoad :datatype-) "openhand_node/ReadLoad")
(setf (get openhand_node::ReadLoad :request) openhand_node::ReadLoadRequest)
(setf (get openhand_node::ReadLoad :response) openhand_node::ReadLoadResponse)

(defmethod openhand_node::ReadLoadRequest
  (:response () (instance openhand_node::ReadLoadResponse :init)))

(setf (get openhand_node::ReadLoadRequest :md5sum-) "484bc5de2725aa512e1b0578d3e540c4")
(setf (get openhand_node::ReadLoadRequest :datatype-) "openhand_node/ReadLoadRequest")
(setf (get openhand_node::ReadLoadRequest :definition-)
      "---
float32[] load

")

(setf (get openhand_node::ReadLoadResponse :md5sum-) "484bc5de2725aa512e1b0578d3e540c4")
(setf (get openhand_node::ReadLoadResponse :datatype-) "openhand_node/ReadLoadResponse")
(setf (get openhand_node::ReadLoadResponse :definition-)
      "---
float32[] load

")



(provide :openhand_node/ReadLoad "484bc5de2725aa512e1b0578d3e540c4")


