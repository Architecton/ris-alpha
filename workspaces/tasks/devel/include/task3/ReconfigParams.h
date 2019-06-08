// Generated by gencpp from file task3/ReconfigParams.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_RECONFIGPARAMS_H
#define TASK3_MESSAGE_RECONFIGPARAMS_H

#include <ros/service_traits.h>


#include <task3/ReconfigParamsRequest.h>
#include <task3/ReconfigParamsResponse.h>


namespace task3
{

struct ReconfigParams
{

typedef ReconfigParamsRequest Request;
typedef ReconfigParamsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ReconfigParams
} // namespace task3


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::task3::ReconfigParams > {
  static const char* value()
  {
    return "ca89989307a87a3268666e3ae28823bb";
  }

  static const char* value(const ::task3::ReconfigParams&) { return value(); }
};

template<>
struct DataType< ::task3::ReconfigParams > {
  static const char* value()
  {
    return "task3/ReconfigParams";
  }

  static const char* value(const ::task3::ReconfigParams&) { return value(); }
};


// service_traits::MD5Sum< ::task3::ReconfigParamsRequest> should match 
// service_traits::MD5Sum< ::task3::ReconfigParams > 
template<>
struct MD5Sum< ::task3::ReconfigParamsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::task3::ReconfigParams >::value();
  }
  static const char* value(const ::task3::ReconfigParamsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::ReconfigParamsRequest> should match 
// service_traits::DataType< ::task3::ReconfigParams > 
template<>
struct DataType< ::task3::ReconfigParamsRequest>
{
  static const char* value()
  {
    return DataType< ::task3::ReconfigParams >::value();
  }
  static const char* value(const ::task3::ReconfigParamsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::task3::ReconfigParamsResponse> should match 
// service_traits::MD5Sum< ::task3::ReconfigParams > 
template<>
struct MD5Sum< ::task3::ReconfigParamsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::task3::ReconfigParams >::value();
  }
  static const char* value(const ::task3::ReconfigParamsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::ReconfigParamsResponse> should match 
// service_traits::DataType< ::task3::ReconfigParams > 
template<>
struct DataType< ::task3::ReconfigParamsResponse>
{
  static const char* value()
  {
    return DataType< ::task3::ReconfigParams >::value();
  }
  static const char* value(const ::task3::ReconfigParamsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TASK3_MESSAGE_RECONFIGPARAMS_H
