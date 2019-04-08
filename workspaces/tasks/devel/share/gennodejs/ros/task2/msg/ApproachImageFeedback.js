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
      this.center_x = null;
      this.center_y = null;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ApproachImageFeedback
    // Serialize message field [center_x]
    bufferOffset = _serializer.int32(obj.center_x, buffer, bufferOffset);
    // Serialize message field [center_y]
    bufferOffset = _serializer.int32(obj.center_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ApproachImageFeedback
    let len;
    let data = new ApproachImageFeedback(null);
    // Deserialize message field [center_x]
    data.center_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [center_y]
    data.center_y = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task2/ApproachImageFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a3d3daadf2714704bb8322e86f0fde87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #coordinates of the center of the ring
    int32 center_x
    int32 center_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ApproachImageFeedback(null);
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

    return resolved;
    }
};

module.exports = ApproachImageFeedback;
