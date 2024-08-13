// Auto-generated. Do not edit!

// (in-package cola2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SSSConfig {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.samples_per_channel = null;
      this.range_delay = null;
      this.range = null;
      this.horizontal_beam_angle = null;
      this.vertical_beam_angle = null;
      this.speed_of_sound = null;
      this.ping_rate = null;
      this.frequency = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('samples_per_channel')) {
        this.samples_per_channel = initObj.samples_per_channel
      }
      else {
        this.samples_per_channel = 0;
      }
      if (initObj.hasOwnProperty('range_delay')) {
        this.range_delay = initObj.range_delay
      }
      else {
        this.range_delay = 0.0;
      }
      if (initObj.hasOwnProperty('range')) {
        this.range = initObj.range
      }
      else {
        this.range = 0.0;
      }
      if (initObj.hasOwnProperty('horizontal_beam_angle')) {
        this.horizontal_beam_angle = initObj.horizontal_beam_angle
      }
      else {
        this.horizontal_beam_angle = 0.0;
      }
      if (initObj.hasOwnProperty('vertical_beam_angle')) {
        this.vertical_beam_angle = initObj.vertical_beam_angle
      }
      else {
        this.vertical_beam_angle = 0.0;
      }
      if (initObj.hasOwnProperty('speed_of_sound')) {
        this.speed_of_sound = initObj.speed_of_sound
      }
      else {
        this.speed_of_sound = 0.0;
      }
      if (initObj.hasOwnProperty('ping_rate')) {
        this.ping_rate = initObj.ping_rate
      }
      else {
        this.ping_rate = 0.0;
      }
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SSSConfig
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [samples_per_channel]
    bufferOffset = _serializer.uint32(obj.samples_per_channel, buffer, bufferOffset);
    // Serialize message field [range_delay]
    bufferOffset = _serializer.float64(obj.range_delay, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.float64(obj.range, buffer, bufferOffset);
    // Serialize message field [horizontal_beam_angle]
    bufferOffset = _serializer.float64(obj.horizontal_beam_angle, buffer, bufferOffset);
    // Serialize message field [vertical_beam_angle]
    bufferOffset = _serializer.float64(obj.vertical_beam_angle, buffer, bufferOffset);
    // Serialize message field [speed_of_sound]
    bufferOffset = _serializer.float64(obj.speed_of_sound, buffer, bufferOffset);
    // Serialize message field [ping_rate]
    bufferOffset = _serializer.float64(obj.ping_rate, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float64(obj.frequency, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SSSConfig
    let len;
    let data = new SSSConfig(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [samples_per_channel]
    data.samples_per_channel = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [range_delay]
    data.range_delay = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [horizontal_beam_angle]
    data.horizontal_beam_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vertical_beam_angle]
    data.vertical_beam_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_of_sound]
    data.speed_of_sound = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ping_rate]
    data.ping_rate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [frequency]
    data.frequency = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/SSSConfig';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '64f9d5e370a88668538a0266b9541ab7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    uint32 samples_per_channel
    
    float64 range_delay #In meters
    float64 range #In meters
    
    float64 horizontal_beam_angle #Radians Set to 0 if unknown.
    float64 vertical_beam_angle #Radians Set to 0 if unknown.
    
    float64 speed_of_sound  #In m/s
    float64 ping_rate #In Hz
    float64 frequency #In Hz
    
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
    const resolved = new SSSConfig(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.samples_per_channel !== undefined) {
      resolved.samples_per_channel = msg.samples_per_channel;
    }
    else {
      resolved.samples_per_channel = 0
    }

    if (msg.range_delay !== undefined) {
      resolved.range_delay = msg.range_delay;
    }
    else {
      resolved.range_delay = 0.0
    }

    if (msg.range !== undefined) {
      resolved.range = msg.range;
    }
    else {
      resolved.range = 0.0
    }

    if (msg.horizontal_beam_angle !== undefined) {
      resolved.horizontal_beam_angle = msg.horizontal_beam_angle;
    }
    else {
      resolved.horizontal_beam_angle = 0.0
    }

    if (msg.vertical_beam_angle !== undefined) {
      resolved.vertical_beam_angle = msg.vertical_beam_angle;
    }
    else {
      resolved.vertical_beam_angle = 0.0
    }

    if (msg.speed_of_sound !== undefined) {
      resolved.speed_of_sound = msg.speed_of_sound;
    }
    else {
      resolved.speed_of_sound = 0.0
    }

    if (msg.ping_rate !== undefined) {
      resolved.ping_rate = msg.ping_rate;
    }
    else {
      resolved.ping_rate = 0.0
    }

    if (msg.frequency !== undefined) {
      resolved.frequency = msg.frequency;
    }
    else {
      resolved.frequency = 0.0
    }

    return resolved;
    }
};

module.exports = SSSConfig;
