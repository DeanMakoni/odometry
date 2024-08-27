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
let Bool6Axis = require('./Bool6Axis.js');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BodyForceReq {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.goal = null;
      this.wrench = null;
      this.disable_axis = null;
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
      if (initObj.hasOwnProperty('wrench')) {
        this.wrench = initObj.wrench
      }
      else {
        this.wrench = new geometry_msgs.msg.Wrench();
      }
      if (initObj.hasOwnProperty('disable_axis')) {
        this.disable_axis = initObj.disable_axis
      }
      else {
        this.disable_axis = new Bool6Axis();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BodyForceReq
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = GoalDescriptor.serialize(obj.goal, buffer, bufferOffset);
    // Serialize message field [wrench]
    bufferOffset = geometry_msgs.msg.Wrench.serialize(obj.wrench, buffer, bufferOffset);
    // Serialize message field [disable_axis]
    bufferOffset = Bool6Axis.serialize(obj.disable_axis, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BodyForceReq
    let len;
    let data = new BodyForceReq(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = GoalDescriptor.deserialize(buffer, bufferOffset);
    // Deserialize message field [wrench]
    data.wrench = geometry_msgs.msg.Wrench.deserialize(buffer, bufferOffset);
    // Deserialize message field [disable_axis]
    data.disable_axis = Bool6Axis.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += GoalDescriptor.getMessageSize(object.goal);
    return length + 54;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/BodyForceReq';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52927ed08d592b6a522c3a968c2c48b0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Body frame vehicle velocity request.
    # No coordinate units, values range +/- 1.
    # NB: Coordinate frame used is ROS standard [forward, left, up],
    # to simplify integration with arm control systems.
    
    # header.frame_id should be set to the base_link frame of the vehicle.
    Header header
    
    GoalDescriptor goal
    
    geometry_msgs/Wrench wrench
    
    # Axes of control to disable, in body frame.
    Bool6Axis disable_axis
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
    MSG: geometry_msgs/Wrench
    # This represents force in free space, separated into
    # its linear and angular parts.
    Vector3  force
    Vector3  torque
    
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
    ================================================================================
    MSG: cola2_msgs/Bool6Axis
    bool x
    bool y
    bool z
    bool roll
    bool pitch
    bool yaw
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BodyForceReq(null);
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

    if (msg.wrench !== undefined) {
      resolved.wrench = geometry_msgs.msg.Wrench.Resolve(msg.wrench)
    }
    else {
      resolved.wrench = new geometry_msgs.msg.Wrench()
    }

    if (msg.disable_axis !== undefined) {
      resolved.disable_axis = Bool6Axis.Resolve(msg.disable_axis)
    }
    else {
      resolved.disable_axis = new Bool6Axis()
    }

    return resolved;
    }
};

module.exports = BodyForceReq;
