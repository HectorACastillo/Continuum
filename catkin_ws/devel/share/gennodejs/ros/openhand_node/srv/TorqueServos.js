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

class TorqueServosRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.servo_indices = null;
      this.torq = null;
    }
    else {
      if (initObj.hasOwnProperty('servo_indices')) {
        this.servo_indices = initObj.servo_indices
      }
      else {
        this.servo_indices = [];
      }
      if (initObj.hasOwnProperty('torq')) {
        this.torq = initObj.torq
      }
      else {
        this.torq = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TorqueServosRequest
    // Serialize message field [servo_indices]
    bufferOffset = _arraySerializer.int32(obj.servo_indices, buffer, bufferOffset, null);
    // Serialize message field [torq]
    bufferOffset = _arraySerializer.float32(obj.torq, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TorqueServosRequest
    let len;
    let data = new TorqueServosRequest(null);
    // Deserialize message field [servo_indices]
    data.servo_indices = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [torq]
    data.torq = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.servo_indices.length;
    length += 4 * object.torq.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand_node/TorqueServosRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '895086b4bd1390acd626a0b659916644';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] servo_indices
    float32[] torq
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TorqueServosRequest(null);
    if (msg.servo_indices !== undefined) {
      resolved.servo_indices = msg.servo_indices;
    }
    else {
      resolved.servo_indices = []
    }

    if (msg.torq !== undefined) {
      resolved.torq = msg.torq;
    }
    else {
      resolved.torq = []
    }

    return resolved;
    }
};

class TorqueServosResponse {
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
    // Serializes a message object of type TorqueServosResponse
    // Serialize message field [err]
    bufferOffset = _serializer.int32(obj.err, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TorqueServosResponse
    let len;
    let data = new TorqueServosResponse(null);
    // Deserialize message field [err]
    data.err = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'openhand_node/TorqueServosResponse';
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
    const resolved = new TorqueServosResponse(null);
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
  Request: TorqueServosRequest,
  Response: TorqueServosResponse,
  md5sum() { return '5ef27f5b23c316f62d99934009982e26'; },
  datatype() { return 'openhand_node/TorqueServos'; }
};
