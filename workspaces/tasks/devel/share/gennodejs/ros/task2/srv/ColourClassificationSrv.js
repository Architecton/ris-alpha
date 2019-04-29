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

class ColourClassificationSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.features_mat = null;
      this.num_features = null;
    }
    else {
      if (initObj.hasOwnProperty('features_mat')) {
        this.features_mat = initObj.features_mat
      }
      else {
        this.features_mat = [];
      }
      if (initObj.hasOwnProperty('num_features')) {
        this.num_features = initObj.num_features
      }
      else {
        this.num_features = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ColourClassificationSrvRequest
    // Serialize message field [features_mat]
    bufferOffset = _arraySerializer.int64(obj.features_mat, buffer, bufferOffset, null);
    // Serialize message field [num_features]
    bufferOffset = _serializer.int64(obj.num_features, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ColourClassificationSrvRequest
    let len;
    let data = new ColourClassificationSrvRequest(null);
    // Deserialize message field [features_mat]
    data.features_mat = _arrayDeserializer.int64(buffer, bufferOffset, null)
    // Deserialize message field [num_features]
    data.num_features = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.features_mat.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'task2/ColourClassificationSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '63aff3ad827b2f844a2b9710c151a2bc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[] features_mat
    int64 num_features
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ColourClassificationSrvRequest(null);
    if (msg.features_mat !== undefined) {
      resolved.features_mat = msg.features_mat;
    }
    else {
      resolved.features_mat = []
    }

    if (msg.num_features !== undefined) {
      resolved.num_features = msg.num_features;
    }
    else {
      resolved.num_features = 0
    }

    return resolved;
    }
};

class ColourClassificationSrvResponse {
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
    // Serializes a message object of type ColourClassificationSrvResponse
    // Serialize message field [res]
    bufferOffset = _serializer.string(obj.res, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ColourClassificationSrvResponse
    let len;
    let data = new ColourClassificationSrvResponse(null);
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
    return 'task2/ColourClassificationSrvResponse';
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
    const resolved = new ColourClassificationSrvResponse(null);
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
  Request: ColourClassificationSrvRequest,
  Response: ColourClassificationSrvResponse,
  md5sum() { return 'caf04d413f9e4daef949309d687bb7a1'; },
  datatype() { return 'task2/ColourClassificationSrv'; }
};
