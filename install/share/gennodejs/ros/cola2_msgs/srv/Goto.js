// Auto-generated. Do not edit!

// (in-package cola2_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GotoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.final_x = null;
      this.final_y = null;
      this.final_depth = null;
      this.final_altitude = null;
      this.reference = null;
      this.heave_mode = null;
      this.surge_velocity = null;
      this.tolerance_xy = null;
      this.timeout = null;
      this.no_altitude_goes_up = null;
    }
    else {
      if (initObj.hasOwnProperty('final_x')) {
        this.final_x = initObj.final_x
      }
      else {
        this.final_x = 0.0;
      }
      if (initObj.hasOwnProperty('final_y')) {
        this.final_y = initObj.final_y
      }
      else {
        this.final_y = 0.0;
      }
      if (initObj.hasOwnProperty('final_depth')) {
        this.final_depth = initObj.final_depth
      }
      else {
        this.final_depth = 0.0;
      }
      if (initObj.hasOwnProperty('final_altitude')) {
        this.final_altitude = initObj.final_altitude
      }
      else {
        this.final_altitude = 0.0;
      }
      if (initObj.hasOwnProperty('reference')) {
        this.reference = initObj.reference
      }
      else {
        this.reference = 0;
      }
      if (initObj.hasOwnProperty('heave_mode')) {
        this.heave_mode = initObj.heave_mode
      }
      else {
        this.heave_mode = 0;
      }
      if (initObj.hasOwnProperty('surge_velocity')) {
        this.surge_velocity = initObj.surge_velocity
      }
      else {
        this.surge_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('tolerance_xy')) {
        this.tolerance_xy = initObj.tolerance_xy
      }
      else {
        this.tolerance_xy = 0.0;
      }
      if (initObj.hasOwnProperty('timeout')) {
        this.timeout = initObj.timeout
      }
      else {
        this.timeout = 0.0;
      }
      if (initObj.hasOwnProperty('no_altitude_goes_up')) {
        this.no_altitude_goes_up = initObj.no_altitude_goes_up
      }
      else {
        this.no_altitude_goes_up = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GotoRequest
    // Serialize message field [final_x]
    bufferOffset = _serializer.float64(obj.final_x, buffer, bufferOffset);
    // Serialize message field [final_y]
    bufferOffset = _serializer.float64(obj.final_y, buffer, bufferOffset);
    // Serialize message field [final_depth]
    bufferOffset = _serializer.float64(obj.final_depth, buffer, bufferOffset);
    // Serialize message field [final_altitude]
    bufferOffset = _serializer.float64(obj.final_altitude, buffer, bufferOffset);
    // Serialize message field [reference]
    bufferOffset = _serializer.uint8(obj.reference, buffer, bufferOffset);
    // Serialize message field [heave_mode]
    bufferOffset = _serializer.uint64(obj.heave_mode, buffer, bufferOffset);
    // Serialize message field [surge_velocity]
    bufferOffset = _serializer.float64(obj.surge_velocity, buffer, bufferOffset);
    // Serialize message field [tolerance_xy]
    bufferOffset = _serializer.float64(obj.tolerance_xy, buffer, bufferOffset);
    // Serialize message field [timeout]
    bufferOffset = _serializer.float64(obj.timeout, buffer, bufferOffset);
    // Serialize message field [no_altitude_goes_up]
    bufferOffset = _serializer.bool(obj.no_altitude_goes_up, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GotoRequest
    let len;
    let data = new GotoRequest(null);
    // Deserialize message field [final_x]
    data.final_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_y]
    data.final_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_depth]
    data.final_depth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_altitude]
    data.final_altitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [reference]
    data.reference = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [heave_mode]
    data.heave_mode = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [surge_velocity]
    data.surge_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tolerance_xy]
    data.tolerance_xy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [timeout]
    data.timeout = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [no_altitude_goes_up]
    data.no_altitude_goes_up = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 66;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cola2_msgs/GotoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99d15622a6bf183f635ce6a1882f2224';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Final state
    float64 final_x
    float64 final_y
    float64 final_depth
    float64 final_altitude
    
    # Reference frame for both the inital and final positions
    uint8 NED=0
    uint8 GLOBAL=1
    uint8 reference
    
    # Heave mode
    uint64 heave_mode
    uint64 DEPTH=0
    uint64 ALTITUDE=1
    uint64 BOTH=2
    
    # Surge velocity
    float64 surge_velocity
    
    # Tolerance
    float64 tolerance_xy
    
    # Timeout
    float64 timeout
    
    # No altitude reactive behavior
    bool no_altitude_goes_up
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GotoRequest(null);
    if (msg.final_x !== undefined) {
      resolved.final_x = msg.final_x;
    }
    else {
      resolved.final_x = 0.0
    }

    if (msg.final_y !== undefined) {
      resolved.final_y = msg.final_y;
    }
    else {
      resolved.final_y = 0.0
    }

    if (msg.final_depth !== undefined) {
      resolved.final_depth = msg.final_depth;
    }
    else {
      resolved.final_depth = 0.0
    }

    if (msg.final_altitude !== undefined) {
      resolved.final_altitude = msg.final_altitude;
    }
    else {
      resolved.final_altitude = 0.0
    }

    if (msg.reference !== undefined) {
      resolved.reference = msg.reference;
    }
    else {
      resolved.reference = 0
    }

    if (msg.heave_mode !== undefined) {
      resolved.heave_mode = msg.heave_mode;
    }
    else {
      resolved.heave_mode = 0
    }

    if (msg.surge_velocity !== undefined) {
      resolved.surge_velocity = msg.surge_velocity;
    }
    else {
      resolved.surge_velocity = 0.0
    }

    if (msg.tolerance_xy !== undefined) {
      resolved.tolerance_xy = msg.tolerance_xy;
    }
    else {
      resolved.tolerance_xy = 0.0
    }

    if (msg.timeout !== undefined) {
      resolved.timeout = msg.timeout;
    }
    else {
      resolved.timeout = 0.0
    }

    if (msg.no_altitude_goes_up !== undefined) {
      resolved.no_altitude_goes_up = msg.no_altitude_goes_up;
    }
    else {
      resolved.no_altitude_goes_up = false
    }

    return resolved;
    }
};

// Constants for message
GotoRequest.Constants = {
  NED: 0,
  GLOBAL: 1,
  DEPTH: 0,
  ALTITUDE: 1,
  BOTH: 2,
}

class GotoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GotoResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GotoResponse
    let len;
    let data = new GotoResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cola2_msgs/GotoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GotoResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: GotoRequest,
  Response: GotoResponse,
  md5sum() { return 'd7ca42db7492724e2ad137e654c018a7'; },
  datatype() { return 'cola2_msgs/Goto'; }
};
