// Auto-generated. Do not edit!

// (in-package cola2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MissionState = require('./MissionState.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class CaptainStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.state = null;
      this.message = null;
      this.loaded_missions = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
      if (initObj.hasOwnProperty('loaded_missions')) {
        this.loaded_missions = initObj.loaded_missions
      }
      else {
        this.loaded_missions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CaptainStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = _serializer.uint8(obj.state, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    // Serialize message field [loaded_missions]
    // Serialize the length for message field [loaded_missions]
    bufferOffset = _serializer.uint32(obj.loaded_missions.length, buffer, bufferOffset);
    obj.loaded_missions.forEach((val) => {
      bufferOffset = MissionState.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CaptainStatus
    let len;
    let data = new CaptainStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [loaded_missions]
    // Deserialize array length for message field [loaded_missions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.loaded_missions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.loaded_missions[i] = MissionState.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.message);
    object.loaded_missions.forEach((val) => {
      length += MissionState.getMessageSize(val);
    });
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/CaptainStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '815ee2fcdca21935c6a469f91057679d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # State
    uint8 IDLE = 0
    uint8 GOTO = 1
    uint8 MISSION = 2
    uint8 KEEPPOSITION = 3
    uint8 SAFETYKEEPPOSITION = 4
    uint8 EXTERNALMISSION = 5
    uint8 SECTION = 6
    uint8 state
    
    # Info message
    string message
    
    # List of missions
    cola2_msgs/MissionState[] loaded_missions
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: cola2_msgs/MissionState
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
    const resolved = new CaptainStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    if (msg.loaded_missions !== undefined) {
      resolved.loaded_missions = new Array(msg.loaded_missions.length);
      for (let i = 0; i < resolved.loaded_missions.length; ++i) {
        resolved.loaded_missions[i] = MissionState.Resolve(msg.loaded_missions[i]);
      }
    }
    else {
      resolved.loaded_missions = []
    }

    return resolved;
    }
};

// Constants for message
CaptainStatus.Constants = {
  IDLE: 0,
  GOTO: 1,
  MISSION: 2,
  KEEPPOSITION: 3,
  SAFETYKEEPPOSITION: 4,
  EXTERNALMISSION: 5,
  SECTION: 6,
}

module.exports = CaptainStatus;
