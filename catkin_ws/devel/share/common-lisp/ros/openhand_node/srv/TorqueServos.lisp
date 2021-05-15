; Auto-generated. Do not edit!


(cl:in-package openhand_node-srv)


;//! \htmlinclude TorqueServos-request.msg.html

(cl:defclass <TorqueServos-request> (roslisp-msg-protocol:ros-message)
  ((servo_indices
    :reader servo_indices
    :initarg :servo_indices
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (torq
    :reader torq
    :initarg :torq
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass TorqueServos-request (<TorqueServos-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TorqueServos-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TorqueServos-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand_node-srv:<TorqueServos-request> is deprecated: use openhand_node-srv:TorqueServos-request instead.")))

(cl:ensure-generic-function 'servo_indices-val :lambda-list '(m))
(cl:defmethod servo_indices-val ((m <TorqueServos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand_node-srv:servo_indices-val is deprecated.  Use openhand_node-srv:servo_indices instead.")
  (servo_indices m))

(cl:ensure-generic-function 'torq-val :lambda-list '(m))
(cl:defmethod torq-val ((m <TorqueServos-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand_node-srv:torq-val is deprecated.  Use openhand_node-srv:torq instead.")
  (torq m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TorqueServos-request>) ostream)
  "Serializes a message object of type '<TorqueServos-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'servo_indices))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'servo_indices))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'torq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'torq))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TorqueServos-request>) istream)
  "Deserializes a message object of type '<TorqueServos-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'servo_indices) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'servo_indices)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'torq) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'torq)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TorqueServos-request>)))
  "Returns string type for a service object of type '<TorqueServos-request>"
  "openhand_node/TorqueServosRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TorqueServos-request)))
  "Returns string type for a service object of type 'TorqueServos-request"
  "openhand_node/TorqueServosRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TorqueServos-request>)))
  "Returns md5sum for a message object of type '<TorqueServos-request>"
  "5ef27f5b23c316f62d99934009982e26")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TorqueServos-request)))
  "Returns md5sum for a message object of type 'TorqueServos-request"
  "5ef27f5b23c316f62d99934009982e26")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TorqueServos-request>)))
  "Returns full string definition for message of type '<TorqueServos-request>"
  (cl:format cl:nil "int32[] servo_indices~%float32[] torq~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TorqueServos-request)))
  "Returns full string definition for message of type 'TorqueServos-request"
  (cl:format cl:nil "int32[] servo_indices~%float32[] torq~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TorqueServos-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'servo_indices) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'torq) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TorqueServos-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TorqueServos-request
    (cl:cons ':servo_indices (servo_indices msg))
    (cl:cons ':torq (torq msg))
))
;//! \htmlinclude TorqueServos-response.msg.html

(cl:defclass <TorqueServos-response> (roslisp-msg-protocol:ros-message)
  ((err
    :reader err
    :initarg :err
    :type cl:integer
    :initform 0))
)

(cl:defclass TorqueServos-response (<TorqueServos-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TorqueServos-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TorqueServos-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand_node-srv:<TorqueServos-response> is deprecated: use openhand_node-srv:TorqueServos-response instead.")))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <TorqueServos-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand_node-srv:err-val is deprecated.  Use openhand_node-srv:err instead.")
  (err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TorqueServos-response>) ostream)
  "Serializes a message object of type '<TorqueServos-response>"
  (cl:let* ((signed (cl:slot-value msg 'err)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TorqueServos-response>) istream)
  "Deserializes a message object of type '<TorqueServos-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TorqueServos-response>)))
  "Returns string type for a service object of type '<TorqueServos-response>"
  "openhand_node/TorqueServosResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TorqueServos-response)))
  "Returns string type for a service object of type 'TorqueServos-response"
  "openhand_node/TorqueServosResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TorqueServos-response>)))
  "Returns md5sum for a message object of type '<TorqueServos-response>"
  "5ef27f5b23c316f62d99934009982e26")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TorqueServos-response)))
  "Returns md5sum for a message object of type 'TorqueServos-response"
  "5ef27f5b23c316f62d99934009982e26")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TorqueServos-response>)))
  "Returns full string definition for message of type '<TorqueServos-response>"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TorqueServos-response)))
  "Returns full string definition for message of type 'TorqueServos-response"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TorqueServos-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TorqueServos-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TorqueServos-response
    (cl:cons ':err (err msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TorqueServos)))
  'TorqueServos-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TorqueServos)))
  'TorqueServos-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TorqueServos)))
  "Returns string type for a service object of type '<TorqueServos>"
  "openhand_node/TorqueServos")