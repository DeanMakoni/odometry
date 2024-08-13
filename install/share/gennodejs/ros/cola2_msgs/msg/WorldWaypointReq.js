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
let NED = require('./NED.js');
let RPY = require('./RPY.js');
let Bool6Axis = require('./Bool6Axis.js');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class WorldWaypointReq {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.goal = null;
      this.altitude_mode = null;
      this.position = null;
      this.altitude = null;
      this.orientation = null;
      this.disable_axis = null;
      this.position_tolerance = null;
      this.orientation_tolerance = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new GoalDescriptor();
      }
      if (initObj.hasOwnProperty('altitude_mode')) {
        this.altitude_mode = initObj.altitude_mode
      }
      else {
        this.altitude_mode = false;
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
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new RPY();
      }
      if (initObj.hasOwnProperty('disable_axis')) {
        this.disable_axis = initObj.disable_axis
      }
      else {
        this.disable_axis = new Bool6Axis();
      }
      if (initObj.hasOwnProperty('position_tolerance')) {
        this.position_tolerance = initObj.position_tolerance
      }
      else {
        this.position_tolerance = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('orientation_tolerance')) {
        this.orientation_tolerance = initObj.orientation_tolerance
      }
      else {
        this.orientation_tolerance = new RPY();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WorldWaypointReq
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = GoalDescriptor.serialize(obj.goal, buffer, bufferOffset);
    // Serialize message field [altitude_mode]
    bufferOffset = _serializer.bool(obj.altitude_mode, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = NED.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [altitude]
    bufferOffset = _serializer.float32(obj.altitude, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = RPY.serialize(obj.orientation, buffer, bufferOffset);
    // Serialize message field [disable_axis]
    bufferOffset = Bool6Axis.serialize(obj.disable_axis, buffer, bufferOffset);
    // Serialize message field [position_tolerance]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.position_tolerance, buffer, bufferOffset);
    // Serialize message field [orientation_tolerance]
    bufferOffset = RPY.serialize(obj.orientation_tolerance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WorldWaypointReq
    let len;
    let data = new WorldWaypointReq(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = GoalDescriptor.deserialize(buffer, bufferOffset);
    // Deserialize message field [altitude_mode]
    data.altitude_mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = NED.deserialize(buffer, bufferOffset);
    // Deserialize message field [altitude]
    data.altitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = RPY.deserialize(buffer, bufferOffset);
    // Deserialize message field [disable_axis]
    data.disable_axis = Bool6Axis.deserialize(buffer, bufferOffset);
    // Deserialize message field [position_tolerance]
    data.position_tolerance = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation_tolerance]
    data.orientation_tolerance = RPY.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += GoalDescriptor.getMessageSize(object.goal);
    return length + 83;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/WorldWaypointReq';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '768d0aca8857ca6850f95e4b0acf093d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # World frame (absolute) waypoint request to pilot.
    # A new waypoint request should contain a different goal.id
    # (incremented) from previous requests. This same message should then
    # be re-sent at 5-10 Hz.
    
    Header header
    
    # Common waypoint details
    GoalDescriptor goal
    
    # If true, maintain Z position relative to altitude, otherwise depth.
    bool altitude_mode
    
    cola2_msgs/NED position
    float32 altitude
    RPY orientation
    
    # Axes of control to disable, in body frame.
    Bool6Axis disable_axis
    
    # Tolerances are in body frame, zero indicates pilot default should be used.
    geometry_msgs/Vector3 position_tolerance
    RPY orientation_tolerance
    
    
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
    MSG: cola2_msgs/RPY
    # Orientation or orientation velocity in a frame consistent with the right-handed NED coordinate frame.
    
    # Fixed-axis roll, in radians. Positive clockwise rotation about the X axis, looking forward.
    float32 roll
    
    # Fixed-axis pitch, in radians. Positive upwards rotation of the vehicle nose about the Y axis.
    float32 pitch
    
    # Fixed-axis yaw, in radians. Positive clockwise rotation about the Z axis, looking down.
    float32 yaw
    
    
    ================================================================================
    MSG: cola2_msgs/Bool6Axis
    bool x
    bool y
    bool z
    bool roll
    bool pitch
    bool yaw
    
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WorldWaypointReq(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.goal !== undefined) {
      resolved.goal = GoalDescriptor.Resolve(msg.goal)
    }
    else {
      resolved.goal = new GoalDescriptor()
    }

    if (msg.altitude_mode !== undefined) {
      resolved.altitude_mode = msg.altitude_mode;
    }
    else {
      resolved.altitude_mode = false
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

    if (msg.orientation !== undefined) {
      resolved.orientation = RPY.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new RPY()
    }

    if (msg.disable_axis !== undefined) {
      resolved.disable_axis = Bool6Axis.Resolve(msg.disable_axis)
    }
    else {
      resolved.disable_axis = new Bool6Axis()
    }

    if (msg.position_tolerance !== undefined) {
      resolved.position_tolerance = geometry_msgs.msg.Vector3.Resolve(msg.position_tolerance)
    }
    else {
      resolved.position_tolerance = new geometry_msgs.msg.Vector3()
    }

    if (msg.orientation_tolerance !== undefined) {
      resolved.orientation_tolerance = RPY.Resolve(msg.orientation_tolerance)
    }
    else {
      resolved.orientation_tolerance = new RPY()
    }

    return resolved;
    }
};

module.exports = WorldWaypointReq;
