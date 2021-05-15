;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::MoveServos)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'MoveServos (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::MOVESERVOS")
  (make-package "OPENHAND_NODE::MOVESERVOS"))
(unless (find-package "OPENHAND_NODE::MOVESERVOSREQUEST")
  (make-package "OPENHAND_NODE::MOVESERVOSREQUEST"))
(unless (find-package "OPENHAND_NODE::MOVESERVOSRESPONSE")
  (make-package "OPENHAND_NODE::MOVESERVOSRESPONSE"))

(in-package "ROS")





(defclass openhand_node::MoveServosRequest
  :super ros::object
  :slots (_pos ))

(defmethod openhand_node::MoveServosRequest
  (:init
   (&key
    ((:pos __pos) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _pos __pos)
   self)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:serialization-length
   ()
   (+
    ;; float32[] _pos
    (* 4    (length _pos)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _pos
     (write-long (length _pos) s)
     (dotimes (i (length _pos))
       (sys::poke (elt _pos i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _pos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pos i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand_node::MoveServosResponse
  :super ros::object
  :slots (_err ))

(defmethod openhand_node::MoveServosResponse
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

(defclass openhand_node::MoveServos
  :super ros::object
  :slots ())

(setf (get openhand_node::MoveServos :md5sum-) "183031e0becb89936a926d61b84a7478")
(setf (get openhand_node::MoveServos :datatype-) "openhand_node/MoveServos")
(setf (get openhand_node::MoveServos :request) openhand_node::MoveServosRequest)
(setf (get openhand_node::MoveServos :response) openhand_node::MoveServosResponse)

(defmethod openhand_node::MoveServosRequest
  (:response () (instance openhand_node::MoveServosResponse :init)))

(setf (get openhand_node::MoveServosRequest :md5sum-) "183031e0becb89936a926d61b84a7478")
(setf (get openhand_node::MoveServosRequest :datatype-) "openhand_node/MoveServosRequest")
(setf (get openhand_node::MoveServosRequest :definition-)
      "float32[] pos
---
int32 err

")

(setf (get openhand_node::MoveServosResponse :md5sum-) "183031e0becb89936a926d61b84a7478")
(setf (get openhand_node::MoveServosResponse :datatype-) "openhand_node/MoveServosResponse")
(setf (get openhand_node::MoveServosResponse :definition-)
      "float32[] pos
---
int32 err

")



(provide :openhand_node/MoveServos "183031e0becb89936a926d61b84a7478")


