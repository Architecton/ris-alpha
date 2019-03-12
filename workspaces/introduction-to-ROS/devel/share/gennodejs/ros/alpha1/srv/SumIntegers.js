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

class SumIntegersRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.numbers = null;
    }
    else {
      if (initObj.hasOwnProperty('numbers')) {
        this.numbers = initObj.numbers
      }
      else {
        this.numbers = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SumIntegersRequest
    // Serialize message field [numbers]
    bufferOffset = _arraySerializer.int64(obj.numbers, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SumIntegersRequest
    let len;
    let data = new SumIntegersRequest(null);
    // Deserialize message field [numbers]
    data.numbers = _arrayDeserializer.int64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.numbers.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alpha1/SumIntegersRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3dc0ed8c2332c3d3ba50a96ed8318f1c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[] numbers
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SumIntegersRequest(null);
    if (msg.numbers !== undefined) {
      resolved.numbers = msg.numbers;
    }
    else {
      resolved.numbers = []
    }

    return resolved;
    }
};

class SumIntegersResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sum = null;
    }
    else {
      if (initObj.hasOwnProperty('sum')) {
        this.sum = initObj.sum
      }
      else {
        this.sum = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SumIntegersResponse
    // Serialize message field [sum]
    bufferOffset = _serializer.int64(obj.sum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SumIntegersResponse
    let len;
    let data = new SumIntegersResponse(null);
    // Deserialize message field [sum]
    data.sum = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alpha1/SumIntegersResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b88405221c77b1878a3cbbfff53428d7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 sum
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SumIntegersResponse(null);
    if (msg.sum !== undefined) {
      resolved.sum = msg.sum;
    }
    else {
      resolved.sum = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: SumIntegersRequest,
  Response: SumIntegersResponse,
  md5sum() { return 'ee52d55541e33a838f1823a8e8489c7d'; },
  datatype() { return 'alpha1/SumIntegers'; }
};
