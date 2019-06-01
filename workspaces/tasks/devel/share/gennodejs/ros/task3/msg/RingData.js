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

class RingData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.center_x = null;
      this.center_y = null;
      this.rad = null;
      this.im = null;
    }
    else {
      if (initObj.hasOwnProperty('center_x')) {
        this.center_x = initObj.center_x
      }
      else {
        this.center_x = 0;
      }
      if (initObj.hasOwnProperty('center_y')) {
        this.center_y = initObj.center_y
      }
      else {
        this.center_y = 0;
      }
      if (initObj.hasOwnProperty('rad')) {
        this.rad = initObj.rad
      }
      else {
        this.rad = 0;
      }
      if (initObj.hasOwnProperty('im')) {
        this.im = initObj.im
      }
      else {
        this.im = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RingData
    // Serialize message field [center_x]
    bufferOffset = _serializer.uint32(obj.center_x, buffer, bufferOffset);
    // Serialize message field [center_y]
    bufferOffset = _serializer.uint32(obj.center_y, buffer, bufferOffset);
    // Serialize message field [rad]
    bufferOffset = _serializer.uint32(obj.rad, buffer, bufferOffset);
    // Serialize message field [im]
    bufferOffset = _arraySerializer.uint32(obj.im, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RingData
    let len;
    let data = new RingData(null);
    // Deserialize message field [center_x]
    data.center_x = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [center_y]
    data.center_y = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [rad]
    data.rad = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [im]
    data.im = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.im.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task3/RingData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '46389819cec53f990d59caf4d9e9561f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 center_x
    uint32 center_y
    uint32 rad
    uint32[] im
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RingData(null);
    if (msg.center_x !== undefined) {
      resolved.center_x = msg.center_x;
    }
    else {
      resolved.center_x = 0
    }

    if (msg.center_y !== undefined) {
      resolved.center_y = msg.center_y;
    }
    else {
      resolved.center_y = 0
    }

    if (msg.rad !== undefined) {
      resolved.rad = msg.rad;
    }
    else {
      resolved.rad = 0
    }

    if (msg.im !== undefined) {
      resolved.im = msg.im;
    }
    else {
      resolved.im = []
    }

    return resolved;
    }
};

module.exports = RingData;
