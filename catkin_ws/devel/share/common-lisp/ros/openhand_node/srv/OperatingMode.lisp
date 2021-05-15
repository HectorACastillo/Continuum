; Auto-generated. Do not edit!


(cl:in-package openhand_node-srv)


;//! \htmlinclude OperatingMode-request.msg.html

(cl:defclass <OperatingMode-request> (roslisp-msg-protocol:ros-message)
  ((pos_control
    :reader pos_control
    :initarg :pos_control
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (servo_indices
    :reader servo_indices
    :initarg :servo_indices
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass OperatingMode-request (<OperatingMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OperatingMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OperatingMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand_node-srv:<OperatingMode-request> is deprecated: use openhand_node-srv:OperatingMode-request instead.")))

(cl:ensure-generic-function 'pos_control-val :lambda-list '(m))
(cl:defmethod pos_control-val ((m <OperatingMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand_node-srv:pos_control-val is deprecated.  Use openhand_node-srv:pos_control instead.")
  (pos_control m))

(cl:ensure-generic-function 'servo_indices-val :lambda-list '(m))
(cl:defmethod servo_indices-val ((m <OperatingMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand_node-srv:servo_indices-val is deprecated.  Use openhand_node-srv:servo_indices instead.")
  (servo_indices m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OperatingMode-request>) ostream)
  "Serializes a message object of type '<OperatingMode-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pos_control))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'pos_control))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OperatingMode-request>) istream)
  "Deserializes a message object of type '<OperatingMode-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pos_control) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pos_control)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OperatingMode-request>)))
  "Returns string type for a service object of type '<OperatingMode-request>"
  "openhand_node/OperatingModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OperatingMode-request)))
  "Returns string type for a service object of type 'OperatingMode-request"
  "openhand_node/OperatingModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OperatingMode-request>)))
  "Returns md5sum for a message object of type '<OperatingMode-request>"
  "de2e40c8f82c8a51269f155066572b24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OperatingMode-request)))
  "Returns md5sum for a message object of type 'OperatingMode-request"
  "de2e40c8f82c8a51269f155066572b24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OperatingMode-request>)))
  "Returns full string definition for message of type '<OperatingMode-request>"
  (cl:format cl:nil "bool[] pos_control~%int32[] servo_indices~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OperatingMode-request)))
  "Returns full string definition for message of type 'OperatingMode-request"
  (cl:format cl:nil "bool[] pos_control~%int32[] servo_indices~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OperatingMode-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pos_control) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'servo_indices) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OperatingMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'OperatingMode-request
    (cl:cons ':pos_control (pos_control msg))
    (cl:cons ':servo_indices (servo_indices msg))
))
;//! \htmlinclude OperatingMode-response.msg.html

(cl:defclass <OperatingMode-response> (roslisp-msg-protocol:ros-message)
  ((err
    :reader err
    :initarg :err
    :type cl:integer
    :initform 0))
)

(cl:defclass OperatingMode-response (<OperatingMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OperatingMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OperatingMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name openhand_node-srv:<OperatingMode-response> is deprecated: use openhand_node-srv:OperatingMode-response instead.")))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <OperatingMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader openhand_node-srv:err-val is deprecated.  Use openhand_node-srv:err instead.")
  (err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OperatingMode-response>) ostream)
  "Serializes a message object of type '<OperatingMode-response>"
  (cl:let* ((signed (cl:slot-value msg 'err)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OperatingMode-response>) istream)
  "Deserializes a message object of type '<OperatingMode-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OperatingMode-response>)))
  "Returns string type for a service object of type '<OperatingMode-response>"
  "openhand_node/OperatingModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OperatingMode-response)))
  "Returns string type for a service object of type 'OperatingMode-response"
  "openhand_node/OperatingModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OperatingMode-response>)))
  "Returns md5sum for a message object of type '<OperatingMode-response>"
  "de2e40c8f82c8a51269f155066572b24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OperatingMode-response)))
  "Returns md5sum for a message object of type 'OperatingMode-response"
  "de2e40c8f82c8a51269f155066572b24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OperatingMode-response>)))
  "Returns full string definition for message of type '<OperatingMode-response>"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OperatingMode-response)))
  "Returns full string definition for message of type 'OperatingMode-response"
  (cl:format cl:nil "int32 err~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OperatingMode-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OperatingMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'OperatingMode-response
    (cl:cons ':err (err msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'OperatingMode)))
  'OperatingMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'OperatingMode)))
  'OperatingMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OperatingMode)))
  "Returns string type for a service object of type '<OperatingMode>"
  "openhand_node/OperatingMode")