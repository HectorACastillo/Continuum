;; Auto-generated. Do not edit!


(when (boundp 'openhand_node::ReadTemperature)
  (if (not (find-package "OPENHAND_NODE"))
    (make-package "OPENHAND_NODE"))
  (shadow 'ReadTemperature (find-package "OPENHAND_NODE")))
(unless (find-package "OPENHAND_NODE::READTEMPERATURE")
  (make-package "OPENHAND_NODE::READTEMPERATURE"))
(unless (find-package "OPENHAND_NODE::READTEMPERATUREREQUEST")
  (make-package "OPENHAND_NODE::READTEMPERATUREREQUEST"))
(unless (find-package "OPENHAND_NODE::READTEMPERATURERESPONSE")
  (make-package "OPENHAND_NODE::READTEMPERATURERESPONSE"))

(in-package "ROS")





(defclass openhand_node::ReadTemperatureRequest
  :super ros::object
  :slots ())

(defmethod openhand_node::ReadTemperatureRequest
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

(defclass openhand_node::ReadTemperatureResponse
  :super ros::object
  :slots (_temp ))

(defmethod openhand_node::ReadTemperatureResponse
  (:init
   (&key
    ((:temp __temp) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _temp __temp)
   self)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; float32[] _temp
    (* 4    (length _temp)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _temp
     (write-long (length _temp) s)
     (dotimes (i (length _temp))
       (sys::poke (elt _temp i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _temp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _temp (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _temp i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass openhand_node::ReadTemperature
  :super ros::object
  :slots ())

(setf (get openhand_node::ReadTemperature :md5sum-) "52444e69c3eaa80dd939a5bad6dbe319")
(setf (get openhand_node::ReadTemperature :datatype-) "openhand_node/ReadTemperature")
(setf (get openhand_node::ReadTemperature :request) openhand_node::ReadTemperatureRequest)
(setf (get openhand_node::ReadTemperature :response) openhand_node::ReadTemperatureResponse)

(defmethod openhand_node::ReadTemperatureRequest
  (:response () (instance openhand_node::ReadTemperatureResponse :init)))

(setf (get openhand_node::ReadTemperatureRequest :md5sum-) "52444e69c3eaa80dd939a5bad6dbe319")
(setf (get openhand_node::ReadTemperatureRequest :datatype-) "openhand_node/ReadTemperatureRequest")
(setf (get openhand_node::ReadTemperatureRequest :definition-)
      "---
float32[] temp

")

(setf (get openhand_node::ReadTemperatureResponse :md5sum-) "52444e69c3eaa80dd939a5bad6dbe319")
(setf (get openhand_node::ReadTemperatureResponse :datatype-) "openhand_node/ReadTemperatureResponse")
(setf (get openhand_node::ReadTemperatureResponse :definition-)
      "---
float32[] temp

")



(provide :openhand_node/ReadTemperature "52444e69c3eaa80dd939a5bad6dbe319")


