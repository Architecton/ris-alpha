// Generated by gencpp from file alpha1/SumIntegers.msg
// DO NOT EDIT!


#ifndef ALPHA1_MESSAGE_SUMINTEGERS_H
#define ALPHA1_MESSAGE_SUMINTEGERS_H

#include <ros/service_traits.h>


#include <alpha1/SumIntegersRequest.h>
#include <alpha1/SumIntegersResponse.h>


namespace alpha1
{

struct SumIntegers
{

typedef SumIntegersRequest Request;
typedef SumIntegersResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SumIntegers
} // namespace alpha1


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::alpha1::SumIntegers > {
  static const char* value()
  {
    return "ee52d55541e33a838f1823a8e8489c7d";
  }

  static const char* value(const ::alpha1::SumIntegers&) { return value(); }
};

template<>
struct DataType< ::alpha1::SumIntegers > {
  static const char* value()
  {
    return "alpha1/SumIntegers";
  }

  static const char* value(const ::alpha1::SumIntegers&) { return value(); }
};


// service_traits::MD5Sum< ::alpha1::SumIntegersRequest> should match 
// service_traits::MD5Sum< ::alpha1::SumIntegers > 
template<>
struct MD5Sum< ::alpha1::SumIntegersRequest>
{
  static const char* value()
  {
    return MD5Sum< ::alpha1::SumIntegers >::value();
  }
  static const char* value(const ::alpha1::SumIntegersRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::alpha1::SumIntegersRequest> should match 
// service_traits::DataType< ::alpha1::SumIntegers > 
template<>
struct DataType< ::alpha1::SumIntegersRequest>
{
  static const char* value()
  {
    return DataType< ::alpha1::SumIntegers >::value();
  }
  static const char* value(const ::alpha1::SumIntegersRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::alpha1::SumIntegersResponse> should match 
// service_traits::MD5Sum< ::alpha1::SumIntegers > 
template<>
struct MD5Sum< ::alpha1::SumIntegersResponse>
{
  static const char* value()
  {
    return MD5Sum< ::alpha1::SumIntegers >::value();
  }
  static const char* value(const ::alpha1::SumIntegersResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::alpha1::SumIntegersResponse> should match 
// service_traits::DataType< ::alpha1::SumIntegers > 
template<>
struct DataType< ::alpha1::SumIntegersResponse>
{
  static const char* value()
  {
    return DataType< ::alpha1::SumIntegers >::value();
  }
  static const char* value(const ::alpha1::SumIntegersResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ALPHA1_MESSAGE_SUMINTEGERS_H