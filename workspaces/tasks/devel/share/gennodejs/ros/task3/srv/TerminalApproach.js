// Auto-generated. Do not edit!

// (in-package task3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TerminalApproachFeedback = require('../msg/TerminalApproachFeedback.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class TerminalApproachRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('feedback')) {
        this.feedback = initObj.feedback
      }
      else {
        this.feedback = new TerminalApproachFeedback();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TerminalApproachRequest
    // Serialize message field [feedback]
    bufferOffset = TerminalApproachFeedback.serialize(obj.feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TerminalApproachRequest
    let len;
    let data = new TerminalApproachRequest(null);
    // Deserialize message field [feedback]
    data.feedback = TerminalApproachFeedback.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/TerminalApproachRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fe183daa6c268d4e2a978bceb0e5896f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    TerminalApproachFeedback feedback
    
    ================================================================================
    MSG: task3/TerminalApproachFeedback
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
    const resolved = new TerminalApproachRequest(null);
    if (msg.feedback !== undefined) {
      resolved.feedback = TerminalApproachFeedback.Resolve(msg.feedback)
    }
    else {
      resolved.feedback = new TerminalApproachFeedback()
    }

    return resolved;
    }
};

class TerminalApproachResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TerminalApproachResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TerminalApproachResponse
    let len;
    let data = new TerminalApproachResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task3/TerminalApproachResponse';
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
    const resolved = new TerminalApproachResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: TerminalApproachRequest,
  Response: TerminalApproachResponse,
  md5sum() { return 'fe183daa6c268d4e2a978bceb0e5896f'; },
  datatype() { return 'task3/TerminalApproach'; }
};
