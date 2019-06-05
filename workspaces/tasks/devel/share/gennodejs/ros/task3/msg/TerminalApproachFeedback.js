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

class TerminalApproachFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_center_x = null;
      this.center_x = null;
      this.window_size = null;
    }
    else {
      if (initObj.hasOwnProperty('target_center_x')) {
        this.target_center_x = initObj.target_center_x
      }
      else {
        this.target_center_x = 0;
      }
      if (initObj.hasOwnProperty('center_x')) {
        this.center_x = initObj.center_x
      }
      else {
        this.center_x = 0;
      }
      if (initObj.hasOwnProperty('window_size')) {
        this.window_size = initObj.window_size
      }
      else {
        this.window_size = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TerminalApproachFeedback
    // Serialize message field [target_center_x]
    bufferOffset = _serializer.int32(obj.target_center_x, buffer, bufferOffset);
    // Serialize message field [center_x]
    bufferOffset = _serializer.int32(obj.center_x, buffer, bufferOffset);
    // Serialize message field [window_size]
    bufferOffset = _serializer.int32(obj.window_size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TerminalApproachFeedback
    let len;
    let data = new TerminalApproachFeedback(null);
    // Deserialize message field [target_center_x]
    data.target_center_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [center_x]
    data.center_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [window_size]
    data.window_size = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task3/TerminalApproachFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8251b1bb88dbf79ef5ad5d622a580458';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Center x coordinate of the window representing the area in which to keep the ring center.
    int32 target_center_x
    
    #index of the x coordinate of the ring center.
    int32 center_x
    
    #side length of the window in which to keep the center of the ellipse.
    int32 window_size
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TerminalApproachFeedback(null);
    if (msg.target_center_x !== undefined) {
      resolved.target_center_x = msg.target_center_x;
    }
    else {
      resolved.target_center_x = 0
    }

    if (msg.center_x !== undefined) {
      resolved.center_x = msg.center_x;
    }
    else {
      resolved.center_x = 0
    }

    if (msg.window_size !== undefined) {
      resolved.window_size = msg.window_size;
    }
    else {
      resolved.window_size = 0
    }

    return resolved;
    }
};

module.exports = TerminalApproachFeedback;
