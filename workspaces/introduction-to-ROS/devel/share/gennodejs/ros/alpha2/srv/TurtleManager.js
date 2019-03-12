// Auto-generated. Do not edit!

// (in-package alpha2.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TurtleManagerRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajection = null;
      this.duration = null;
    }
    else {
      if (initObj.hasOwnProperty('trajection')) {
        this.trajection = initObj.trajection
      }
      else {
        this.trajection = '';
      }
      if (initObj.hasOwnProperty('duration')) {
        this.duration = initObj.duration
      }
      else {
        this.duration = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TurtleManagerRequest
    // Serialize message field [trajection]
    bufferOffset = _serializer.string(obj.trajection, buffer, bufferOffset);
    // Serialize message field [duration]
    bufferOffset = _serializer.uint64(obj.duration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TurtleManagerRequest
    let len;
    let data = new TurtleManagerRequest(null);
    // Deserialize message field [trajection]
    data.trajection = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [duration]
    data.duration = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.trajection.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alpha2/TurtleManagerRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5b4fe41f14e7d3f220a38a44a8a4bcb4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string trajection
    uint64 duration
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TurtleManagerRequest(null);
    if (msg.trajection !== undefined) {
      resolved.trajection = msg.trajection;
    }
    else {
      resolved.trajection = ''
    }

    if (msg.duration !== undefined) {
      resolved.duration = msg.duration;
    }
    else {
      resolved.duration = 0
    }

    return resolved;
    }
};

class TurtleManagerResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lastmovement = null;
    }
    else {
      if (initObj.hasOwnProperty('lastmovement')) {
        this.lastmovement = initObj.lastmovement
      }
      else {
        this.lastmovement = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TurtleManagerResponse
    // Serialize message field [lastmovement]
    bufferOffset = _serializer.string(obj.lastmovement, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TurtleManagerResponse
    let len;
    let data = new TurtleManagerResponse(null);
    // Deserialize message field [lastmovement]
    data.lastmovement = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.lastmovement.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'alpha2/TurtleManagerResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '499ad2ae7415e189266ffdfc8162bf10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string lastmovement
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TurtleManagerResponse(null);
    if (msg.lastmovement !== undefined) {
      resolved.lastmovement = msg.lastmovement;
    }
    else {
      resolved.lastmovement = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: TurtleManagerRequest,
  Response: TurtleManagerResponse,
  md5sum() { return 'c4a7b5d4e57b122dab2b47a5dca00961'; },
  datatype() { return 'alpha2/TurtleManager'; }
};
