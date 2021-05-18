;; Auto-generated. Do not edit!


(when (boundp 'continuum::GoTo)
  (if (not (find-package "CONTINUUM"))
    (make-package "CONTINUUM"))
  (shadow 'GoTo (find-package "CONTINUUM")))
(unless (find-package "CONTINUUM::GOTO")
  (make-package "CONTINUUM::GOTO"))
(unless (find-package "CONTINUUM::GOTOREQUEST")
  (make-package "CONTINUUM::GOTOREQUEST"))
(unless (find-package "CONTINUUM::GOTORESPONSE")
  (make-package "CONTINUUM::GOTORESPONSE"))

(in-package "ROS")





(defclass continuum::GoToRequest
  :super ros::object
  :slots (_rho _theta _speed _K _open ))

(defmethod continuum::GoToRequest
  (:init
   (&key
    ((:rho __rho) 0.0)
    ((:theta __theta) 0.0)
    ((:speed __speed) 0.0)
    ((:K __K) 0.0)
    ((:open __open) nil)
    )
   (send-super :init)
   (setq _rho (float __rho))
   (setq _theta (float __theta))
   (setq _speed (float __speed))
   (setq _K (float __K))
   (setq _open __open)
   self)
  (:rho
   (&optional __rho)
   (if __rho (setq _rho __rho)) _rho)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:K
   (&optional __K)
   (if __K (setq _K __K)) _K)
  (:open
   (&optional __open)
   (if __open (setq _open __open)) _open)
  (:serialization-length
   ()
   (+
    ;; float32 _rho
    4
    ;; float32 _theta
    4
    ;; float32 _speed
    4
    ;; float32 _K
    4
    ;; bool _open
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _rho
       (sys::poke _rho (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _K
       (sys::poke _K (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _open
       (if _open (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _rho
     (setq _rho (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _K
     (setq _K (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _open
     (setq _open (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass continuum::GoToResponse
  :super ros::object
  :slots (_err ))

(defmethod continuum::GoToResponse
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

(defclass continuum::GoTo
  :super ros::object
  :slots ())

(setf (get continuum::GoTo :md5sum-) "923fa2ccf66dd81a21848e9f11aed3cd")
(setf (get continuum::GoTo :datatype-) "continuum/GoTo")
(setf (get continuum::GoTo :request) continuum::GoToRequest)
(setf (get continuum::GoTo :response) continuum::GoToResponse)

(defmethod continuum::GoToRequest
  (:response () (instance continuum::GoToResponse :init)))

(setf (get continuum::GoToRequest :md5sum-) "923fa2ccf66dd81a21848e9f11aed3cd")
(setf (get continuum::GoToRequest :datatype-) "continuum/GoToRequest")
(setf (get continuum::GoToRequest :definition-)
      "float32 rho
float32 theta
float32 speed
float32 K
bool open
---
int32 err
")

(setf (get continuum::GoToResponse :md5sum-) "923fa2ccf66dd81a21848e9f11aed3cd")
(setf (get continuum::GoToResponse :datatype-) "continuum/GoToResponse")
(setf (get continuum::GoToResponse :definition-)
      "float32 rho
float32 theta
float32 speed
float32 K
bool open
---
int32 err
")



(provide :continuum/GoTo "923fa2ccf66dd81a21848e9f11aed3cd")


