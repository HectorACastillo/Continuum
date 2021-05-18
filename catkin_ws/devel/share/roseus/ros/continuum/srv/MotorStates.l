;; Auto-generated. Do not edit!


(when (boundp 'continuum::MotorStates)
  (if (not (find-package "CONTINUUM"))
    (make-package "CONTINUUM"))
  (shadow 'MotorStates (find-package "CONTINUUM")))
(unless (find-package "CONTINUUM::MOTORSTATES")
  (make-package "CONTINUUM::MOTORSTATES"))
(unless (find-package "CONTINUUM::MOTORSTATESREQUEST")
  (make-package "CONTINUUM::MOTORSTATESREQUEST"))
(unless (find-package "CONTINUUM::MOTORSTATESRESPONSE")
  (make-package "CONTINUUM::MOTORSTATESRESPONSE"))

(in-package "ROS")





(defclass continuum::MotorStatesRequest
  :super ros::object
  :slots ())

(defmethod continuum::MotorStatesRequest
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

(defclass continuum::MotorStatesResponse
  :super ros::object
  :slots (_states _err ))

(defmethod continuum::MotorStatesResponse
  (:init
   (&key
    ((:states __states) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:err __err) 0)
    )
   (send-super :init)
   (setq _states __states)
   (setq _err (round __err))
   self)
  (:states
   (&optional __states)
   (if __states (setq _states __states)) _states)
  (:err
   (&optional __err)
   (if __err (setq _err __err)) _err)
  (:serialization-length
   ()
   (+
    ;; float32[] _states
    (* 4    (length _states)) 4
    ;; int32 _err
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _states
     (write-long (length _states) s)
     (dotimes (i (length _states))
       (sys::poke (elt _states i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _err
       (write-long _err s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _states (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _states i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _err
     (setq _err (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass continuum::MotorStates
  :super ros::object
  :slots ())

(setf (get continuum::MotorStates :md5sum-) "234b96902b9e5908267e7e3b9c5ca30f")
(setf (get continuum::MotorStates :datatype-) "continuum/MotorStates")
(setf (get continuum::MotorStates :request) continuum::MotorStatesRequest)
(setf (get continuum::MotorStates :response) continuum::MotorStatesResponse)

(defmethod continuum::MotorStatesRequest
  (:response () (instance continuum::MotorStatesResponse :init)))

(setf (get continuum::MotorStatesRequest :md5sum-) "234b96902b9e5908267e7e3b9c5ca30f")
(setf (get continuum::MotorStatesRequest :datatype-) "continuum/MotorStatesRequest")
(setf (get continuum::MotorStatesRequest :definition-)
      "---
float32[] states
int32 err
")

(setf (get continuum::MotorStatesResponse :md5sum-) "234b96902b9e5908267e7e3b9c5ca30f")
(setf (get continuum::MotorStatesResponse :datatype-) "continuum/MotorStatesResponse")
(setf (get continuum::MotorStatesResponse :definition-)
      "---
float32[] states
int32 err
")



(provide :continuum/MotorStates "234b96902b9e5908267e7e3b9c5ca30f")


