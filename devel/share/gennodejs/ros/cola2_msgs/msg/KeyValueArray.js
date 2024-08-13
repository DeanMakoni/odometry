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

//-----------------------------------------------------------

class KeyValueArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.keyvalues = null;
    }
    else {
      if (initObj.hasOwnProperty('keyvalues')) {
        this.keyvalues = initObj.keyvalues
      }
      else {
        this.keyvalues = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KeyValueArray
    // Serialize message field [keyvalues]
    // Serialize the length for message field [keyvalues]
    bufferOffset = _serializer.uint32(obj.keyvalues.length, buffer, bufferOffset);
    obj.keyvalues.forEach((val) => {
      bufferOffset = KeyValue.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KeyValueArray
    let len;
    let data = new KeyValueArray(null);
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
    object.keyvalues.forEach((val) => {
      length += KeyValue.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cola2_msgs/KeyValueArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e6aed4084986fd7ac11d4023a138269c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cola2_msgs/KeyValue[] keyvalues
    
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
    const resolved = new KeyValueArray(null);
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

module.exports = KeyValueArray;
