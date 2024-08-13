// Generated by gencpp from file cola2_msgs/MaxJoyVelocityRequest.msg
// DO NOT EDIT!


#ifndef COLA2_MSGS_MESSAGE_MAXJOYVELOCITYREQUEST_H
#define COLA2_MSGS_MESSAGE_MAXJOYVELOCITYREQUEST_H


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
struct MaxJoyVelocityRequest_
{
  typedef MaxJoyVelocityRequest_<ContainerAllocator> Type;

  MaxJoyVelocityRequest_()
    : max_joy_velocity()  {
      max_joy_velocity.assign(0.0);
  }
  MaxJoyVelocityRequest_(const ContainerAllocator& _alloc)
    : max_joy_velocity()  {
  (void)_alloc;
      max_joy_velocity.assign(0.0);
  }



   typedef boost::array<double, 6>  _max_joy_velocity_type;
  _max_joy_velocity_type max_joy_velocity;





  typedef boost::shared_ptr< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MaxJoyVelocityRequest_

typedef ::cola2_msgs::MaxJoyVelocityRequest_<std::allocator<void> > MaxJoyVelocityRequest;

typedef boost::shared_ptr< ::cola2_msgs::MaxJoyVelocityRequest > MaxJoyVelocityRequestPtr;
typedef boost::shared_ptr< ::cola2_msgs::MaxJoyVelocityRequest const> MaxJoyVelocityRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator1> & lhs, const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator2> & rhs)
{
  return lhs.max_joy_velocity == rhs.max_joy_velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator1> & lhs, const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cola2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c7f20c1d0717a3f66479201f5a5bfb61";
  }

  static const char* value(const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc7f20c1d0717a3f6ULL;
  static const uint64_t static_value2 = 0x6479201f5a5bfb61ULL;
};

template<class ContainerAllocator>
struct DataType< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cola2_msgs/MaxJoyVelocityRequest";
  }

  static const char* value(const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[6] max_joy_velocity\n"
;
  }

  static const char* value(const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.max_joy_velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MaxJoyVelocityRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cola2_msgs::MaxJoyVelocityRequest_<ContainerAllocator>& v)
  {
    s << indent << "max_joy_velocity[]" << std::endl;
    for (size_t i = 0; i < v.max_joy_velocity.size(); ++i)
    {
      s << indent << "  max_joy_velocity[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.max_joy_velocity[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // COLA2_MSGS_MESSAGE_MAXJOYVELOCITYREQUEST_H
