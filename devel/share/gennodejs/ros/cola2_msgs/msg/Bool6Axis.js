// Auto-generated. Do not edit!

// (in-package cola2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Bool6Axis {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = false;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = false;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = false;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = false;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = false;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Bool6Axis
    // Serialize message field [x]
    bufferOffset = _serializer.bool(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.bool(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.bool(obj.z, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.bool(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.bool(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.bool(obj.yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Bool6Axis
    let len;
    let data = new Bool6Axis(null);
    // Deserialize message field [x]
    data.x = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/Bool6Axis';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '38f836659cedbc069e466741ffb25422';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool x
    bool y
    bool z
    bool roll
    bool pitch
    bool yaw
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Bool6Axis(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = false
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = false
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = false
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = false
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = false
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = false
    }

    return resolved;
    }
};

module.exports = Bool6Axis;
