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

class FlsConfig {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.num_beams = null;
      this.num_samples = null;
      this.window_start = null;
      this.window_end = null;
      this.beams_bearings = null;
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
      if (initObj.hasOwnProperty('num_beams')) {
        this.num_beams = initObj.num_beams
      }
      else {
        this.num_beams = 0;
      }
      if (initObj.hasOwnProperty('num_samples')) {
        this.num_samples = initObj.num_samples
      }
      else {
        this.num_samples = 0;
      }
      if (initObj.hasOwnProperty('window_start')) {
        this.window_start = initObj.window_start
      }
      else {
        this.window_start = 0.0;
      }
      if (initObj.hasOwnProperty('window_end')) {
        this.window_end = initObj.window_end
      }
      else {
        this.window_end = 0.0;
      }
      if (initObj.hasOwnProperty('beams_bearings')) {
        this.beams_bearings = initObj.beams_bearings
      }
      else {
        this.beams_bearings = [];
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
    // Serializes a message object of type FlsConfig
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [num_beams]
    bufferOffset = _serializer.uint32(obj.num_beams, buffer, bufferOffset);
    // Serialize message field [num_samples]
    bufferOffset = _serializer.uint32(obj.num_samples, buffer, bufferOffset);
    // Serialize message field [window_start]
    bufferOffset = _serializer.float64(obj.window_start, buffer, bufferOffset);
    // Serialize message field [window_end]
    bufferOffset = _serializer.float64(obj.window_end, buffer, bufferOffset);
    // Serialize message field [beams_bearings]
    bufferOffset = _arraySerializer.float32(obj.beams_bearings, buffer, bufferOffset, null);
    // Serialize message field [speed_of_sound]
    bufferOffset = _serializer.float64(obj.speed_of_sound, buffer, bufferOffset);
    // Serialize message field [ping_rate]
    bufferOffset = _serializer.float64(obj.ping_rate, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float64(obj.frequency, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FlsConfig
    let len;
    let data = new FlsConfig(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_beams]
    data.num_beams = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [num_samples]
    data.num_samples = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [window_start]
    data.window_start = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [window_end]
    data.window_end = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [beams_bearings]
    data.beams_bearings = _arrayDeserializer.float32(buffer, bufferOffset, null)
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
    length += 4 * object.beams_bearings.length;
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/FlsConfig';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2d805f6f59bab24b847a6204ee111a7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message must be tied to a sensor_msgs/Image message that contains the corresponding polar image. The header 
    # timestamp of both messages must be exactly the same.
    # The polar image's first row must correspond to the farthest return sample, with the last row being the closest return
    # sample.
    # The polar image's first column must correspond to the leftmost beam from the POV of the FLS sensor (negative angle 
    # value), with the last column being the rightmost beam (positive angle value).
    
    Header 	header
    
    uint32 num_beams
    uint32 num_samples
    
    float64 window_start #In meters.
    float64 window_end #In meters
    
    float32[] beams_bearings #In radians
    
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
    const resolved = new FlsConfig(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.num_beams !== undefined) {
      resolved.num_beams = msg.num_beams;
    }
    else {
      resolved.num_beams = 0
    }

    if (msg.num_samples !== undefined) {
      resolved.num_samples = msg.num_samples;
    }
    else {
      resolved.num_samples = 0
    }

    if (msg.window_start !== undefined) {
      resolved.window_start = msg.window_start;
    }
    else {
      resolved.window_start = 0.0
    }

    if (msg.window_end !== undefined) {
      resolved.window_end = msg.window_end;
    }
    else {
      resolved.window_end = 0.0
    }

    if (msg.beams_bearings !== undefined) {
      resolved.beams_bearings = msg.beams_bearings;
    }
    else {
      resolved.beams_bearings = []
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

module.exports = FlsConfig;
