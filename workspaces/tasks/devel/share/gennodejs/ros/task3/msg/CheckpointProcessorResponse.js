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

class CheckpointProcessorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output_x = null;
      this.output_y = null;
      this.valid = null;
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
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckpointProcessorResponse
    // Serialize message field [output_x]
    bufferOffset = _serializer.float64(obj.output_x, buffer, bufferOffset);
    // Serialize message field [output_y]
    bufferOffset = _serializer.float64(obj.output_y, buffer, bufferOffset);
    // Serialize message field [valid]
    bufferOffset = _serializer.bool(obj.valid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckpointProcessorResponse
    let len;
    let data = new CheckpointProcessorResponse(null);
    // Deserialize message field [output_x]
    data.output_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [output_y]
    data.output_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [valid]
    data.valid = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task3/CheckpointProcessorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd43cce861a65119db3648d950c7f417f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 output_x
    float64 output_y
    bool valid
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckpointProcessorResponse(null);
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

    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = false
    }

    return resolved;
    }
};

module.exports = CheckpointProcessorResponse;
