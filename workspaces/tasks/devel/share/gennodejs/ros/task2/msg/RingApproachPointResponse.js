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

class RingApproachPointResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output_x = null;
      this.output_y = null;
      this.output_z = null;
      this.output_w = null;
    }
    else {
      if (initObj.hasOwnProperty('output_x')) {
        this.output_x = initObj.output_x
      }
      else {
        this.output_x = 0.0;
      }
      if (initObj.hasOwnProperty('output_y')) {
        this.output_y = initObj.output_y
      }
      else {
        this.output_y = 0.0;
      }
      if (initObj.hasOwnProperty('output_z')) {
        this.output_z = initObj.output_z
      }
      else {
        this.output_z = 0.0;
      }
      if (initObj.hasOwnProperty('output_w')) {
        this.output_w = initObj.output_w
      }
      else {
        this.output_w = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RingApproachPointResponse
    // Serialize message field [output_x]
    bufferOffset = _serializer.float64(obj.output_x, buffer, bufferOffset);
    // Serialize message field [output_y]
    bufferOffset = _serializer.float64(obj.output_y, buffer, bufferOffset);
    // Serialize message field [output_z]
    bufferOffset = _serializer.float64(obj.output_z, buffer, bufferOffset);
    // Serialize message field [output_w]
    bufferOffset = _serializer.float64(obj.output_w, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RingApproachPointResponse
    let len;
    let data = new RingApproachPointResponse(null);
    // Deserialize message field [output_x]
    data.output_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [output_y]
    data.output_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [output_z]
    data.output_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [output_w]
    data.output_w = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task2/RingApproachPointResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d5d6e6db05e5f8fa78eb351c0a546a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 output_x
    float64 output_y
    float64 output_z
    float64 output_w
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RingApproachPointResponse(null);
    if (msg.output_x !== undefined) {
      resolved.output_x = msg.output_x;
    }
    else {
      resolved.output_x = 0.0
    }

    if (msg.output_y !== undefined) {
      resolved.output_y = msg.output_y;
    }
    else {
      resolved.output_y = 0.0
    }

    if (msg.output_z !== undefined) {
      resolved.output_z = msg.output_z;
    }
    else {
      resolved.output_z = 0.0
    }

    if (msg.output_w !== undefined) {
      resolved.output_w = msg.output_w;
    }
    else {
      resolved.output_w = 0.0
    }

    return resolved;
    }
};

module.exports = RingApproachPointResponse;
