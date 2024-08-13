// Auto-generated. Do not edit!

// (in-package cola2_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RecoveryAction = require('../msg/RecoveryAction.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class RecoveryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.requested_action = null;
    }
    else {
      if (initObj.hasOwnProperty('requested_action')) {
        this.requested_action = initObj.requested_action
      }
      else {
        this.requested_action = new RecoveryAction();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RecoveryRequest
    // Serialize message field [requested_action]
    bufferOffset = RecoveryAction.serialize(obj.requested_action, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RecoveryRequest
    let len;
    let data = new RecoveryRequest(null);
    // Deserialize message field [requested_action]
    data.requested_action = RecoveryAction.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += RecoveryAction.getMessageSize(object.requested_action);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cola2_msgs/RecoveryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c6364eac6bcc134fef369b10a2fc6997';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cola2_msgs/RecoveryAction requested_action
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RecoveryRequest(null);
    if (msg.requested_action !== undefined) {
      resolved.requested_action = RecoveryAction.Resolve(msg.requested_action)
    }
    else {
      resolved.requested_action = new RecoveryAction()
    }

    return resolved;
    }
};

class RecoveryResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.attempted = null;
    }
    else {
      if (initObj.hasOwnProperty('attempted')) {
        this.attempted = initObj.attempted
      }
      else {
        this.attempted = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RecoveryResponse
    // Serialize message field [attempted]
    bufferOffset = _serializer.bool(obj.attempted, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RecoveryResponse
    let len;
    let data = new RecoveryResponse(null);
    // Deserialize message field [attempted]
    data.attempted = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cola2_msgs/RecoveryResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '70f46e6393e2715db0559943d3e7b477';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool attempted
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RecoveryResponse(null);
    if (msg.attempted !== undefined) {
      resolved.attempted = msg.attempted;
    }
    else {
      resolved.attempted = false
    }

    return resolved;
    }
};

module.exports = {
  Request: RecoveryRequest,
  Response: RecoveryResponse,
  md5sum() { return '44dc867ef177deea4414ea94077e9b72'; },
  datatype() { return 'cola2_msgs/Recovery'; }
};
