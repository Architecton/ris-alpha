// Auto-generated. Do not edit!

// (in-package task3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class CylinderLocationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.flg = null;
    }
    else {
      if (initObj.hasOwnProperty('flg')) {
        this.flg = initObj.flg
      }
      else {
        this.flg = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CylinderLocationRequest
    // Serialize message field [flg]
    bufferOffset = _serializer.int64(obj.flg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CylinderLocationRequest
    let len;
    let data = new CylinderLocationRequest(null);
    // Deserialize message field [flg]
    data.flg = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/CylinderLocationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8e58b690355adaa882da8790bb22595';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 flg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CylinderLocationRequest(null);
    if (msg.flg !== undefined) {
      resolved.flg = msg.flg;
    }
    else {
      resolved.flg = 0
    }

    return resolved;
    }
};

class CylinderLocationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.found = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.x_a = null;
      this.y_a = null;
      this.z_a = null;
    }
    else {
      if (initObj.hasOwnProperty('found')) {
        this.found = initObj.found
      }
      else {
        this.found = 0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('x_a')) {
        this.x_a = initObj.x_a
      }
      else {
        this.x_a = 0.0;
      }
      if (initObj.hasOwnProperty('y_a')) {
        this.y_a = initObj.y_a
      }
      else {
        this.y_a = 0.0;
      }
      if (initObj.hasOwnProperty('z_a')) {
        this.z_a = initObj.z_a
      }
      else {
        this.z_a = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CylinderLocationResponse
    // Serialize message field [found]
    bufferOffset = _serializer.uint8(obj.found, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [x_a]
    bufferOffset = _serializer.float64(obj.x_a, buffer, bufferOffset);
    // Serialize message field [y_a]
    bufferOffset = _serializer.float64(obj.y_a, buffer, bufferOffset);
    // Serialize message field [z_a]
    bufferOffset = _serializer.float64(obj.z_a, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CylinderLocationResponse
    let len;
    let data = new CylinderLocationResponse(null);
    // Deserialize message field [found]
    data.found = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x_a]
    data.x_a = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_a]
    data.y_a = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z_a]
    data.z_a = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 49;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/CylinderLocationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2102fc99f4e6b63e16a185029b0e674';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    uint8 found
    
    
    float64 x
    float64 y
    float64 z
    
    
    float64 x_a
    float64 y_a
    float64 z_a
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CylinderLocationResponse(null);
    if (msg.found !== undefined) {
      resolved.found = msg.found;
    }
    else {
      resolved.found = 0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.x_a !== undefined) {
      resolved.x_a = msg.x_a;
    }
    else {
      resolved.x_a = 0.0
    }

    if (msg.y_a !== undefined) {
      resolved.y_a = msg.y_a;
    }
    else {
      resolved.y_a = 0.0
    }

    if (msg.z_a !== undefined) {
      resolved.z_a = msg.z_a;
    }
    else {
      resolved.z_a = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: CylinderLocationRequest,
  Response: CylinderLocationResponse,
  md5sum() { return '449ac22520dbd7a67ea7d1766a88f2a4'; },
  datatype() { return 'task3/CylinderLocation'; }
};
