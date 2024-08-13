// Auto-generated. Do not edit!

// (in-package cola2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RecoveryAction = require('./RecoveryAction.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SafetySupervisorStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.status_code = null;
      this.recovery_action = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('status_code')) {
        this.status_code = initObj.status_code
      }
      else {
        this.status_code = 0;
      }
      if (initObj.hasOwnProperty('recovery_action')) {
        this.recovery_action = initObj.recovery_action
      }
      else {
        this.recovery_action = new RecoveryAction();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SafetySupervisorStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [status_code]
    bufferOffset = _serializer.uint32(obj.status_code, buffer, bufferOffset);
    // Serialize message field [recovery_action]
    bufferOffset = RecoveryAction.serialize(obj.recovery_action, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SafetySupervisorStatus
    let len;
    let data = new SafetySupervisorStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [recovery_action]
    data.recovery_action = RecoveryAction.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += RecoveryAction.getMessageSize(object.recovery_action);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/SafetySupervisorStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '30e23638810e8d36f193cd10c740af04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint32 status_code
    cola2_msgs/RecoveryAction recovery_action
    
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
    MSG: cola2_msgs/RecoveryAction
    # Error level
    uint16 NONE = 0
    uint16 INFORMATIVE = 1
    uint16 ABORT = 2
    uint16 ABORT_AND_SURFACE = 3
    uint16 EMERGENCY_SURFACE = 4
    uint16 DROP_WEIGHT = 5
    
    Header header
    uint16 error_level
    string error_string
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SafetySupervisorStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.status_code !== undefined) {
      resolved.status_code = msg.status_code;
    }
    else {
      resolved.status_code = 0
    }

    if (msg.recovery_action !== undefined) {
      resolved.recovery_action = RecoveryAction.Resolve(msg.recovery_action)
    }
    else {
      resolved.recovery_action = new RecoveryAction()
    }

    return resolved;
    }
};

module.exports = SafetySupervisorStatus;
