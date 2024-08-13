// Auto-generated. Do not edit!

// (in-package cola2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DecimalLatLon = require('./DecimalLatLon.js');
let NED = require('./NED.js');
let RPY = require('./RPY.js');
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class NavSts {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.global_position = null;
      this.origin = null;
      this.position = null;
      this.altitude = null;
      this.body_velocity = null;
      this.orientation = null;
      this.orientation_rate = null;
      this.position_variance = null;
      this.orientation_variance = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('global_position')) {
        this.global_position = initObj.global_position
      }
      else {
        this.global_position = new DecimalLatLon();
      }
      if (initObj.hasOwnProperty('origin')) {
        this.origin = initObj.origin
      }
      else {
        this.origin = new DecimalLatLon();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new NED();
      }
      if (initObj.hasOwnProperty('altitude')) {
        this.altitude = initObj.altitude
      }
      else {
        this.altitude = 0.0;
      }
      if (initObj.hasOwnProperty('body_velocity')) {
        this.body_velocity = initObj.body_velocity
      }
      else {
        this.body_velocity = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new RPY();
      }
      if (initObj.hasOwnProperty('orientation_rate')) {
        this.orientation_rate = initObj.orientation_rate
      }
      else {
        this.orientation_rate = new RPY();
      }
      if (initObj.hasOwnProperty('position_variance')) {
        this.position_variance = initObj.position_variance
      }
      else {
        this.position_variance = new NED();
      }
      if (initObj.hasOwnProperty('orientation_variance')) {
        this.orientation_variance = initObj.orientation_variance
      }
      else {
        this.orientation_variance = new RPY();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavSts
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [global_position]
    bufferOffset = DecimalLatLon.serialize(obj.global_position, buffer, bufferOffset);
    // Serialize message field [origin]
    bufferOffset = DecimalLatLon.serialize(obj.origin, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = NED.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [altitude]
    bufferOffset = _serializer.float32(obj.altitude, buffer, bufferOffset);
    // Serialize message field [body_velocity]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.body_velocity, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = RPY.serialize(obj.orientation, buffer, bufferOffset);
    // Serialize message field [orientation_rate]
    bufferOffset = RPY.serialize(obj.orientation_rate, buffer, bufferOffset);
    // Serialize message field [position_variance]
    bufferOffset = NED.serialize(obj.position_variance, buffer, bufferOffset);
    // Serialize message field [orientation_variance]
    bufferOffset = RPY.serialize(obj.orientation_variance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavSts
    let len;
    let data = new NavSts(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [global_position]
    data.global_position = DecimalLatLon.deserialize(buffer, bufferOffset);
    // Deserialize message field [origin]
    data.origin = DecimalLatLon.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = NED.deserialize(buffer, bufferOffset);
    // Deserialize message field [altitude]
    data.altitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [body_velocity]
    data.body_velocity = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = RPY.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation_rate]
    data.orientation_rate = RPY.deserialize(buffer, bufferOffset);
    // Deserialize message field [position_variance]
    data.position_variance = NED.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation_variance]
    data.orientation_variance = RPY.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 144;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/NavSts';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ba23d6197aed7a9fab08613fe8fc381';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Sent by the navigator
    
    Header 	header
    
    DecimalLatLon global_position
    DecimalLatLon origin
    
    # NED position and altitude in metres. 
    NED position
    float32 altitude
    
    # Body velocities in metres/sec.
    geometry_msgs/Point body_velocity
    
    # Orientation and orientation rate are in radians and radians/sec
    RPY orientation
    RPY orientation_rate
    
    # Variances for position and orientation
    NED position_variance
    RPY orientation_variance
    
    
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
    MSG: cola2_msgs/DecimalLatLon
    # Latitude and longitude, in decimal form.
    
    float64 latitude
    float64 longitude
    
    
    ================================================================================
    MSG: cola2_msgs/NED
    # Position or velocity in the right-handed NED coordinate frame.
    
    # metres north, positive towards true north.
    float64 north
    
    # metres east, positive towards true east.
    float64 east
    
    # metres down, positive towards the centre of the earth.
    float64 depth
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: cola2_msgs/RPY
    # Orientation or orientation velocity in a frame consistent with the right-handed NED coordinate frame.
    
    # Fixed-axis roll, in radians. Positive clockwise rotation about the X axis, looking forward.
    float32 roll
    
    # Fixed-axis pitch, in radians. Positive upwards rotation of the vehicle nose about the Y axis.
    float32 pitch
    
    # Fixed-axis yaw, in radians. Positive clockwise rotation about the Z axis, looking down.
    float32 yaw
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavSts(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.global_position !== undefined) {
      resolved.global_position = DecimalLatLon.Resolve(msg.global_position)
    }
    else {
      resolved.global_position = new DecimalLatLon()
    }

    if (msg.origin !== undefined) {
      resolved.origin = DecimalLatLon.Resolve(msg.origin)
    }
    else {
      resolved.origin = new DecimalLatLon()
    }

    if (msg.position !== undefined) {
      resolved.position = NED.Resolve(msg.position)
    }
    else {
      resolved.position = new NED()
    }

    if (msg.altitude !== undefined) {
      resolved.altitude = msg.altitude;
    }
    else {
      resolved.altitude = 0.0
    }

    if (msg.body_velocity !== undefined) {
      resolved.body_velocity = geometry_msgs.msg.Point.Resolve(msg.body_velocity)
    }
    else {
      resolved.body_velocity = new geometry_msgs.msg.Point()
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = RPY.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new RPY()
    }

    if (msg.orientation_rate !== undefined) {
      resolved.orientation_rate = RPY.Resolve(msg.orientation_rate)
    }
    else {
      resolved.orientation_rate = new RPY()
    }

    if (msg.position_variance !== undefined) {
      resolved.position_variance = NED.Resolve(msg.position_variance)
    }
    else {
      resolved.position_variance = new NED()
    }

    if (msg.orientation_variance !== undefined) {
      resolved.orientation_variance = RPY.Resolve(msg.orientation_variance)
    }
    else {
      resolved.orientation_variance = new RPY()
    }

    return resolved;
    }
};

module.exports = NavSts;
