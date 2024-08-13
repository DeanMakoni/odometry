# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cola2_msgs/NavSts.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import cola2_msgs.msg
import geometry_msgs.msg
import std_msgs.msg

class NavSts(genpy.Message):
  _md5sum = "0ba23d6197aed7a9fab08613fe8fc381"
  _type = "cola2_msgs/NavSts"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """# Sent by the navigator

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

"""
  __slots__ = ['header','global_position','origin','position','altitude','body_velocity','orientation','orientation_rate','position_variance','orientation_variance']
  _slot_types = ['std_msgs/Header','cola2_msgs/DecimalLatLon','cola2_msgs/DecimalLatLon','cola2_msgs/NED','float32','geometry_msgs/Point','cola2_msgs/RPY','cola2_msgs/RPY','cola2_msgs/NED','cola2_msgs/RPY']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,global_position,origin,position,altitude,body_velocity,orientation,orientation_rate,position_variance,orientation_variance

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(NavSts, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.global_position is None:
        self.global_position = cola2_msgs.msg.DecimalLatLon()
      if self.origin is None:
        self.origin = cola2_msgs.msg.DecimalLatLon()
      if self.position is None:
        self.position = cola2_msgs.msg.NED()
      if self.altitude is None:
        self.altitude = 0.
      if self.body_velocity is None:
        self.body_velocity = geometry_msgs.msg.Point()
      if self.orientation is None:
        self.orientation = cola2_msgs.msg.RPY()
      if self.orientation_rate is None:
        self.orientation_rate = cola2_msgs.msg.RPY()
      if self.position_variance is None:
        self.position_variance = cola2_msgs.msg.NED()
      if self.orientation_variance is None:
        self.orientation_variance = cola2_msgs.msg.RPY()
    else:
      self.header = std_msgs.msg.Header()
      self.global_position = cola2_msgs.msg.DecimalLatLon()
      self.origin = cola2_msgs.msg.DecimalLatLon()
      self.position = cola2_msgs.msg.NED()
      self.altitude = 0.
      self.body_velocity = geometry_msgs.msg.Point()
      self.orientation = cola2_msgs.msg.RPY()
      self.orientation_rate = cola2_msgs.msg.RPY()
      self.position_variance = cola2_msgs.msg.NED()
      self.orientation_variance = cola2_msgs.msg.RPY()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_7df3d6f3d3f().pack(_x.global_position.latitude, _x.global_position.longitude, _x.origin.latitude, _x.origin.longitude, _x.position.north, _x.position.east, _x.position.depth, _x.altitude, _x.body_velocity.x, _x.body_velocity.y, _x.body_velocity.z, _x.orientation.roll, _x.orientation.pitch, _x.orientation.yaw, _x.orientation_rate.roll, _x.orientation_rate.pitch, _x.orientation_rate.yaw, _x.position_variance.north, _x.position_variance.east, _x.position_variance.depth, _x.orientation_variance.roll, _x.orientation_variance.pitch, _x.orientation_variance.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.global_position is None:
        self.global_position = cola2_msgs.msg.DecimalLatLon()
      if self.origin is None:
        self.origin = cola2_msgs.msg.DecimalLatLon()
      if self.position is None:
        self.position = cola2_msgs.msg.NED()
      if self.body_velocity is None:
        self.body_velocity = geometry_msgs.msg.Point()
      if self.orientation is None:
        self.orientation = cola2_msgs.msg.RPY()
      if self.orientation_rate is None:
        self.orientation_rate = cola2_msgs.msg.RPY()
      if self.position_variance is None:
        self.position_variance = cola2_msgs.msg.NED()
      if self.orientation_variance is None:
        self.orientation_variance = cola2_msgs.msg.RPY()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 144
      (_x.global_position.latitude, _x.global_position.longitude, _x.origin.latitude, _x.origin.longitude, _x.position.north, _x.position.east, _x.position.depth, _x.altitude, _x.body_velocity.x, _x.body_velocity.y, _x.body_velocity.z, _x.orientation.roll, _x.orientation.pitch, _x.orientation.yaw, _x.orientation_rate.roll, _x.orientation_rate.pitch, _x.orientation_rate.yaw, _x.position_variance.north, _x.position_variance.east, _x.position_variance.depth, _x.orientation_variance.roll, _x.orientation_variance.pitch, _x.orientation_variance.yaw,) = _get_struct_7df3d6f3d3f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_7df3d6f3d3f().pack(_x.global_position.latitude, _x.global_position.longitude, _x.origin.latitude, _x.origin.longitude, _x.position.north, _x.position.east, _x.position.depth, _x.altitude, _x.body_velocity.x, _x.body_velocity.y, _x.body_velocity.z, _x.orientation.roll, _x.orientation.pitch, _x.orientation.yaw, _x.orientation_rate.roll, _x.orientation_rate.pitch, _x.orientation_rate.yaw, _x.position_variance.north, _x.position_variance.east, _x.position_variance.depth, _x.orientation_variance.roll, _x.orientation_variance.pitch, _x.orientation_variance.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.global_position is None:
        self.global_position = cola2_msgs.msg.DecimalLatLon()
      if self.origin is None:
        self.origin = cola2_msgs.msg.DecimalLatLon()
      if self.position is None:
        self.position = cola2_msgs.msg.NED()
      if self.body_velocity is None:
        self.body_velocity = geometry_msgs.msg.Point()
      if self.orientation is None:
        self.orientation = cola2_msgs.msg.RPY()
      if self.orientation_rate is None:
        self.orientation_rate = cola2_msgs.msg.RPY()
      if self.position_variance is None:
        self.position_variance = cola2_msgs.msg.NED()
      if self.orientation_variance is None:
        self.orientation_variance = cola2_msgs.msg.RPY()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 144
      (_x.global_position.latitude, _x.global_position.longitude, _x.origin.latitude, _x.origin.longitude, _x.position.north, _x.position.east, _x.position.depth, _x.altitude, _x.body_velocity.x, _x.body_velocity.y, _x.body_velocity.z, _x.orientation.roll, _x.orientation.pitch, _x.orientation.yaw, _x.orientation_rate.roll, _x.orientation_rate.pitch, _x.orientation_rate.yaw, _x.position_variance.north, _x.position_variance.east, _x.position_variance.depth, _x.orientation_variance.roll, _x.orientation_variance.pitch, _x.orientation_variance.yaw,) = _get_struct_7df3d6f3d3f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_7df3d6f3d3f = None
def _get_struct_7df3d6f3d3f():
    global _struct_7df3d6f3d3f
    if _struct_7df3d6f3d3f is None:
        _struct_7df3d6f3d3f = struct.Struct("<7df3d6f3d3f")
    return _struct_7df3d6f3d3f
