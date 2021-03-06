// Generated by gencpp from file task3/ValidRegionsMap.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_VALIDREGIONSMAP_H
#define TASK3_MESSAGE_VALIDREGIONSMAP_H

#include <ros/service_traits.h>


#include <task3/ValidRegionsMapRequest.h>
#include <task3/ValidRegionsMapResponse.h>


namespace task3
{

struct ValidRegionsMap
{

typedef ValidRegionsMapRequest Request;
typedef ValidRegionsMapResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ValidRegionsMap
} // namespace task3


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::task3::ValidRegionsMap > {
  static const char* value()
  {
    return "ba554fc9d98703ab25e4d0b10b456967";
  }

  static const char* value(const ::task3::ValidRegionsMap&) { return value(); }
};

template<>
struct DataType< ::task3::ValidRegionsMap > {
  static const char* value()
  {
    return "task3/ValidRegionsMap";
  }

  static const char* value(const ::task3::ValidRegionsMap&) { return value(); }
};


// service_traits::MD5Sum< ::task3::ValidRegionsMapRequest> should match 
// service_traits::MD5Sum< ::task3::ValidRegionsMap > 
template<>
struct MD5Sum< ::task3::ValidRegionsMapRequest>
{
  static const char* value()
  {
    return MD5Sum< ::task3::ValidRegionsMap >::value();
  }
  static const char* value(const ::task3::ValidRegionsMapRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::ValidRegionsMapRequest> should match 
// service_traits::DataType< ::task3::ValidRegionsMap > 
template<>
struct DataType< ::task3::ValidRegionsMapRequest>
{
  static const char* value()
  {
    return DataType< ::task3::ValidRegionsMap >::value();
  }
  static const char* value(const ::task3::ValidRegionsMapRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::task3::ValidRegionsMapResponse> should match 
// service_traits::MD5Sum< ::task3::ValidRegionsMap > 
template<>
struct MD5Sum< ::task3::ValidRegionsMapResponse>
{
  static const char* value()
  {
    return MD5Sum< ::task3::ValidRegionsMap >::value();
  }
  static const char* value(const ::task3::ValidRegionsMapResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::ValidRegionsMapResponse> should match 
// service_traits::DataType< ::task3::ValidRegionsMap > 
template<>
struct DataType< ::task3::ValidRegionsMapResponse>
{
  static const char* value()
  {
    return DataType< ::task3::ValidRegionsMap >::value();
  }
  static const char* value(const ::task3::ValidRegionsMapResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TASK3_MESSAGE_VALIDREGIONSMAP_H
