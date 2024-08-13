// Auto-generated. Do not edit!

// (in-package cola2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let KeyValue = require('./KeyValue.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class CaptainStateFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.state = null;
      this.time_to_finish = null;
      this.name = null;
      this.id = null;
      this.keyvalues = null;
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
      if (initObj.hasOwnProperty('time_to_finish')) {
        this.time_to_finish = initObj.time_to_finish
      }
      else {
        this.time_to_finish = 0.0;
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('keyvalues')) {
        this.keyvalues = initObj.keyvalues
      }
      else {
        this.keyvalues = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CaptainStateFeedback
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = _serializer.uint8(obj.state, buffer, bufferOffset);
    // Serialize message field [time_to_finish]
    bufferOffset = _serializer.float64(obj.time_to_finish, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint16(obj.id, buffer, bufferOffset);
    // Serialize message field [keyvalues]
    // Serialize the length for message field [keyvalues]
    bufferOffset = _serializer.uint32(obj.keyvalues.length, buffer, bufferOffset);
    obj.keyvalues.forEach((val) => {
      bufferOffset = KeyValue.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CaptainStateFeedback
    let len;
    let data = new CaptainStateFeedback(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [time_to_finish]
    data.time_to_finish = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [keyvalues]
    // Deserialize array length for message field [keyvalues]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.keyvalues = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.keyvalues[i] = KeyValue.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.name);
    object.keyvalues.forEach((val) => {
      length += KeyValue.getMessageSize(val);
    });
    return length + 19;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/CaptainStateFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'afefd4ce4fb740bbeb3fade79326e0f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # State
    uint8 ACTIVE = 0
    uint8 SUCCESS = 1
    uint8 FAILURE = 2
    uint8 STOPPED = 3
    uint8 state
    
    # An estimate of the remaining time
    float64 time_to_finish
    
    # Name of the mode
    string name
    
    # Always increasing id assigned by the captain
    uint16 id
    
    # Extra information as a key-value list
    cola2_msgs/KeyValue[] keyvalues
    
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
    MSG: cola2_msgs/KeyValue
    string key
    string value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CaptainStateFeedback(null);
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

    if (msg.time_to_finish !== undefined) {
      resolved.time_to_finish = msg.time_to_finish;
    }
    else {
      resolved.time_to_finish = 0.0
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.keyvalues !== undefined) {
      resolved.keyvalues = new Array(msg.keyvalues.length);
      for (let i = 0; i < resolved.keyvalues.length; ++i) {
        resolved.keyvalues[i] = KeyValue.Resolve(msg.keyvalues[i]);
      }
    }
    else {
      resolved.keyvalues = []
    }

    return resolved;
    }
};

// Constants for message
CaptainStateFeedback.Constants = {
  ACTIVE: 0,
  SUCCESS: 1,
  FAILURE: 2,
  STOPPED: 3,
}

module.exports = CaptainStateFeedback;
