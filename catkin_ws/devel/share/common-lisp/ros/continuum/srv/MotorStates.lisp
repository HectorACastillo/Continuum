; Auto-generated. Do not edit!


(cl:in-package continuum-srv)


;//! \htmlinclude MotorStates-request.msg.html

(cl:defclass <MotorStates-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MotorStates-request (<MotorStates-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorStates-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorStates-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name continuum-srv:<MotorStates-request> is deprecated: use continuum-srv:MotorStates-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorStates-request>) ostream)
  "Serializes a message object of type '<MotorStates-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorStates-request>) istream)
  "Deserializes a message object of type '<MotorStates-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorStates-request>)))
  "Returns string type for a service object of type '<MotorStates-request>"
  "continuum/MotorStatesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorStates-request)))
  "Returns string type for a service object of type 'MotorStates-request"
  "continuum/MotorStatesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorStates-request>)))
  "Returns md5sum for a message object of type '<MotorStates-request>"
  "234b96902b9e5908267e7e3b9c5ca30f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorStates-request)))
  "Returns md5sum for a message object of type 'MotorStates-request"
  "234b96902b9e5908267e7e3b9c5ca30f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorStates-request>)))
  "Returns full string definition for message of type '<MotorStates-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorStates-request)))
  "Returns full string definition for message of type 'MotorStates-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorStates-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorStates-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorStates-request
))
;//! \htmlinclude MotorStates-response.msg.html

(cl:defclass <MotorStates-response> (roslisp-msg-protocol:ros-message)
  ((states
    :reader states
    :initarg :states
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (err
    :reader err
    :initarg :err
    :type cl:integer
    :initform 0))
)

(cl:defclass MotorStates-response (<MotorStates-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorStates-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorStates-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name continuum-srv:<MotorStates-response> is deprecated: use continuum-srv:MotorStates-response instead.")))

(cl:ensure-generic-function 'states-val :lambda-list '(m))
(cl:defmethod states-val ((m <MotorStates-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader continuum-srv:states-val is deprecated.  Use continuum-srv:states instead.")
  (states m))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <MotorStates-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader continuum-srv:err-val is deprecated.  Use continuum-srv:err instead.")
  (err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorStates-response>) ostream)
  "Serializes a message object of type '<MotorStates-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'states))
  (cl:let* ((signed (cl:slot-value msg 'err)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorStates-response>) istream)
  "Deserializes a message object of type '<MotorStates-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorStates-response>)))
  "Returns string type for a service object of type '<MotorStates-response>"
  "continuum/MotorStatesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorStates-response)))
  "Returns string type for a service object of type 'MotorStates-response"
  "continuum/MotorStatesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorStates-response>)))
  "Returns md5sum for a message object of type '<MotorStates-response>"
  "234b96902b9e5908267e7e3b9c5ca30f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorStates-response)))
  "Returns md5sum for a message object of type 'MotorStates-response"
  "234b96902b9e5908267e7e3b9c5ca30f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorStates-response>)))
  "Returns full string definition for message of type '<MotorStates-response>"
  (cl:format cl:nil "float32[] states~%int32 err~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorStates-response)))
  "Returns full string definition for message of type 'MotorStates-response"
  (cl:format cl:nil "float32[] states~%int32 err~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorStates-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorStates-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorStates-response
    (cl:cons ':states (states msg))
    (cl:cons ':err (err msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MotorStates)))
  'MotorStates-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MotorStates)))
  'MotorStates-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorStates)))
  "Returns string type for a service object of type '<MotorStates>"
  "continuum/MotorStates")