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

class ImageAcquisitionSettings {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.exposure_time = null;
      this.gain = null;
      this.blue_ratio = null;
      this.red_ratio = null;
      this.focus = null;
      this.aperture = null;
      this.focal_length = null;
      this.extra = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('exposure_time')) {
        this.exposure_time = initObj.exposure_time
      }
      else {
        this.exposure_time = 0;
      }
      if (initObj.hasOwnProperty('gain')) {
        this.gain = initObj.gain
      }
      else {
        this.gain = 0.0;
      }
      if (initObj.hasOwnProperty('blue_ratio')) {
        this.blue_ratio = initObj.blue_ratio
      }
      else {
        this.blue_ratio = 0.0;
      }
      if (initObj.hasOwnProperty('red_ratio')) {
        this.red_ratio = initObj.red_ratio
      }
      else {
        this.red_ratio = 0.0;
      }
      if (initObj.hasOwnProperty('focus')) {
        this.focus = initObj.focus
      }
      else {
        this.focus = 0.0;
      }
      if (initObj.hasOwnProperty('aperture')) {
        this.aperture = initObj.aperture
      }
      else {
        this.aperture = 0.0;
      }
      if (initObj.hasOwnProperty('focal_length')) {
        this.focal_length = initObj.focal_length
      }
      else {
        this.focal_length = 0.0;
      }
      if (initObj.hasOwnProperty('extra')) {
        this.extra = initObj.extra
      }
      else {
        this.extra = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageAcquisitionSettings
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [exposure_time]
    bufferOffset = _serializer.uint32(obj.exposure_time, buffer, bufferOffset);
    // Serialize message field [gain]
    bufferOffset = _serializer.float64(obj.gain, buffer, bufferOffset);
    // Serialize message field [blue_ratio]
    bufferOffset = _serializer.float64(obj.blue_ratio, buffer, bufferOffset);
    // Serialize message field [red_ratio]
    bufferOffset = _serializer.float64(obj.red_ratio, buffer, bufferOffset);
    // Serialize message field [focus]
    bufferOffset = _serializer.float64(obj.focus, buffer, bufferOffset);
    // Serialize message field [aperture]
    bufferOffset = _serializer.float64(obj.aperture, buffer, bufferOffset);
    // Serialize message field [focal_length]
    bufferOffset = _serializer.float64(obj.focal_length, buffer, bufferOffset);
    // Serialize message field [extra]
    // Serialize the length for message field [extra]
    bufferOffset = _serializer.uint32(obj.extra.length, buffer, bufferOffset);
    obj.extra.forEach((val) => {
      bufferOffset = KeyValue.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageAcquisitionSettings
    let len;
    let data = new ImageAcquisitionSettings(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [exposure_time]
    data.exposure_time = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [gain]
    data.gain = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [blue_ratio]
    data.blue_ratio = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [red_ratio]
    data.red_ratio = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [focus]
    data.focus = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aperture]
    data.aperture = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [focal_length]
    data.focal_length = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [extra]
    // Deserialize array length for message field [extra]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.extra = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.extra[i] = KeyValue.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.extra.forEach((val) => {
      length += KeyValue.getMessageSize(val);
    });
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/ImageAcquisitionSettings';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '96d48fe2b8fa7d286d513edba3e44323';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    # Exposure time in us (microseonds)
    uint32 exposure_time
    # Gain in dB
    float64 gain
    # White balance blue ratio
    float64 blue_ratio
    # White balance red ratio
    float64 red_ratio
    # Focus distance (m)
    float64 focus
    # Aperture (f/#)
    float64 aperture
    #Focal length according to lens manufacturer (mm)
    float64 focal_length
    # Extra information
    cola2_msgs/KeyValue[] extra
    
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
    const resolved = new ImageAcquisitionSettings(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.exposure_time !== undefined) {
      resolved.exposure_time = msg.exposure_time;
    }
    else {
      resolved.exposure_time = 0
    }

    if (msg.gain !== undefined) {
      resolved.gain = msg.gain;
    }
    else {
      resolved.gain = 0.0
    }

    if (msg.blue_ratio !== undefined) {
      resolved.blue_ratio = msg.blue_ratio;
    }
    else {
      resolved.blue_ratio = 0.0
    }

    if (msg.red_ratio !== undefined) {
      resolved.red_ratio = msg.red_ratio;
    }
    else {
      resolved.red_ratio = 0.0
    }

    if (msg.focus !== undefined) {
      resolved.focus = msg.focus;
    }
    else {
      resolved.focus = 0.0
    }

    if (msg.aperture !== undefined) {
      resolved.aperture = msg.aperture;
    }
    else {
      resolved.aperture = 0.0
    }

    if (msg.focal_length !== undefined) {
      resolved.focal_length = msg.focal_length;
    }
    else {
      resolved.focal_length = 0.0
    }

    if (msg.extra !== undefined) {
      resolved.extra = new Array(msg.extra.length);
      for (let i = 0; i < resolved.extra.length; ++i) {
        resolved.extra[i] = KeyValue.Resolve(msg.extra[i]);
      }
    }
    else {
      resolved.extra = []
    }

    return resolved;
    }
};

module.exports = ImageAcquisitionSettings;
