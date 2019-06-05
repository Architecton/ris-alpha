// Auto-generated. Do not edit!

// (in-package task3.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TreasureLocatorResponse {
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
    // Serializes a message object of type TreasureLocatorResponse
    // Serialize message field [treasure_x]
    bufferOffset = _serializer.float64(obj.treasure_x, buffer, bufferOffset);
    // Serialize message field [treasure_y]
    bufferOffset = _serializer.float64(obj.treasure_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TreasureLocatorResponse
    let len;
    let data = new TreasureLocatorResponse(null);
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
    // Returns string type for a message object
    return 'task3/TreasureLocatorResponse';
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
    const resolved = new TreasureLocatorResponse(null);
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

module.exports = TreasureLocatorResponse;
