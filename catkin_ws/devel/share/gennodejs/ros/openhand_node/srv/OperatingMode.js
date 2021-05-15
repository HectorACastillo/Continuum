// Auto-generated. Do not edit!

// (in-package openhand_node.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class OperatingModeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pos_control = null;
      this.servo_indices = null;
    }
    else {
      if (initObj.hasOwnProperty('pos_control')) {
        this.pos_control = initObj.pos_control
      }
      else {
        this.pos_control = [];
      }
      if (initObj.hasOwnProperty('servo_indices')) {
        this.servo_indices = initObj.servo_indices
      }
      else {
        this.servo_indices = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OperatingModeRequest
    // Serialize message field [pos_control]
    bufferOffset = _arraySerializer.bool(obj.pos_control, buffer, bufferOffset, null);
    // Serialize message field [servo_indices]
    bufferOffset = _arraySerializer.int32(obj.servo_indices, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OperatingModeRequest
    let len;
    let data = new OperatingModeRequest(null);
    // Deserialize message field [pos_control]
    data.pos_control = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [servo_indices]
    data.servo_indices = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.pos_control.length;
    length += 4 * object.servo_indices.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand_node/OperatingModeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8547873d748d03d91291c7bd0d1e2a7d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool[] pos_control
    int32[] servo_indices
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OperatingModeRequest(null);
    if (msg.pos_control !== undefined) {
      resolved.pos_control = msg.pos_control;
    }
    else {
      resolved.pos_control = []
    }

    if (msg.servo_indices !== undefined) {
      resolved.servo_indices = msg.servo_indices;
    }
    else {
      resolved.servo_indices = []
    }

    return resolved;
    }
};

class OperatingModeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.err = null;
    }
    else {
      if (initObj.hasOwnProperty('err')) {
        this.err = initObj.err
      }
      else {
        this.err = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OperatingModeResponse
    // Serialize message field [err]
    bufferOffset = _serializer.int32(obj.err, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OperatingModeResponse
    let len;
    let data = new OperatingModeResponse(null);
    // Deserialize message field [err]
    data.err = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand_node/OperatingModeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b6e094011a4dfaee5eddf447220446cf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 err
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OperatingModeResponse(null);
    if (msg.err !== undefined) {
      resolved.err = msg.err;
    }
    else {
      resolved.err = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: OperatingModeRequest,
  Response: OperatingModeResponse,
  md5sum() { return 'de2e40c8f82c8a51269f155066572b24'; },
  datatype() { return 'openhand_node/OperatingMode'; }
};
