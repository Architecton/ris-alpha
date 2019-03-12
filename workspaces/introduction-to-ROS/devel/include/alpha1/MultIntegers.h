// Generated by gencpp from file alpha1/MultIntegers.msg
// DO NOT EDIT!


#ifndef ALPHA1_MESSAGE_MULTINTEGERS_H
#define ALPHA1_MESSAGE_MULTINTEGERS_H

#include <ros/service_traits.h>


#include <alpha1/MultIntegersRequest.h>
#include <alpha1/MultIntegersResponse.h>


namespace alpha1
{

struct MultIntegers
{

typedef MultIntegersRequest Request;
typedef MultIntegersResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct MultIntegers
} // namespace alpha1


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::alpha1::MultIntegers > {
  static const char* value()
  {
    return "99989b30d784b92ec8440f11988612b9";
  }

  static const char* value(const ::alpha1::MultIntegers&) { return value(); }
};

template<>
struct DataType< ::alpha1::MultIntegers > {
  static const char* value()
  {
    return "alpha1/MultIntegers";
  }

  static const char* value(const ::alpha1::MultIntegers&) { return value(); }
};


// service_traits::MD5Sum< ::alpha1::MultIntegersRequest> should match 
// service_traits::MD5Sum< ::alpha1::MultIntegers > 
template<>
struct MD5Sum< ::alpha1::MultIntegersRequest>
{
  static const char* value()
  {
    return MD5Sum< ::alpha1::MultIntegers >::value();
  }
  static const char* value(const ::alpha1::MultIntegersRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::alpha1::MultIntegersRequest> should match 
// service_traits::DataType< ::alpha1::MultIntegers > 
template<>
struct DataType< ::alpha1::MultIntegersRequest>
{
  static const char* value()
  {
    return DataType< ::alpha1::MultIntegers >::value();
  }
  static const char* value(const ::alpha1::MultIntegersRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::alpha1::MultIntegersResponse> should match 
// service_traits::MD5Sum< ::alpha1::MultIntegers > 
template<>
struct MD5Sum< ::alpha1::MultIntegersResponse>
{
  static const char* value()
  {
    return MD5Sum< ::alpha1::MultIntegers >::value();
  }
  static const char* value(const ::alpha1::MultIntegersResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::alpha1::MultIntegersResponse> should match 
// service_traits::DataType< ::alpha1::MultIntegers > 
template<>
struct DataType< ::alpha1::MultIntegersResponse>
{
  static const char* value()
  {
    return DataType< ::alpha1::MultIntegers >::value();
  }
  static const char* value(const ::alpha1::MultIntegersResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ALPHA1_MESSAGE_MULTINTEGERS_H
