// Generated by gencpp from file cola2_msgs/SectionRequest.msg
// DO NOT EDIT!


#ifndef COLA2_MSGS_MESSAGE_SECTIONREQUEST_H
#define COLA2_MSGS_MESSAGE_SECTIONREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace cola2_msgs
{
template <class ContainerAllocator>
struct SectionRequest_
{
  typedef SectionRequest_<ContainerAllocator> Type;

  SectionRequest_()
    : initial_x(0.0)
    , initial_y(0.0)
    , initial_depth(0.0)
    , final_x(0.0)
    , final_y(0.0)
    , final_depth(0.0)
    , final_altitude(0.0)
    , reference(0)
    , heave_mode(0)
    , surge_velocity(0.0)
    , tolerance_xy(0.0)
    , timeout(0.0)
    , no_altitude_goes_up(false)  {
    }
  SectionRequest_(const ContainerAllocator& _alloc)
    : initial_x(0.0)
    , initial_y(0.0)
    , initial_depth(0.0)
    , final_x(0.0)
    , final_y(0.0)
    , final_depth(0.0)
    , final_altitude(0.0)
    , reference(0)
    , heave_mode(0)
    , surge_velocity(0.0)
    , tolerance_xy(0.0)
    , timeout(0.0)
    , no_altitude_goes_up(false)  {
  (void)_alloc;
    }



   typedef double _initial_x_type;
  _initial_x_type initial_x;

   typedef double _initial_y_type;
  _initial_y_type initial_y;

   typedef double _initial_depth_type;
  _initial_depth_type initial_depth;

   typedef double _final_x_type;
  _final_x_type final_x;

   typedef double _final_y_type;
  _final_y_type final_y;

   typedef double _final_depth_type;
  _final_depth_type final_depth;

   typedef double _final_altitude_type;
  _final_altitude_type final_altitude;

   typedef uint8_t _reference_type;
  _reference_type reference;

   typedef uint64_t _heave_mode_type;
  _heave_mode_type heave_mode;

   typedef double _surge_velocity_type;
  _surge_velocity_type surge_velocity;

   typedef double _tolerance_xy_type;
  _tolerance_xy_type tolerance_xy;

   typedef double _timeout_type;
  _timeout_type timeout;

   typedef uint8_t _no_altitude_goes_up_type;
  _no_altitude_goes_up_type no_altitude_goes_up;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(NED)
  #undef NED
#endif
#if defined(_WIN32) && defined(GLOBAL)
  #undef GLOBAL
#endif
#if defined(_WIN32) && defined(DEPTH)
  #undef DEPTH
#endif
#if defined(_WIN32) && defined(ALTITUDE)
  #undef ALTITUDE
#endif
#if defined(_WIN32) && defined(BOTH)
  #undef BOTH
#endif

  enum {
    NED = 0u,
    GLOBAL = 1u,
    DEPTH = 0u,
    ALTITUDE = 1u,
    BOTH = 2u,
  };


  typedef boost::shared_ptr< ::cola2_msgs::SectionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cola2_msgs::SectionRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SectionRequest_

typedef ::cola2_msgs::SectionRequest_<std::allocator<void> > SectionRequest;

typedef boost::shared_ptr< ::cola2_msgs::SectionRequest > SectionRequestPtr;
typedef boost::shared_ptr< ::cola2_msgs::SectionRequest const> SectionRequestConstPtr;

// constants requiring out of line definition

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cola2_msgs::SectionRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cola2_msgs::SectionRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cola2_msgs::SectionRequest_<ContainerAllocator1> & lhs, const ::cola2_msgs::SectionRequest_<ContainerAllocator2> & rhs)
{
  return lhs.initial_x == rhs.initial_x &&
    lhs.initial_y == rhs.initial_y &&
    lhs.initial_depth == rhs.initial_depth &&
    lhs.final_x == rhs.final_x &&
    lhs.final_y == rhs.final_y &&
    lhs.final_depth == rhs.final_depth &&
    lhs.final_altitude == rhs.final_altitude &&
    lhs.reference == rhs.reference &&
    lhs.heave_mode == rhs.heave_mode &&
    lhs.surge_velocity == rhs.surge_velocity &&
    lhs.tolerance_xy == rhs.tolerance_xy &&
    lhs.timeout == rhs.timeout &&
    lhs.no_altitude_goes_up == rhs.no_altitude_goes_up;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cola2_msgs::SectionRequest_<ContainerAllocator1> & lhs, const ::cola2_msgs::SectionRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cola2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::SectionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::SectionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::SectionRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4d7716761bb52c1ebe9e3b958d0ae1da";
  }

  static const char* value(const ::cola2_msgs::SectionRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4d7716761bb52c1eULL;
  static const uint64_t static_value2 = 0xbe9e3b958d0ae1daULL;
};

template<class ContainerAllocator>
struct DataType< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cola2_msgs/SectionRequest";
  }

  static const char* value(const ::cola2_msgs::SectionRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Initial state\n"
"float64 initial_x\n"
"float64 initial_y\n"
"float64 initial_depth\n"
"\n"
"# Final state\n"
"float64 final_x\n"
"float64 final_y\n"
"float64 final_depth\n"
"float64 final_altitude\n"
"\n"
"# Reference frame for both the inital and final positions\n"
"uint8 NED=0\n"
"uint8 GLOBAL=1\n"
"uint8 reference\n"
"\n"
"# Heave mode\n"
"uint64 heave_mode\n"
"uint64 DEPTH=0\n"
"uint64 ALTITUDE=1\n"
"uint64 BOTH=2\n"
"\n"
"# Surge velocity\n"
"float64 surge_velocity\n"
"\n"
"# Tolerance\n"
"float64 tolerance_xy\n"
"\n"
"# Timeout\n"
"float64 timeout\n"
"\n"
"# No altitude reactive behavior\n"
"bool no_altitude_goes_up\n"
"\n"
;
  }

  static const char* value(const ::cola2_msgs::SectionRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.initial_x);
      stream.next(m.initial_y);
      stream.next(m.initial_depth);
      stream.next(m.final_x);
      stream.next(m.final_y);
      stream.next(m.final_depth);
      stream.next(m.final_altitude);
      stream.next(m.reference);
      stream.next(m.heave_mode);
      stream.next(m.surge_velocity);
      stream.next(m.tolerance_xy);
      stream.next(m.timeout);
      stream.next(m.no_altitude_goes_up);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SectionRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cola2_msgs::SectionRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cola2_msgs::SectionRequest_<ContainerAllocator>& v)
  {
    s << indent << "initial_x: ";
    Printer<double>::stream(s, indent + "  ", v.initial_x);
    s << indent << "initial_y: ";
    Printer<double>::stream(s, indent + "  ", v.initial_y);
    s << indent << "initial_depth: ";
    Printer<double>::stream(s, indent + "  ", v.initial_depth);
    s << indent << "final_x: ";
    Printer<double>::stream(s, indent + "  ", v.final_x);
    s << indent << "final_y: ";
    Printer<double>::stream(s, indent + "  ", v.final_y);
    s << indent << "final_depth: ";
    Printer<double>::stream(s, indent + "  ", v.final_depth);
    s << indent << "final_altitude: ";
    Printer<double>::stream(s, indent + "  ", v.final_altitude);
    s << indent << "reference: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.reference);
    s << indent << "heave_mode: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.heave_mode);
    s << indent << "surge_velocity: ";
    Printer<double>::stream(s, indent + "  ", v.surge_velocity);
    s << indent << "tolerance_xy: ";
    Printer<double>::stream(s, indent + "  ", v.tolerance_xy);
    s << indent << "timeout: ";
    Printer<double>::stream(s, indent + "  ", v.timeout);
    s << indent << "no_altitude_goes_up: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.no_altitude_goes_up);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COLA2_MSGS_MESSAGE_SECTIONREQUEST_H
