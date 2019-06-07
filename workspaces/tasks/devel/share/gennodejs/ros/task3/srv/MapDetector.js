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

class MapDetectorRequest {
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
    // Serializes a message object of type MapDetectorRequest
    // Serialize message field [flg]
    bufferOffset = _serializer.int64(obj.flg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MapDetectorRequest
    let len;
    let data = new MapDetectorRequest(null);
    // Deserialize message field [flg]
    data.flg = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/MapDetectorRequest';
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
    const resolved = new MapDetectorRequest(null);
    if (msg.flg !== undefined) {
      resolved.flg = msg.flg;
    }
    else {
      resolved.flg = 0
    }

    return resolved;
    }
};

class MapDetectorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.treasure_x = null;
      this.treasure_y = null;
    }
    else {
      if (initObj.hasOwnProperty('treasure_x')) {
        this.treasure_x = initObj.treasure_x
      }
      else {
        this.treasure_x = 0.0;
      }
      if (initObj.hasOwnProperty('treasure_y')) {
        this.treasure_y = initObj.treasure_y
      }
      else {
        this.treasure_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MapDetectorResponse
    // Serialize message field [treasure_x]
    bufferOffset = _serializer.float64(obj.treasure_x, buffer, bufferOffset);
    // Serialize message field [treasure_y]
    bufferOffset = _serializer.float64(obj.treasure_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MapDetectorResponse
    let len;
    let data = new MapDetectorResponse(null);
    // Deserialize message field [treasure_x]
    data.treasure_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [treasure_y]
    data.treasure_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/MapDetectorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '35a8c353b62fb549dc16741d0d6d9d13';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 treasure_x
    float64 treasure_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MapDetectorResponse(null);
    if (msg.treasure_x !== undefined) {
      resolved.treasure_x = msg.treasure_x;
    }
    else {
      resolved.treasure_x = 0.0
    }

    if (msg.treasure_y !== undefined) {
      resolved.treasure_y = msg.treasure_y;
    }
    else {
      resolved.treasure_y = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: MapDetectorRequest,
  Response: MapDetectorResponse,
  md5sum() { return '5c0167ecd7748962f1d9e21ddb0b0dae'; },
  datatype() { return 'task3/MapDetector'; }
};
