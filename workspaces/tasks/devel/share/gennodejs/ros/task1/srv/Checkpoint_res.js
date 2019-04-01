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

let Checkpoints = require('../msg/Checkpoints.js');

//-----------------------------------------------------------

class Checkpoint_resRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Checkpoint_resRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Checkpoint_resRequest
    let len;
    let data = new Checkpoint_resRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task1/Checkpoint_resRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Checkpoint_resRequest(null);
    return resolved;
    }
};

class Checkpoint_resResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = new Checkpoints();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Checkpoint_resResponse
    // Serialize message field [points]
    bufferOffset = Checkpoints.serialize(obj.points, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Checkpoint_resResponse
    let len;
    let data = new Checkpoint_resResponse(null);
    // Deserialize message field [points]
    data.points = Checkpoints.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Checkpoints.getMessageSize(object.points);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task1/Checkpoint_resResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f7b43fb4c3dc044f1ecb1f843f952947';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Checkpoints points
    
    ================================================================================
    MSG: task1/Checkpoints
    geometry_msgs/Point[] points
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Checkpoint_resResponse(null);
    if (msg.points !== undefined) {
      resolved.points = Checkpoints.Resolve(msg.points)
    }
    else {
      resolved.points = new Checkpoints()
    }

    return resolved;
    }
};

module.exports = {
  Request: Checkpoint_resRequest,
  Response: Checkpoint_resResponse,
  md5sum() { return 'f7b43fb4c3dc044f1ecb1f843f952947'; },
  datatype() { return 'task1/Checkpoint_res'; }
};
