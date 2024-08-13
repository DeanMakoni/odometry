# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cola2_msgs/GoalDescriptor.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class GoalDescriptor(genpy.Message):
  _md5sum = "258dba3ec3a05ff24abe0733c68cf73a"
  _type = "cola2_msgs/GoalDescriptor"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Contains values common to all waypoint request and status messages.
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
"""
  # Pseudo-constants
  PRIORITY_TELEOPERATION_LOW = 0
  PRIORITY_SAFETY_LOW = 5
  PRIORITY_NORMAL = 10
  PRIORITY_SAFETY = 30
  PRIORITY_TELEOPERATION = 40
  PRIORITY_SAFETY_HIGH = 50
  PRIORITY_TELEOPERATION_HIGH = 60

  __slots__ = ['requester','priority']
  _slot_types = ['string','uint32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       requester,priority

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(GoalDescriptor, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.requester is None:
        self.requester = ''
      if self.priority is None:
        self.priority = 0
    else:
      self.requester = ''
      self.priority = 0

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
      _x = self.requester
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.priority
      buff.write(_get_struct_I().pack(_x))
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
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.requester = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.requester = str[start:end]
      start = end
      end += 4
      (self.priority,) = _get_struct_I().unpack(str[start:end])
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
      _x = self.requester
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.priority
      buff.write(_get_struct_I().pack(_x))
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
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.requester = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.requester = str[start:end]
      start = end
      end += 4
      (self.priority,) = _get_struct_I().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
