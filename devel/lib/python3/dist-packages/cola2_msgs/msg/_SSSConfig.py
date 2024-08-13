# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cola2_msgs/SSSConfig.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class SSSConfig(genpy.Message):
  _md5sum = "64f9d5e370a88668538a0266b9541ab7"
  _type = "cola2_msgs/SSSConfig"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """Header header

uint32 samples_per_channel

float64 range_delay #In meters
float64 range #In meters

float64 horizontal_beam_angle #Radians Set to 0 if unknown.
float64 vertical_beam_angle #Radians Set to 0 if unknown.

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
"""
  __slots__ = ['header','samples_per_channel','range_delay','range','horizontal_beam_angle','vertical_beam_angle','speed_of_sound','ping_rate','frequency']
  _slot_types = ['std_msgs/Header','uint32','float64','float64','float64','float64','float64','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,samples_per_channel,range_delay,range,horizontal_beam_angle,vertical_beam_angle,speed_of_sound,ping_rate,frequency

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SSSConfig, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.samples_per_channel is None:
        self.samples_per_channel = 0
      if self.range_delay is None:
        self.range_delay = 0.
      if self.range is None:
        self.range = 0.
      if self.horizontal_beam_angle is None:
        self.horizontal_beam_angle = 0.
      if self.vertical_beam_angle is None:
        self.vertical_beam_angle = 0.
      if self.speed_of_sound is None:
        self.speed_of_sound = 0.
      if self.ping_rate is None:
        self.ping_rate = 0.
      if self.frequency is None:
        self.frequency = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.samples_per_channel = 0
      self.range_delay = 0.
      self.range = 0.
      self.horizontal_beam_angle = 0.
      self.vertical_beam_angle = 0.
      self.speed_of_sound = 0.
      self.ping_rate = 0.
      self.frequency = 0.

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
      buff.write(_get_struct_I7d().pack(_x.samples_per_channel, _x.range_delay, _x.range, _x.horizontal_beam_angle, _x.vertical_beam_angle, _x.speed_of_sound, _x.ping_rate, _x.frequency))
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
      end += 60
      (_x.samples_per_channel, _x.range_delay, _x.range, _x.horizontal_beam_angle, _x.vertical_beam_angle, _x.speed_of_sound, _x.ping_rate, _x.frequency,) = _get_struct_I7d().unpack(str[start:end])
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
      buff.write(_get_struct_I7d().pack(_x.samples_per_channel, _x.range_delay, _x.range, _x.horizontal_beam_angle, _x.vertical_beam_angle, _x.speed_of_sound, _x.ping_rate, _x.frequency))
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
      end += 60
      (_x.samples_per_channel, _x.range_delay, _x.range, _x.horizontal_beam_angle, _x.vertical_beam_angle, _x.speed_of_sound, _x.ping_rate, _x.frequency,) = _get_struct_I7d().unpack(str[start:end])
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
_struct_I7d = None
def _get_struct_I7d():
    global _struct_I7d
    if _struct_I7d is None:
        _struct_I7d = struct.Struct("<I7d")
    return _struct_I7d
