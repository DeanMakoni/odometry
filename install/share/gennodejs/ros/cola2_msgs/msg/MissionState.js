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

class MissionState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.current_step = null;
      this.last_active = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('current_step')) {
        this.current_step = initObj.current_step
      }
      else {
        this.current_step = 0;
      }
      if (initObj.hasOwnProperty('last_active')) {
        this.last_active = initObj.last_active
      }
      else {
        this.last_active = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MissionState
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [current_step]
    bufferOffset = _serializer.int32(obj.current_step, buffer, bufferOffset);
    // Serialize message field [last_active]
    bufferOffset = _serializer.time(obj.last_active, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MissionState
    let len;
    let data = new MissionState(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [current_step]
    data.current_step = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [last_active]
    data.last_active = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/MissionState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b22991b6c5683eeec05d46250572c6e6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    int32 current_step
    time last_active
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MissionState(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.current_step !== undefined) {
      resolved.current_step = msg.current_step;
    }
    else {
      resolved.current_step = 0
    }

    if (msg.last_active !== undefined) {
      resolved.last_active = msg.last_active;
    }
    else {
      resolved.last_active = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = MissionState;
