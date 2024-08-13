// Generated by gencpp from file cola2_msgs/Section.msg
// DO NOT EDIT!


#ifndef COLA2_MSGS_MESSAGE_SECTION_H
#define COLA2_MSGS_MESSAGE_SECTION_H

#include <ros/service_traits.h>


#include <cola2_msgs/SectionRequest.h>
#include <cola2_msgs/SectionResponse.h>


namespace cola2_msgs
{

struct Section
{

typedef SectionRequest Request;
typedef SectionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Section
} // namespace cola2_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::cola2_msgs::Section > {
  static const char* value()
  {
    return "1f01abdb45291baeca36841eeb98714f";
  }

  static const char* value(const ::cola2_msgs::Section&) { return value(); }
};

template<>
struct DataType< ::cola2_msgs::Section > {
  static const char* value()
  {
    return "cola2_msgs/Section";
  }

  static const char* value(const ::cola2_msgs::Section&) { return value(); }
};


// service_traits::MD5Sum< ::cola2_msgs::SectionRequest> should match
// service_traits::MD5Sum< ::cola2_msgs::Section >
template<>
struct MD5Sum< ::cola2_msgs::SectionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::cola2_msgs::Section >::value();
  }
  static const char* value(const ::cola2_msgs::SectionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::cola2_msgs::SectionRequest> should match
// service_traits::DataType< ::cola2_msgs::Section >
template<>
struct DataType< ::cola2_msgs::SectionRequest>
{
  static const char* value()
  {
    return DataType< ::cola2_msgs::Section >::value();
  }
  static const char* value(const ::cola2_msgs::SectionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::cola2_msgs::SectionResponse> should match
// service_traits::MD5Sum< ::cola2_msgs::Section >
template<>
struct MD5Sum< ::cola2_msgs::SectionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::cola2_msgs::Section >::value();
  }
  static const char* value(const ::cola2_msgs::SectionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::cola2_msgs::SectionResponse> should match
// service_traits::DataType< ::cola2_msgs::Section >
template<>
struct DataType< ::cola2_msgs::SectionResponse>
{
  static const char* value()
  {
    return DataType< ::cola2_msgs::Section >::value();
  }
  static const char* value(const ::cola2_msgs::SectionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COLA2_MSGS_MESSAGE_SECTION_H
