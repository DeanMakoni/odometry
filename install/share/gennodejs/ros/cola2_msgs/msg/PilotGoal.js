// Auto-generated. Do not edit!

// (in-package cola2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GoalDescriptor = require('./GoalDescriptor.js');

//-----------------------------------------------------------

class PilotGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.initial_latitude = null;
      this.initial_longitude = null;
      this.initial_depth = null;
      this.final_latitude = null;
      this.final_longitude = null;
      this.final_depth = null;
      this.final_yaw = null;
      this.final_altitude = null;
      this.heave_mode = null;
      this.surge_velocity = null;
      this.tolerance_xy = null;
      this.timeout = null;
      this.controller_type = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('initial_latitude')) {
        this.initial_latitude = initObj.initial_latitude
      }
      else {
        this.initial_latitude = 0.0;
      }
      if (initObj.hasOwnProperty('initial_longitude')) {
        this.initial_longitude = initObj.initial_longitude
      }
      else {
        this.initial_longitude = 0.0;
      }
      if (initObj.hasOwnProperty('initial_depth')) {
        this.initial_depth = initObj.initial_depth
      }
      else {
        this.initial_depth = 0.0;
      }
      if (initObj.hasOwnProperty('final_latitude')) {
        this.final_latitude = initObj.final_latitude
      }
      else {
        this.final_latitude = 0.0;
      }
      if (initObj.hasOwnProperty('final_longitude')) {
        this.final_longitude = initObj.final_longitude
      }
      else {
        this.final_longitude = 0.0;
      }
      if (initObj.hasOwnProperty('final_depth')) {
        this.final_depth = initObj.final_depth
      }
      else {
        this.final_depth = 0.0;
      }
      if (initObj.hasOwnProperty('final_yaw')) {
        this.final_yaw = initObj.final_yaw
      }
      else {
        this.final_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('final_altitude')) {
        this.final_altitude = initObj.final_altitude
      }
      else {
        this.final_altitude = 0.0;
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
      if (initObj.hasOwnProperty('controller_type')) {
        this.controller_type = initObj.controller_type
      }
      else {
        this.controller_type = 0;
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new GoalDescriptor();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PilotGoal
    // Serialize message field [initial_latitude]
    bufferOffset = _serializer.float64(obj.initial_latitude, buffer, bufferOffset);
    // Serialize message field [initial_longitude]
    bufferOffset = _serializer.float64(obj.initial_longitude, buffer, bufferOffset);
    // Serialize message field [initial_depth]
    bufferOffset = _serializer.float64(obj.initial_depth, buffer, bufferOffset);
    // Serialize message field [final_latitude]
    bufferOffset = _serializer.float64(obj.final_latitude, buffer, bufferOffset);
    // Serialize message field [final_longitude]
    bufferOffset = _serializer.float64(obj.final_longitude, buffer, bufferOffset);
    // Serialize message field [final_depth]
    bufferOffset = _serializer.float64(obj.final_depth, buffer, bufferOffset);
    // Serialize message field [final_yaw]
    bufferOffset = _serializer.float64(obj.final_yaw, buffer, bufferOffset);
    // Serialize message field [final_altitude]
    bufferOffset = _serializer.float64(obj.final_altitude, buffer, bufferOffset);
    // Serialize message field [heave_mode]
    bufferOffset = _serializer.uint64(obj.heave_mode, buffer, bufferOffset);
    // Serialize message field [surge_velocity]
    bufferOffset = _serializer.float64(obj.surge_velocity, buffer, bufferOffset);
    // Serialize message field [tolerance_xy]
    bufferOffset = _serializer.float64(obj.tolerance_xy, buffer, bufferOffset);
    // Serialize message field [timeout]
    bufferOffset = _serializer.float64(obj.timeout, buffer, bufferOffset);
    // Serialize message field [controller_type]
    bufferOffset = _serializer.uint64(obj.controller_type, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = GoalDescriptor.serialize(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PilotGoal
    let len;
    let data = new PilotGoal(null);
    // Deserialize message field [initial_latitude]
    data.initial_latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [initial_longitude]
    data.initial_longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [initial_depth]
    data.initial_depth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_latitude]
    data.final_latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_longitude]
    data.final_longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_depth]
    data.final_depth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_yaw]
    data.final_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [final_altitude]
    data.final_altitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [heave_mode]
    data.heave_mode = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [surge_velocity]
    data.surge_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tolerance_xy]
    data.tolerance_xy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [timeout]
    data.timeout = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [controller_type]
    data.controller_type = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = GoalDescriptor.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += GoalDescriptor.getMessageSize(object.goal);
    return length + 104;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/PilotGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc5e515316b2127f5f22f67e085e5c8d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Define the REQUEST
    
    # Initial state
    float64 initial_latitude
    float64 initial_longitude
    float64 initial_depth
    
    # Final state
    float64 final_latitude
    float64 final_longitude
    float64 final_depth
    float64 final_yaw
    float64 final_altitude
    
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
    
    # Controller type
    uint64 controller_type
    uint64 SECTION=0
    uint64 ANCHOR=1
    uint64 HOLONOMIC_KEEP_POSITION=2
    
    # Requester and priority
    cola2_msgs/GoalDescriptor goal
    
    
    ================================================================================
    MSG: cola2_msgs/GoalDescriptor
    # Contains values common to all waypoint request and status messages.
    # Waypoint goals with higher priority trump lower priority goals. For
    # goals of the same priority, the pilot should follow the latest
    # received.
    
    # Name of the requesting node, used with id to identify the request.
    string requester
    
    uint32 priority
    
    # PRIORITY DEFINITIONS
    uint32 PRIORITY_TELEOPERATION_LOW = 0
    uint32 PRIORITY_SAFETY_LOW = 5
    uint32 PRIORITY_NORMAL = 10
    uint32 PRIORITY_SAFETY = 30
    uint32 PRIORITY_TELEOPERATION = 40
    uint32 PRIORITY_SAFETY_HIGH  = 50
    uint32 PRIORITY_TELEOPERATION_HIGH = 60
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PilotGoal(null);
    if (msg.initial_latitude !== undefined) {
      resolved.initial_latitude = msg.initial_latitude;
    }
    else {
      resolved.initial_latitude = 0.0
    }

    if (msg.initial_longitude !== undefined) {
      resolved.initial_longitude = msg.initial_longitude;
    }
    else {
      resolved.initial_longitude = 0.0
    }

    if (msg.initial_depth !== undefined) {
      resolved.initial_depth = msg.initial_depth;
    }
    else {
      resolved.initial_depth = 0.0
    }

    if (msg.final_latitude !== undefined) {
      resolved.final_latitude = msg.final_latitude;
    }
    else {
      resolved.final_latitude = 0.0
    }

    if (msg.final_longitude !== undefined) {
      resolved.final_longitude = msg.final_longitude;
    }
    else {
      resolved.final_longitude = 0.0
    }

    if (msg.final_depth !== undefined) {
      resolved.final_depth = msg.final_depth;
    }
    else {
      resolved.final_depth = 0.0
    }

    if (msg.final_yaw !== undefined) {
      resolved.final_yaw = msg.final_yaw;
    }
    else {
      resolved.final_yaw = 0.0
    }

    if (msg.final_altitude !== undefined) {
      resolved.final_altitude = msg.final_altitude;
    }
    else {
      resolved.final_altitude = 0.0
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

    if (msg.controller_type !== undefined) {
      resolved.controller_type = msg.controller_type;
    }
    else {
      resolved.controller_type = 0
    }

    if (msg.goal !== undefined) {
      resolved.goal = GoalDescriptor.Resolve(msg.goal)
    }
    else {
      resolved.goal = new GoalDescriptor()
    }

    return resolved;
    }
};

// Constants for message
PilotGoal.Constants = {
  DEPTH: 0,
  ALTITUDE: 1,
  BOTH: 2,
  SECTION: 0,
  ANCHOR: 1,
  HOLONOMIC_KEEP_POSITION: 2,
}

module.exports = PilotGoal;
