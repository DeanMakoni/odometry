// Generated by gencpp from file cola2_msgs/RecoveryAction.msg
// DO NOT EDIT!


#ifndef COLA2_MSGS_MESSAGE_RECOVERYACTION_H
#define COLA2_MSGS_MESSAGE_RECOVERYACTION_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace cola2_msgs
{
template <class ContainerAllocator>
struct RecoveryAction_
{
  typedef RecoveryAction_<ContainerAllocator> Type;

  RecoveryAction_()
    : header()
    , error_level(0)
    , error_string()  {
    }
  RecoveryAction_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , error_level(0)
    , error_string(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint16_t _error_level_type;
  _error_level_type error_level;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _error_string_type;
  _error_string_type error_string;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(NONE)
  #undef NONE
#endif
#if defined(_WIN32) && defined(INFORMATIVE)
  #undef INFORMATIVE
#endif
#if defined(_WIN32) && defined(ABORT)
  #undef ABORT
#endif
#if defined(_WIN32) && defined(ABORT_AND_SURFACE)
  #undef ABORT_AND_SURFACE
#endif
#if defined(_WIN32) && defined(EMERGENCY_SURFACE)
  #undef EMERGENCY_SURFACE
#endif
#if defined(_WIN32) && defined(DROP_WEIGHT)
  #undef DROP_WEIGHT
#endif

  enum {
    NONE = 0u,
    INFORMATIVE = 1u,
    ABORT = 2u,
    ABORT_AND_SURFACE = 3u,
    EMERGENCY_SURFACE = 4u,
    DROP_WEIGHT = 5u,
  };


  typedef boost::shared_ptr< ::cola2_msgs::RecoveryAction_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cola2_msgs::RecoveryAction_<ContainerAllocator> const> ConstPtr;

}; // struct RecoveryAction_

typedef ::cola2_msgs::RecoveryAction_<std::allocator<void> > RecoveryAction;

typedef boost::shared_ptr< ::cola2_msgs::RecoveryAction > RecoveryActionPtr;
typedef boost::shared_ptr< ::cola2_msgs::RecoveryAction const> RecoveryActionConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cola2_msgs::RecoveryAction_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cola2_msgs::RecoveryAction_<ContainerAllocator1> & lhs, const ::cola2_msgs::RecoveryAction_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.error_level == rhs.error_level &&
    lhs.error_string == rhs.error_string;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cola2_msgs::RecoveryAction_<ContainerAllocator1> & lhs, const ::cola2_msgs::RecoveryAction_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cola2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::RecoveryAction_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::RecoveryAction_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::RecoveryAction_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "51b8f8c4fd7ace03db669a6d31c4068f";
  }

  static const char* value(const ::cola2_msgs::RecoveryAction_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x51b8f8c4fd7ace03ULL;
  static const uint64_t static_value2 = 0xdb669a6d31c4068fULL;
};

template<class ContainerAllocator>
struct DataType< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cola2_msgs/RecoveryAction";
  }

  static const char* value(const ::cola2_msgs::RecoveryAction_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Error level\n"
"uint16 NONE = 0\n"
"uint16 INFORMATIVE = 1\n"
"uint16 ABORT = 2\n"
"uint16 ABORT_AND_SURFACE = 3\n"
"uint16 EMERGENCY_SURFACE = 4\n"
"uint16 DROP_WEIGHT = 5\n"
"\n"
"Header header\n"
"uint16 error_level\n"
"string error_string\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::cola2_msgs::RecoveryAction_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.error_level);
      stream.next(m.error_string);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RecoveryAction_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cola2_msgs::RecoveryAction_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cola2_msgs::RecoveryAction_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "error_level: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.error_level);
    s << indent << "error_string: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.error_string);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COLA2_MSGS_MESSAGE_RECOVERYACTION_H
