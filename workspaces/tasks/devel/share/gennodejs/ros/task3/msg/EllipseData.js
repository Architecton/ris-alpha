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

class EllipseData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.found = null;
      this.dpt = null;
      this.agl = null;
      this.timestamp = null;
      this.perp_agl = null;
      this.perp_y_itrcpt = null;
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
        this.dpt = [];
      }
      if (initObj.hasOwnProperty('agl')) {
        this.agl = initObj.agl
      }
      else {
        this.agl = [];
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = [];
      }
      if (initObj.hasOwnProperty('perp_agl')) {
        this.perp_agl = initObj.perp_agl
      }
      else {
        this.perp_agl = [];
      }
      if (initObj.hasOwnProperty('perp_y_itrcpt')) {
        this.perp_y_itrcpt = initObj.perp_y_itrcpt
      }
      else {
        this.perp_y_itrcpt = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EllipseData
    // Serialize message field [found]
    bufferOffset = _serializer.uint8(obj.found, buffer, bufferOffset);
    // Serialize message field [dpt]
    bufferOffset = _arraySerializer.float64(obj.dpt, buffer, bufferOffset, null);
    // Serialize message field [agl]
    bufferOffset = _arraySerializer.float64(obj.agl, buffer, bufferOffset, null);
    // Serialize message field [timestamp]
    bufferOffset = _arraySerializer.float64(obj.timestamp, buffer, bufferOffset, null);
    // Serialize message field [perp_agl]
    bufferOffset = _arraySerializer.float64(obj.perp_agl, buffer, bufferOffset, null);
    // Serialize message field [perp_y_itrcpt]
    bufferOffset = _arraySerializer.float64(obj.perp_y_itrcpt, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EllipseData
    let len;
    let data = new EllipseData(null);
    // Deserialize message field [found]
    data.found = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dpt]
    data.dpt = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [agl]
    data.agl = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [timestamp]
    data.timestamp = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [perp_agl]
    data.perp_agl = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [perp_y_itrcpt]
    data.perp_y_itrcpt = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.dpt.length;
    length += 8 * object.agl.length;
    length += 8 * object.timestamp.length;
    length += 8 * object.perp_agl.length;
    length += 8 * object.perp_y_itrcpt.length;
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'task3/EllipseData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd912b32b2cc4be2dc6d9a88df7bfe800';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Found flag that takes on values 1 or 0 (ellipse detected or not)
    uint8 found
    
    #Depth value at pixel representing the centre of the found ellipse
    #Contains garbage if found flag value equal to 0
    float64[] dpt
    
    #angle_min + index_center*angle_increment
    float64[] agl
    
    #result of rospy.Time.now().to_time() when image taken
    float64[] timestamp
    
    #angle of line perpendicular to the face of the ellipse
    float64[] perp_agl
    
    #y intercept of the line perpendicular to the face of the ellips
    float64[] perp_y_itrcpt
    
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
      resolved.dpt = []
    }

    if (msg.agl !== undefined) {
      resolved.agl = msg.agl;
    }
    else {
      resolved.agl = []
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = []
    }

    if (msg.perp_agl !== undefined) {
      resolved.perp_agl = msg.perp_agl;
    }
    else {
      resolved.perp_agl = []
    }

    if (msg.perp_y_itrcpt !== undefined) {
      resolved.perp_y_itrcpt = msg.perp_y_itrcpt;
    }
    else {
      resolved.perp_y_itrcpt = []
    }

    return resolved;
    }
};

module.exports = EllipseData;
