// Auto-generated. Do not edit!

// (in-package task2.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class FeatureBuilderRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.flg = null;
    }
    else {
      if (initObj.hasOwnProperty('flg')) {
        this.flg = initObj.flg
      }
      else {
        this.flg = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FeatureBuilderRequest
    // Serialize message field [flg]
    bufferOffset = _serializer.int64(obj.flg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FeatureBuilderRequest
    let len;
    let data = new FeatureBuilderRequest(null);
    // Deserialize message field [flg]
    data.flg = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task2/FeatureBuilderRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8e58b690355adaa882da8790bb22595';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 flg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FeatureBuilderRequest(null);
    if (msg.flg !== undefined) {
      resolved.flg = msg.flg;
    }
    else {
      resolved.flg = 0
    }

    return resolved;
    }
};

class FeatureBuilderResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.res = null;
    }
    else {
      if (initObj.hasOwnProperty('res')) {
        this.res = initObj.res
      }
      else {
        this.res = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FeatureBuilderResponse
    // Serialize message field [res]
    bufferOffset = _serializer.string(obj.res, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FeatureBuilderResponse
    let len;
    let data = new FeatureBuilderResponse(null);
    // Deserialize message field [res]
    data.res = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.res.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task2/FeatureBuilderResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '53af918a2a4a2a182c184142fff49b0c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string res
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FeatureBuilderResponse(null);
    if (msg.res !== undefined) {
      resolved.res = msg.res;
    }
    else {
      resolved.res = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: FeatureBuilderRequest,
  Response: FeatureBuilderResponse,
  md5sum() { return '74768431c7b5d3256bc92cadde0c032a'; },
  datatype() { return 'task2/FeatureBuilder'; }
};
