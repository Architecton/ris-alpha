// Auto-generated. Do not edit!

// (in-package exercise5.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class EllipseData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.found = null;
      this.dpt = null;
      this.agl = null;
      this.timestamp = null;
    }
    else {
      if (initObj.hasOwnProperty('found')) {
        this.found = initObj.found
      }
      else {
        this.found = 0;
      }
      if (initObj.hasOwnProperty('dpt')) {
        this.dpt = initObj.dpt
      }
      else {
        this.dpt = 0.0;
      }
      if (initObj.hasOwnProperty('agl')) {
        this.agl = initObj.agl
      }
      else {
        this.agl = 0.0;
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EllipseData
    // Serialize message field [found]
    bufferOffset = _serializer.uint8(obj.found, buffer, bufferOffset);
    // Serialize message field [dpt]
    bufferOffset = _serializer.float64(obj.dpt, buffer, bufferOffset);
    // Serialize message field [agl]
    bufferOffset = _serializer.float64(obj.agl, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.float64(obj.timestamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EllipseData
    let len;
    let data = new EllipseData(null);
    // Deserialize message field [found]
    data.found = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dpt]
    data.dpt = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [agl]
    data.agl = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'exercise5/EllipseData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36c8d02dac602442e37993aa5885ef00';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Found flag that takes on values 1 or 0 (ellipse detected or not)
    uint8 found
    
    #Depth value at pixel representing the centre of the found ellipse
    #Contains garbage if found flag value equal to 0
    float64 dpt
    
    #angle_min + index_center*angle_increment
    float64 agl
    
    #result of rospy.Time.now().to_time() when image taken
    float64 timestamp
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EllipseData(null);
    if (msg.found !== undefined) {
      resolved.found = msg.found;
    }
    else {
      resolved.found = 0
    }

    if (msg.dpt !== undefined) {
      resolved.dpt = msg.dpt;
    }
    else {
      resolved.dpt = 0.0
    }

    if (msg.agl !== undefined) {
      resolved.agl = msg.agl;
    }
    else {
      resolved.agl = 0.0
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0.0
    }

    return resolved;
    }
};

module.exports = EllipseData;
