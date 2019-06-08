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

class ReconfigParamsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.param_name = null;
      this.param_val = null;
    }
    else {
      if (initObj.hasOwnProperty('param_name')) {
        this.param_name = initObj.param_name
      }
      else {
        this.param_name = '';
      }
      if (initObj.hasOwnProperty('param_val')) {
        this.param_val = initObj.param_val
      }
      else {
        this.param_val = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReconfigParamsRequest
    // Serialize message field [param_name]
    bufferOffset = _serializer.string(obj.param_name, buffer, bufferOffset);
    // Serialize message field [param_val]
    bufferOffset = _serializer.float64(obj.param_val, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReconfigParamsRequest
    let len;
    let data = new ReconfigParamsRequest(null);
    // Deserialize message field [param_name]
    data.param_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [param_val]
    data.param_val = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.param_name.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/ReconfigParamsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '099e3b9abed354a4764ac4b1311c2531';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string param_name
    float64 param_val
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ReconfigParamsRequest(null);
    if (msg.param_name !== undefined) {
      resolved.param_name = msg.param_name;
    }
    else {
      resolved.param_name = ''
    }

    if (msg.param_val !== undefined) {
      resolved.param_val = msg.param_val;
    }
    else {
      resolved.param_val = 0.0
    }

    return resolved;
    }
};

class ReconfigParamsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReconfigParamsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReconfigParamsResponse
    let len;
    let data = new ReconfigParamsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/ReconfigParamsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ReconfigParamsResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ReconfigParamsRequest,
  Response: ReconfigParamsResponse,
  md5sum() { return '64fd125ad82319180ca7fa695a94eece'; },
  datatype() { return 'task3/ReconfigParams'; }
};
