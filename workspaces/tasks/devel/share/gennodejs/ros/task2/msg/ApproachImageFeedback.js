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

class ApproachImageFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp = null;
      this.center_x = null;
      this.center_y = null;
      this.minor_axis = null;
      this.major_axis = null;
      this.dpt = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = {secs: 0, nsecs: 0};
      }
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
      if (initObj.hasOwnProperty('minor_axis')) {
        this.minor_axis = initObj.minor_axis
      }
      else {
        this.minor_axis = 0;
      }
      if (initObj.hasOwnProperty('major_axis')) {
        this.major_axis = initObj.major_axis
      }
      else {
        this.major_axis = 0;
      }
      if (initObj.hasOwnProperty('dpt')) {
        this.dpt = initObj.dpt
      }
      else {
        this.dpt = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ApproachImageFeedback
    // Serialize message field [timestamp]
    bufferOffset = _serializer.time(obj.timestamp, buffer, bufferOffset);
    // Serialize message field [center_x]
    bufferOffset = _serializer.int32(obj.center_x, buffer, bufferOffset);
    // Serialize message field [center_y]
    bufferOffset = _serializer.int32(obj.center_y, buffer, bufferOffset);
    // Serialize message field [minor_axis]
    bufferOffset = _serializer.int32(obj.minor_axis, buffer, bufferOffset);
    // Serialize message field [major_axis]
    bufferOffset = _serializer.int32(obj.major_axis, buffer, bufferOffset);
    // Serialize message field [dpt]
    bufferOffset = _serializer.float32(obj.dpt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ApproachImageFeedback
    let len;
    let data = new ApproachImageFeedback(null);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [center_x]
    data.center_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [center_y]
    data.center_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [minor_axis]
    data.minor_axis = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [major_axis]
    data.major_axis = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dpt]
    data.dpt = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task2/ApproachImageFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '48f6d07ab2de708512ad475e0ac59310';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #coordinates of the center of the ring
    time timestamp
    int32 center_x
    int32 center_y
    int32 minor_axis
    int32 major_axis
    float32 dpt
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ApproachImageFeedback(null);
    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = {secs: 0, nsecs: 0}
    }

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

    if (msg.minor_axis !== undefined) {
      resolved.minor_axis = msg.minor_axis;
    }
    else {
      resolved.minor_axis = 0
    }

    if (msg.major_axis !== undefined) {
      resolved.major_axis = msg.major_axis;
    }
    else {
      resolved.major_axis = 0
    }

    if (msg.dpt !== undefined) {
      resolved.dpt = msg.dpt;
    }
    else {
      resolved.dpt = 0.0
    }

    return resolved;
    }
};

module.exports = ApproachImageFeedback;
