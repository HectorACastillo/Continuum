;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::ReadServos)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'ReadServos (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::READSERVOS")
  (make-package "OPENHAND_NODE::READSERVOS"))
(unless (find-package "OPENHAND_NODE::READSERVOSREQUEST")
  (make-package "OPENHAND_NODE::READSERVOSREQUEST"))
(unless (find-package "OPENHAND_NODE::READSERVOSRESPONSE")
  (make-package "OPENHAND_NODE::READSERVOSRESPONSE"))

(in-package "ROS")





(defclass openhand_node::ReadServosRequest
  :super ros::object
  :slots ())

(defmethod openhand_node::ReadServosRequest
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

(defclass openhand_node::ReadServosResponse
  :super ros::object
  :slots (_pos _enc _ref ))

(defmethod openhand_node::ReadServosResponse
  (:init
   (&key
    ((:pos __pos) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:enc __enc) (make-array 0 :initial-element 0 :element-type :integer))
    ((:ref __ref) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _pos __pos)
   (setq _enc __enc)
   (setq _ref __ref)
   self)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:enc
   (&optional __enc)
   (if __enc (setq _enc __enc)) _enc)
  (:ref
   (&optional __ref)
   (if __ref (setq _ref __ref)) _ref)
  (:serialization-length
   ()
   (+
    ;; float32[] _pos
    (* 4    (length _pos)) 4
    ;; int32[] _enc
    (* 4    (length _enc)) 4
    ;; float32[] _ref
    (* 4    (length _ref)) 4
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
     ;; int32[] _enc
     (write-long (length _enc) s)
     (dotimes (i (length _enc))
       (write-long (elt _enc i) s)
       )
     ;; float32[] _ref
     (write-long (length _ref) s)
     (dotimes (i (length _ref))
       (sys::poke (elt _ref i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; int32[] _enc
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _enc (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _enc i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _ref
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ref (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ref i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand_node::ReadServos
  :super ros::object
  :slots ())

(setf (get openhand_node::ReadServos :md5sum-) "662e32bfc46f37715bb1455cf7d299a9")
(setf (get openhand_node::ReadServos :datatype-) "openhand_node/ReadServos")
(setf (get openhand_node::ReadServos :request) openhand_node::ReadServosRequest)
(setf (get openhand_node::ReadServos :response) openhand_node::ReadServosResponse)

(defmethod openhand_node::ReadServosRequest
  (:response () (instance openhand_node::ReadServosResponse :init)))

(setf (get openhand_node::ReadServosRequest :md5sum-) "662e32bfc46f37715bb1455cf7d299a9")
(setf (get openhand_node::ReadServosRequest :datatype-) "openhand_node/ReadServosRequest")
(setf (get openhand_node::ReadServosRequest :definition-)
      "---
float32[] pos
int32[] enc
float32[] ref

")

(setf (get openhand_node::ReadServosResponse :md5sum-) "662e32bfc46f37715bb1455cf7d299a9")
(setf (get openhand_node::ReadServosResponse :datatype-) "openhand_node/ReadServosResponse")
(setf (get openhand_node::ReadServosResponse :definition-)
      "---
float32[] pos
int32[] enc
float32[] ref

")



(provide :openhand_node/ReadServos "662e32bfc46f37715bb1455cf7d299a9")


