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

class MaxJoyVelocityRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_joy_velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('max_joy_velocity')) {
        this.max_joy_velocity = initObj.max_joy_velocity
      }
      else {
        this.max_joy_velocity = new Array(6).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MaxJoyVelocityRequest
    // Check that the constant length array field [max_joy_velocity] has the right length
    if (obj.max_joy_velocity.length !== 6) {
      throw new Error('Unable to serialize array field max_joy_velocity - length must be 6')
    }
    // Serialize message field [max_joy_velocity]
    bufferOffset = _arraySerializer.float64(obj.max_joy_velocity, buffer, bufferOffset, 6);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MaxJoyVelocityRequest
    let len;
    let data = new MaxJoyVelocityRequest(null);
    // Deserialize message field [max_joy_velocity]
    data.max_joy_velocity = _arrayDeserializer.float64(buffer, bufferOffset, 6)
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cola2_msgs/MaxJoyVelocityRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c7f20c1d0717a3f66479201f5a5bfb61';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[6] max_joy_velocity
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MaxJoyVelocityRequest(null);
    if (msg.max_joy_velocity !== undefined) {
      resolved.max_joy_velocity = msg.max_joy_velocity;
    }
    else {
      resolved.max_joy_velocity = new Array(6).fill(0)
    }

    return resolved;
    }
};

class MaxJoyVelocityResponse {
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
    // Serializes a message object of type MaxJoyVelocityResponse
    // Serialize message field [attempted]
    bufferOffset = _serializer.bool(obj.attempted, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MaxJoyVelocityResponse
    let len;
    let data = new MaxJoyVelocityResponse(null);
    // Deserialize message field [attempted]
    data.attempted = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cola2_msgs/MaxJoyVelocityResponse';
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
    const resolved = new MaxJoyVelocityResponse(null);
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
  Request: MaxJoyVelocityRequest,
  Response: MaxJoyVelocityResponse,
  md5sum() { return '65b63e684f31e94916e054c6a4a1b57f'; },
  datatype() { return 'cola2_msgs/MaxJoyVelocity'; }
};
