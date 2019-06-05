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

class DigitDetectorRequest {
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
    // Serializes a message object of type DigitDetectorRequest
    // Serialize message field [flg]
    bufferOffset = _serializer.int64(obj.flg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DigitDetectorRequest
    let len;
    let data = new DigitDetectorRequest(null);
    // Deserialize message field [flg]
    data.flg = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/DigitDetectorRequest';
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
    const resolved = new DigitDetectorRequest(null);
    if (msg.flg !== undefined) {
      resolved.flg = msg.flg;
    }
    else {
      resolved.flg = 0
    }

    return resolved;
    }
};

class DigitDetectorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DigitDetectorResponse
    // Serialize message field [result]
    bufferOffset = _arraySerializer.int64(obj.result, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DigitDetectorResponse
    let len;
    let data = new DigitDetectorResponse(null);
    // Deserialize message field [result]
    data.result = _arrayDeserializer.int64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.result.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/DigitDetectorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '67cdd51ca1859f10c723484b0bc5b1b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[] result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DigitDetectorResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = []
    }

    return resolved;
    }
};

module.exports = {
  Request: DigitDetectorRequest,
  Response: DigitDetectorResponse,
  md5sum() { return '64fdfdf2315ce0489e0badef6a400485'; },
  datatype() { return 'task3/DigitDetector'; }
};
