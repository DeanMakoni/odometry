// Generated by gencpp from file cola2_msgs/NavSts.msg
// DO NOT EDIT!


#ifndef COLA2_MSGS_MESSAGE_NAVSTS_H
#define COLA2_MSGS_MESSAGE_NAVSTS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <cola2_msgs/DecimalLatLon.h>
#include <cola2_msgs/DecimalLatLon.h>
#include <cola2_msgs/NED.h>
#include <geometry_msgs/Point.h>
#include <cola2_msgs/RPY.h>
#include <cola2_msgs/RPY.h>
#include <cola2_msgs/NED.h>
#include <cola2_msgs/RPY.h>

namespace cola2_msgs
{
template <class ContainerAllocator>
struct NavSts_
{
  typedef NavSts_<ContainerAllocator> Type;

  NavSts_()
    : header()
    , global_position()
    , origin()
    , position()
    , altitude(0.0)
    , body_velocity()
    , orientation()
    , orientation_rate()
    , position_variance()
    , orientation_variance()  {
    }
  NavSts_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , global_position(_alloc)
    , origin(_alloc)
    , position(_alloc)
    , altitude(0.0)
    , body_velocity(_alloc)
    , orientation(_alloc)
    , orientation_rate(_alloc)
    , position_variance(_alloc)
    , orientation_variance(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::cola2_msgs::DecimalLatLon_<ContainerAllocator>  _global_position_type;
  _global_position_type global_position;

   typedef  ::cola2_msgs::DecimalLatLon_<ContainerAllocator>  _origin_type;
  _origin_type origin;

   typedef  ::cola2_msgs::NED_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef float _altitude_type;
  _altitude_type altitude;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _body_velocity_type;
  _body_velocity_type body_velocity;

   typedef  ::cola2_msgs::RPY_<ContainerAllocator>  _orientation_type;
  _orientation_type orientation;

   typedef  ::cola2_msgs::RPY_<ContainerAllocator>  _orientation_rate_type;
  _orientation_rate_type orientation_rate;

   typedef  ::cola2_msgs::NED_<ContainerAllocator>  _position_variance_type;
  _position_variance_type position_variance;

   typedef  ::cola2_msgs::RPY_<ContainerAllocator>  _orientation_variance_type;
  _orientation_variance_type orientation_variance;





  typedef boost::shared_ptr< ::cola2_msgs::NavSts_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cola2_msgs::NavSts_<ContainerAllocator> const> ConstPtr;

}; // struct NavSts_

typedef ::cola2_msgs::NavSts_<std::allocator<void> > NavSts;

typedef boost::shared_ptr< ::cola2_msgs::NavSts > NavStsPtr;
typedef boost::shared_ptr< ::cola2_msgs::NavSts const> NavStsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cola2_msgs::NavSts_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cola2_msgs::NavSts_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cola2_msgs::NavSts_<ContainerAllocator1> & lhs, const ::cola2_msgs::NavSts_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.global_position == rhs.global_position &&
    lhs.origin == rhs.origin &&
    lhs.position == rhs.position &&
    lhs.altitude == rhs.altitude &&
    lhs.body_velocity == rhs.body_velocity &&
    lhs.orientation == rhs.orientation &&
    lhs.orientation_rate == rhs.orientation_rate &&
    lhs.position_variance == rhs.position_variance &&
    lhs.orientation_variance == rhs.orientation_variance;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cola2_msgs::NavSts_<ContainerAllocator1> & lhs, const ::cola2_msgs::NavSts_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cola2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::NavSts_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::NavSts_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::NavSts_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::NavSts_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::NavSts_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::NavSts_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cola2_msgs::NavSts_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0ba23d6197aed7a9fab08613fe8fc381";
  }

  static const char* value(const ::cola2_msgs::NavSts_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0ba23d6197aed7a9ULL;
  static const uint64_t static_value2 = 0xfab08613fe8fc381ULL;
};

template<class ContainerAllocator>
struct DataType< ::cola2_msgs::NavSts_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cola2_msgs/NavSts";
  }

  static const char* value(const ::cola2_msgs::NavSts_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cola2_msgs::NavSts_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Sent by the navigator\n"
"\n"
"Header 	header\n"
"\n"
"DecimalLatLon global_position\n"
"DecimalLatLon origin\n"
"\n"
"# NED position and altitude in metres. \n"
"NED position\n"
"float32 altitude\n"
"\n"
"# Body velocities in metres/sec.\n"
"geometry_msgs/Point body_velocity\n"
"\n"
"# Orientation and orientation rate are in radians and radians/sec\n"
"RPY orientation\n"
"RPY orientation_rate\n"
"\n"
"# Variances for position and orientation\n"
"NED position_variance\n"
"RPY orientation_variance\n"
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
"\n"
"================================================================================\n"
"MSG: cola2_msgs/DecimalLatLon\n"
"# Latitude and longitude, in decimal form.\n"
"\n"
"float64 latitude\n"
"float64 longitude\n"
"\n"
"\n"
"================================================================================\n"
"MSG: cola2_msgs/NED\n"
"# Position or velocity in the right-handed NED coordinate frame.\n"
"\n"
"# metres north, positive towards true north.\n"
"float64 north\n"
"\n"
"# metres east, positive towards true east.\n"
"float64 east\n"
"\n"
"# metres down, positive towards the centre of the earth.\n"
"float64 depth\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: cola2_msgs/RPY\n"
"# Orientation or orientation velocity in a frame consistent with the right-handed NED coordinate frame.\n"
"\n"
"# Fixed-axis roll, in radians. Positive clockwise rotation about the X axis, looking forward.\n"
"float32 roll\n"
"\n"
"# Fixed-axis pitch, in radians. Positive upwards rotation of the vehicle nose about the Y axis.\n"
"float32 pitch\n"
"\n"
"# Fixed-axis yaw, in radians. Positive clockwise rotation about the Z axis, looking down.\n"
"float32 yaw\n"
"\n"
;
  }

  static const char* value(const ::cola2_msgs::NavSts_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cola2_msgs::NavSts_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.global_position);
      stream.next(m.origin);
      stream.next(m.position);
      stream.next(m.altitude);
      stream.next(m.body_velocity);
      stream.next(m.orientation);
      stream.next(m.orientation_rate);
      stream.next(m.position_variance);
      stream.next(m.orientation_variance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NavSts_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cola2_msgs::NavSts_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cola2_msgs::NavSts_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "global_position: ";
    s << std::endl;
    Printer< ::cola2_msgs::DecimalLatLon_<ContainerAllocator> >::stream(s, indent + "  ", v.global_position);
    s << indent << "origin: ";
    s << std::endl;
    Printer< ::cola2_msgs::DecimalLatLon_<ContainerAllocator> >::stream(s, indent + "  ", v.origin);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::cola2_msgs::NED_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "altitude: ";
    Printer<float>::stream(s, indent + "  ", v.altitude);
    s << indent << "body_velocity: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.body_velocity);
    s << indent << "orientation: ";
    s << std::endl;
    Printer< ::cola2_msgs::RPY_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation);
    s << indent << "orientation_rate: ";
    s << std::endl;
    Printer< ::cola2_msgs::RPY_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation_rate);
    s << indent << "position_variance: ";
    s << std::endl;
    Printer< ::cola2_msgs::NED_<ContainerAllocator> >::stream(s, indent + "  ", v.position_variance);
    s << indent << "orientation_variance: ";
    s << std::endl;
    Printer< ::cola2_msgs::RPY_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation_variance);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COLA2_MSGS_MESSAGE_NAVSTS_H
