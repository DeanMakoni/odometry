// Generated by gencpp from file cola2_msgs/FlsConfig.msg
// DO NOT EDIT!


#ifndef COLA2_MSGS_MESSAGE_FLSCONFIG_H
#define COLA2_MSGS_MESSAGE_FLSCONFIG_H


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
struct FlsConfig_
{
  typedef FlsConfig_<ContainerAllocator> Type;

  FlsConfig_()
    : header()
    , num_beams(0)
    , num_samples(0)
    , window_start(0.0)
    , window_end(0.0)
    , beams_bearings()
    , speed_of_sound(0.0)
    , ping_rate(0.0)
    , frequency(0.0)  {
    }
  FlsConfig_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , num_beams(0)
    , num_samples(0)
    , window_start(0.0)
    , window_end(0.0)
    , beams_bearings(_alloc)
    , speed_of_sound(0.0)
    , ping_rate(0.0)
    , frequency(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint32_t _num_beams_type;
  _num_beams_type num_beams;

   typedef uint32_t _num_samples_type;
  _num_samples_type num_samples;

   typedef double _window_start_type;
  _window_start_type window_start;

   typedef double _window_end_type;
  _window_end_type window_end;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _beams_bearings_type;
  _beams_bearings_type beams_bearings;

   typedef double _speed_of_sound_type;
  _speed_of_sound_type speed_of_sound;

   typedef double _ping_rate_type;
  _ping_rate_type ping_rate;

   typedef double _frequency_type;
  _frequency_type frequency;





  typedef boost::shared_ptr< ::cola2_msgs::FlsConfig_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cola2_msgs::FlsConfig_<ContainerAllocator> const> ConstPtr;

}; // struct FlsConfig_

typedef ::cola2_msgs::FlsConfig_<std::allocator<void> > FlsConfig;

typedef boost::shared_ptr< ::cola2_msgs::FlsConfig > FlsConfigPtr;
typedef boost::shared_ptr< ::cola2_msgs::FlsConfig const> FlsConfigConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cola2_msgs::FlsConfig_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cola2_msgs::FlsConfig_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cola2_msgs::FlsConfig_<ContainerAllocator1> & lhs, const ::cola2_msgs::FlsConfig_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.num_beams == rhs.num_beams &&
    lhs.num_samples == rhs.num_samples &&
    lhs.window_start == rhs.window_start &&
    lhs.window_end == rhs.window_end &&
    lhs.beams_bearings == rhs.beams_bearings &&
    lhs.speed_of_sound == rhs.speed_of_sound &&
    lhs.ping_rate == rhs.ping_rate &&
    lhs.frequency == rhs.frequency;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cola2_msgs::FlsConfig_<ContainerAllocator1> & lhs, const ::cola2_msgs::FlsConfig_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cola2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::FlsConfig_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::FlsConfig_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::FlsConfig_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e2d805f6f59bab24b847a6204ee111a7";
  }

  static const char* value(const ::cola2_msgs::FlsConfig_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe2d805f6f59bab24ULL;
  static const uint64_t static_value2 = 0xb847a6204ee111a7ULL;
};

template<class ContainerAllocator>
struct DataType< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cola2_msgs/FlsConfig";
  }

  static const char* value(const ::cola2_msgs::FlsConfig_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This message must be tied to a sensor_msgs/Image message that contains the corresponding polar image. The header \n"
"# timestamp of both messages must be exactly the same.\n"
"# The polar image's first row must correspond to the farthest return sample, with the last row being the closest return\n"
"# sample.\n"
"# The polar image's first column must correspond to the leftmost beam from the POV of the FLS sensor (negative angle \n"
"# value), with the last column being the rightmost beam (positive angle value).\n"
"\n"
"Header 	header\n"
"\n"
"uint32 num_beams\n"
"uint32 num_samples\n"
"\n"
"float64 window_start #In meters.\n"
"float64 window_end #In meters\n"
"\n"
"float32[] beams_bearings #In radians\n"
"\n"
"float64 speed_of_sound  #In m/s\n"
"float64 ping_rate #In Hz\n"
"float64 frequency #In Hz\n"
"\n"
"\n"
"\n"
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

  static const char* value(const ::cola2_msgs::FlsConfig_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.num_beams);
      stream.next(m.num_samples);
      stream.next(m.window_start);
      stream.next(m.window_end);
      stream.next(m.beams_bearings);
      stream.next(m.speed_of_sound);
      stream.next(m.ping_rate);
      stream.next(m.frequency);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FlsConfig_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cola2_msgs::FlsConfig_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cola2_msgs::FlsConfig_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "num_beams: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.num_beams);
    s << indent << "num_samples: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.num_samples);
    s << indent << "window_start: ";
    Printer<double>::stream(s, indent + "  ", v.window_start);
    s << indent << "window_end: ";
    Printer<double>::stream(s, indent + "  ", v.window_end);
    s << indent << "beams_bearings[]" << std::endl;
    for (size_t i = 0; i < v.beams_bearings.size(); ++i)
    {
      s << indent << "  beams_bearings[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.beams_bearings[i]);
    }
    s << indent << "speed_of_sound: ";
    Printer<double>::stream(s, indent + "  ", v.speed_of_sound);
    s << indent << "ping_rate: ";
    Printer<double>::stream(s, indent + "  ", v.ping_rate);
    s << indent << "frequency: ";
    Printer<double>::stream(s, indent + "  ", v.frequency);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COLA2_MSGS_MESSAGE_FLSCONFIG_H
