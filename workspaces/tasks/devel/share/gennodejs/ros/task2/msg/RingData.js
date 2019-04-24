// Auto-generated. Do not edit!

// (in-package task2.msg)


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
    bufferOffset = _serializer.int32(obj.center_x, buffer, bufferOffset);
    // Serialize message field [center_y]
    bufferOffset = _serializer.int32(obj.center_y, buffer, bufferOffset);
    // Serialize message field [rad]
    bufferOffset = _serializer.int32(obj.rad, buffer, bufferOffset);
    // Serialize message field [im]
    bufferOffset = _arraySerializer.uint8(obj.im, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RingData
    let len;
    let data = new RingData(null);
    // Deserialize message field [center_x]
    data.center_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [center_y]
    data.center_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rad]
    data.rad = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [im]
    data.im = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.im.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task2/RingData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b518b5d90f383e720d8073f3b71cedb3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 center_x
    int32 center_y
    int32 rad
    uint8[] im
    
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
