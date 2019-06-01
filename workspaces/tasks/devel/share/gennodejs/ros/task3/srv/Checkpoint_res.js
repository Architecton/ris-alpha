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

let Checkpoints = require('../msg/Checkpoints.js');

//-----------------------------------------------------------

class Checkpoint_resRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num_of_checkpoints = null;
    }
    else {
      if (initObj.hasOwnProperty('num_of_checkpoints')) {
        this.num_of_checkpoints = initObj.num_of_checkpoints
      }
      else {
        this.num_of_checkpoints = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Checkpoint_resRequest
    // Serialize message field [num_of_checkpoints]
    bufferOffset = _serializer.uint64(obj.num_of_checkpoints, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Checkpoint_resRequest
    let len;
    let data = new Checkpoint_resRequest(null);
    // Deserialize message field [num_of_checkpoints]
    data.num_of_checkpoints = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/Checkpoint_resRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'db60db3ba58061c23afcd04151ecbaf1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint64 num_of_checkpoints
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Checkpoint_resRequest(null);
    if (msg.num_of_checkpoints !== undefined) {
      resolved.num_of_checkpoints = msg.num_of_checkpoints;
    }
    else {
      resolved.num_of_checkpoints = 0
    }

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
    return 'task3/Checkpoint_resResponse';
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
    MSG: task3/Checkpoints
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
  md5sum() { return '164415de33c55ff5b8477a9721394803'; },
  datatype() { return 'task3/Checkpoint_res'; }
};
