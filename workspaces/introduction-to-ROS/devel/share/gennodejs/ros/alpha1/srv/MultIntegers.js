// Auto-generated. Do not edit!

// (in-package alpha1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MultIntegersRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.int_list = null;
    }
    else {
      if (initObj.hasOwnProperty('int_list')) {
        this.int_list = initObj.int_list
      }
      else {
        this.int_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MultIntegersRequest
    // Serialize message field [int_list]
    bufferOffset = _arraySerializer.int64(obj.int_list, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultIntegersRequest
    let len;
    let data = new MultIntegersRequest(null);
    // Deserialize message field [int_list]
    data.int_list = _arrayDeserializer.int64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.int_list.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alpha1/MultIntegersRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b40bc1a8dcd75018642e111fe68b7cbe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[] int_list
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultIntegersRequest(null);
    if (msg.int_list !== undefined) {
      resolved.int_list = msg.int_list;
    }
    else {
      resolved.int_list = []
    }

    return resolved;
    }
};

class MultIntegersResponse {
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
        this.result = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MultIntegersResponse
    // Serialize message field [result]
    bufferOffset = _serializer.int64(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultIntegersResponse
    let len;
    let data = new MultIntegersResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alpha1/MultIntegersResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9b05623554ab950ed237d43d45f0b4dd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultIntegersResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: MultIntegersRequest,
  Response: MultIntegersResponse,
  md5sum() { return '99989b30d784b92ec8440f11988612b9'; },
  datatype() { return 'alpha1/MultIntegers'; }
};
