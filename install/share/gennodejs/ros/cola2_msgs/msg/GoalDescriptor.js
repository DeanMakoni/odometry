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

class GoalDescriptor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.requester = null;
      this.priority = null;
    }
    else {
      if (initObj.hasOwnProperty('requester')) {
        this.requester = initObj.requester
      }
      else {
        this.requester = '';
      }
      if (initObj.hasOwnProperty('priority')) {
        this.priority = initObj.priority
      }
      else {
        this.priority = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoalDescriptor
    // Serialize message field [requester]
    bufferOffset = _serializer.string(obj.requester, buffer, bufferOffset);
    // Serialize message field [priority]
    bufferOffset = _serializer.uint32(obj.priority, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoalDescriptor
    let len;
    let data = new GoalDescriptor(null);
    // Deserialize message field [requester]
    data.requester = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [priority]
    data.priority = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.requester);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/GoalDescriptor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '258dba3ec3a05ff24abe0733c68cf73a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Contains values common to all waypoint request and status messages.
    # Waypoint goals with higher priority trump lower priority goals. For
    # goals of the same priority, the pilot should follow the latest
    # received.
    
    # Name of the requesting node, used with id to identify the request.
    string requester
    
    uint32 priority
    
    # PRIORITY DEFINITIONS
    uint32 PRIORITY_TELEOPERATION_LOW = 0
    uint32 PRIORITY_SAFETY_LOW = 5
    uint32 PRIORITY_NORMAL = 10
    uint32 PRIORITY_SAFETY = 30
    uint32 PRIORITY_TELEOPERATION = 40
    uint32 PRIORITY_SAFETY_HIGH  = 50
    uint32 PRIORITY_TELEOPERATION_HIGH = 60
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoalDescriptor(null);
    if (msg.requester !== undefined) {
      resolved.requester = msg.requester;
    }
    else {
      resolved.requester = ''
    }

    if (msg.priority !== undefined) {
      resolved.priority = msg.priority;
    }
    else {
      resolved.priority = 0
    }

    return resolved;
    }
};

// Constants for message
GoalDescriptor.Constants = {
  PRIORITY_TELEOPERATION_LOW: 0,
  PRIORITY_SAFETY_LOW: 5,
  PRIORITY_NORMAL: 10,
  PRIORITY_SAFETY: 30,
  PRIORITY_TELEOPERATION: 40,
  PRIORITY_SAFETY_HIGH: 50,
  PRIORITY_TELEOPERATION_HIGH: 60,
}

module.exports = GoalDescriptor;
