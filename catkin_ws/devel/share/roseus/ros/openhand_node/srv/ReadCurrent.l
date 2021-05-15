;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::ReadCurrent)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'ReadCurrent (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::READCURRENT")
  (make-package "OPENHAND_NODE::READCURRENT"))
(unless (find-package "OPENHAND_NODE::READCURRENTREQUEST")
  (make-package "OPENHAND_NODE::READCURRENTREQUEST"))
(unless (find-package "OPENHAND_NODE::READCURRENTRESPONSE")
  (make-package "OPENHAND_NODE::READCURRENTRESPONSE"))

(in-package "ROS")





(defclass openhand_node::ReadCurrentRequest
  :super ros::object
  :slots ())

(defmethod openhand_node::ReadCurrentRequest
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

(defclass openhand_node::ReadCurrentResponse
  :super ros::object
  :slots (_curr ))

(defmethod openhand_node::ReadCurrentResponse
  (:init
   (&key
    ((:curr __curr) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _curr __curr)
   self)
  (:curr
   (&optional __curr)
   (if __curr (setq _curr __curr)) _curr)
  (:serialization-length
   ()
   (+
    ;; float32[] _curr
    (* 4    (length _curr)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _curr
     (write-long (length _curr) s)
     (dotimes (i (length _curr))
       (sys::poke (elt _curr i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _curr
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _curr (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _curr i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand_node::ReadCurrent
  :super ros::object
  :slots ())

(setf (get openhand_node::ReadCurrent :md5sum-) "640c8d4d28b8ccb823cd749d0957df5a")
(setf (get openhand_node::ReadCurrent :datatype-) "openhand_node/ReadCurrent")
(setf (get openhand_node::ReadCurrent :request) openhand_node::ReadCurrentRequest)
(setf (get openhand_node::ReadCurrent :response) openhand_node::ReadCurrentResponse)

(defmethod openhand_node::ReadCurrentRequest
  (:response () (instance openhand_node::ReadCurrentResponse :init)))

(setf (get openhand_node::ReadCurrentRequest :md5sum-) "640c8d4d28b8ccb823cd749d0957df5a")
(setf (get openhand_node::ReadCurrentRequest :datatype-) "openhand_node/ReadCurrentRequest")
(setf (get openhand_node::ReadCurrentRequest :definition-)
      "---
float32[] curr

")

(setf (get openhand_node::ReadCurrentResponse :md5sum-) "640c8d4d28b8ccb823cd749d0957df5a")
(setf (get openhand_node::ReadCurrentResponse :datatype-) "openhand_node/ReadCurrentResponse")
(setf (get openhand_node::ReadCurrentResponse :definition-)
      "---
float32[] curr

")



(provide :openhand_node/ReadCurrent "640c8d4d28b8ccb823cd749d0957df5a")


