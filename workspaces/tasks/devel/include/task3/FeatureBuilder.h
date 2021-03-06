// Generated by gencpp from file task3/FeatureBuilder.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_FEATUREBUILDER_H
#define TASK3_MESSAGE_FEATUREBUILDER_H

#include <ros/service_traits.h>


#include <task3/FeatureBuilderRequest.h>
#include <task3/FeatureBuilderResponse.h>


namespace task3
{

struct FeatureBuilder
{

typedef FeatureBuilderRequest Request;
typedef FeatureBuilderResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct FeatureBuilder
} // namespace task3


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::task3::FeatureBuilder > {
  static const char* value()
  {
    return "74768431c7b5d3256bc92cadde0c032a";
  }

  static const char* value(const ::task3::FeatureBuilder&) { return value(); }
};

template<>
struct DataType< ::task3::FeatureBuilder > {
  static const char* value()
  {
    return "task3/FeatureBuilder";
  }

  static const char* value(const ::task3::FeatureBuilder&) { return value(); }
};


// service_traits::MD5Sum< ::task3::FeatureBuilderRequest> should match 
// service_traits::MD5Sum< ::task3::FeatureBuilder > 
template<>
struct MD5Sum< ::task3::FeatureBuilderRequest>
{
  static const char* value()
  {
    return MD5Sum< ::task3::FeatureBuilder >::value();
  }
  static const char* value(const ::task3::FeatureBuilderRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::FeatureBuilderRequest> should match 
// service_traits::DataType< ::task3::FeatureBuilder > 
template<>
struct DataType< ::task3::FeatureBuilderRequest>
{
  static const char* value()
  {
    return DataType< ::task3::FeatureBuilder >::value();
  }
  static const char* value(const ::task3::FeatureBuilderRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::task3::FeatureBuilderResponse> should match 
// service_traits::MD5Sum< ::task3::FeatureBuilder > 
template<>
struct MD5Sum< ::task3::FeatureBuilderResponse>
{
  static const char* value()
  {
    return MD5Sum< ::task3::FeatureBuilder >::value();
  }
  static const char* value(const ::task3::FeatureBuilderResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::FeatureBuilderResponse> should match 
// service_traits::DataType< ::task3::FeatureBuilder > 
template<>
struct DataType< ::task3::FeatureBuilderResponse>
{
  static const char* value()
  {
    return DataType< ::task3::FeatureBuilder >::value();
  }
  static const char* value(const ::task3::FeatureBuilderResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TASK3_MESSAGE_FEATUREBUILDER_H
