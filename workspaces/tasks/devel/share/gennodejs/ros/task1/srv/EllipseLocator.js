// Auto-generated. Do not edit!

// (in-package task1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class EllipseLocatorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EllipseLocatorRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EllipseLocatorRequest
    let len;
    let data = new EllipseLocatorRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task1/EllipseLocatorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EllipseLocatorRequest(null);
    return resolved;
    }
};

class EllipseLocatorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target = null;
    }
    else {
      if (initObj.hasOwnProperty('target')) {
        this.target = initObj.target
      }
      else {
        this.target = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EllipseLocatorResponse
    // Serialize message field [target]
    bufferOffset = _arraySerializer.float64(obj.target, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EllipseLocatorResponse
    let len;
    let data = new EllipseLocatorResponse(null);
    // Deserialize message field [target]
    data.target = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.target.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task1/EllipseLocatorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7b497188d656d59d92c0ddf8ac50fe8a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] target
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EllipseLocatorResponse(null);
    if (msg.target !== undefined) {
      resolved.target = msg.target;
    }
    else {
      resolved.target = []
    }

    return resolved;
    }
};

module.exports = {
  Request: EllipseLocatorRequest,
  Response: EllipseLocatorResponse,
  md5sum() { return '7b497188d656d59d92c0ddf8ac50fe8a'; },
  datatype() { return 'task1/EllipseLocator'; }
};
