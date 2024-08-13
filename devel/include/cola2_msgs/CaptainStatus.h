// Generated by gencpp from file cola2_msgs/CaptainStatus.msg
// DO NOT EDIT!


#ifndef COLA2_MSGS_MESSAGE_CAPTAINSTATUS_H
#define COLA2_MSGS_MESSAGE_CAPTAINSTATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <cola2_msgs/MissionState.h>

namespace cola2_msgs
{
template <class ContainerAllocator>
struct CaptainStatus_
{
  typedef CaptainStatus_<ContainerAllocator> Type;

  CaptainStatus_()
    : header()
    , state(0)
    , message()
    , loaded_missions()  {
    }
  CaptainStatus_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , state(0)
    , message(_alloc)
    , loaded_missions(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _state_type;
  _state_type state;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _message_type;
  _message_type message;

   typedef std::vector< ::cola2_msgs::MissionState_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::cola2_msgs::MissionState_<ContainerAllocator> >> _loaded_missions_type;
  _loaded_missions_type loaded_missions;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(IDLE)
  #undef IDLE
#endif
#if defined(_WIN32) && defined(GOTO)
  #undef GOTO
#endif
#if defined(_WIN32) && defined(MISSION)
  #undef MISSION
#endif
#if defined(_WIN32) && defined(KEEPPOSITION)
  #undef KEEPPOSITION
#endif
#if defined(_WIN32) && defined(SAFETYKEEPPOSITION)
  #undef SAFETYKEEPPOSITION
#endif
#if defined(_WIN32) && defined(EXTERNALMISSION)
  #undef EXTERNALMISSION
#endif
#if defined(_WIN32) && defined(SECTION)
  #undef SECTION
#endif

  enum {
    IDLE = 0u,
    GOTO = 1u,
    MISSION = 2u,
    KEEPPOSITION = 3u,
    SAFETYKEEPPOSITION = 4u,
    EXTERNALMISSION = 5u,
    SECTION = 6u,
  };


  typedef boost::shared_ptr< ::cola2_msgs::CaptainStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cola2_msgs::CaptainStatus_<ContainerAllocator> const> ConstPtr;

}; // struct CaptainStatus_

typedef ::cola2_msgs::CaptainStatus_<std::allocator<void> > CaptainStatus;

typedef boost::shared_ptr< ::cola2_msgs::CaptainStatus > CaptainStatusPtr;
typedef boost::shared_ptr< ::cola2_msgs::CaptainStatus const> CaptainStatusConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cola2_msgs::CaptainStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cola2_msgs::CaptainStatus_<ContainerAllocator1> & lhs, const ::cola2_msgs::CaptainStatus_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.state == rhs.state &&
    lhs.message == rhs.message &&
    lhs.loaded_missions == rhs.loaded_missions;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cola2_msgs::CaptainStatus_<ContainerAllocator1> & lhs, const ::cola2_msgs::CaptainStatus_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cola2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::CaptainStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::CaptainStatus_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::CaptainStatus_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "815ee2fcdca21935c6a469f91057679d";
  }

  static const char* value(const ::cola2_msgs::CaptainStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x815ee2fcdca21935ULL;
  static const uint64_t static_value2 = 0xc6a469f91057679dULL;
};

template<class ContainerAllocator>
struct DataType< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cola2_msgs/CaptainStatus";
  }

  static const char* value(const ::cola2_msgs::CaptainStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"# State\n"
"uint8 IDLE = 0\n"
"uint8 GOTO = 1\n"
"uint8 MISSION = 2\n"
"uint8 KEEPPOSITION = 3\n"
"uint8 SAFETYKEEPPOSITION = 4\n"
"uint8 EXTERNALMISSION = 5\n"
"uint8 SECTION = 6\n"
"uint8 state\n"
"\n"
"# Info message\n"
"string message\n"
"\n"
"# List of missions\n"
"cola2_msgs/MissionState[] loaded_missions\n"
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
"\n"
"================================================================================\n"
"MSG: cola2_msgs/MissionState\n"
"string name\n"
"int32 current_step\n"
"time last_active\n"
;
  }

  static const char* value(const ::cola2_msgs::CaptainStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.state);
      stream.next(m.message);
      stream.next(m.loaded_missions);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CaptainStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cola2_msgs::CaptainStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cola2_msgs::CaptainStatus_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "state: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.state);
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.message);
    s << indent << "loaded_missions[]" << std::endl;
    for (size_t i = 0; i < v.loaded_missions.size(); ++i)
    {
      s << indent << "  loaded_missions[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::cola2_msgs::MissionState_<ContainerAllocator> >::stream(s, indent + "    ", v.loaded_missions[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // COLA2_MSGS_MESSAGE_CAPTAINSTATUS_H
