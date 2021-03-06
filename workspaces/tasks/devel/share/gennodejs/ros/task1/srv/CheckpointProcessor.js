// Auto-generated. Do not edit!

// (in-package task1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class CheckpointProcessorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_x = null;
      this.input_y = null;
    }
    else {
      if (initObj.hasOwnProperty('input_x')) {
        this.input_x = initObj.input_x
      }
      else {
        this.input_x = 0.0;
      }
      if (initObj.hasOwnProperty('input_y')) {
        this.input_y = initObj.input_y
      }
      else {
        this.input_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckpointProcessorRequest
    // Serialize message field [input_x]
    bufferOffset = _serializer.float64(obj.input_x, buffer, bufferOffset);
    // Serialize message field [input_y]
    bufferOffset = _serializer.float64(obj.input_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckpointProcessorRequest
    let len;
    let data = new CheckpointProcessorRequest(null);
    // Deserialize message field [input_x]
    data.input_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [input_y]
    data.input_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task1/CheckpointProcessorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '778eac8212a9761df254633e5a7e78e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 input_x
    float64 input_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckpointProcessorRequest(null);
    if (msg.input_x !== undefined) {
      resolved.input_x = msg.input_x;
    }
    else {
      resolved.input_x = 0.0
    }

    if (msg.input_y !== undefined) {
      resolved.input_y = msg.input_y;
    }
    else {
      resolved.input_y = 0.0
    }

    return resolved;
    }
};

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
    // Returns string type for a service object
    return 'task1/CheckpointProcessorResponse';
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

module.exports = {
  Request: CheckpointProcessorRequest,
  Response: CheckpointProcessorResponse,
  md5sum() { return 'af3f94b765997022c6ac0867e7797cba'; },
  datatype() { return 'task1/CheckpointProcessor'; }
};
