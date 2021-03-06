// Generated by gencpp from file alpha2/TurtleManager.msg
// DO NOT EDIT!


#ifndef ALPHA2_MESSAGE_TURTLEMANAGER_H
#define ALPHA2_MESSAGE_TURTLEMANAGER_H

#include <ros/service_traits.h>


#include <alpha2/TurtleManagerRequest.h>
#include <alpha2/TurtleManagerResponse.h>


namespace alpha2
{

struct TurtleManager
{

typedef TurtleManagerRequest Request;
typedef TurtleManagerResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct TurtleManager
} // namespace alpha2


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::alpha2::TurtleManager > {
  static const char* value()
  {
    return "c4a7b5d4e57b122dab2b47a5dca00961";
  }

  static const char* value(const ::alpha2::TurtleManager&) { return value(); }
};

template<>
struct DataType< ::alpha2::TurtleManager > {
  static const char* value()
  {
    return "alpha2/TurtleManager";
  }

  static const char* value(const ::alpha2::TurtleManager&) { return value(); }
};


// service_traits::MD5Sum< ::alpha2::TurtleManagerRequest> should match 
// service_traits::MD5Sum< ::alpha2::TurtleManager > 
template<>
struct MD5Sum< ::alpha2::TurtleManagerRequest>
{
  static const char* value()
  {
    return MD5Sum< ::alpha2::TurtleManager >::value();
  }
  static const char* value(const ::alpha2::TurtleManagerRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::alpha2::TurtleManagerRequest> should match 
// service_traits::DataType< ::alpha2::TurtleManager > 
template<>
struct DataType< ::alpha2::TurtleManagerRequest>
{
  static const char* value()
  {
    return DataType< ::alpha2::TurtleManager >::value();
  }
  static const char* value(const ::alpha2::TurtleManagerRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::alpha2::TurtleManagerResponse> should match 
// service_traits::MD5Sum< ::alpha2::TurtleManager > 
template<>
struct MD5Sum< ::alpha2::TurtleManagerResponse>
{
  static const char* value()
  {
    return MD5Sum< ::alpha2::TurtleManager >::value();
  }
  static const char* value(const ::alpha2::TurtleManagerResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::alpha2::TurtleManagerResponse> should match 
// service_traits::DataType< ::alpha2::TurtleManager > 
template<>
struct DataType< ::alpha2::TurtleManagerResponse>
{
  static const char* value()
  {
    return DataType< ::alpha2::TurtleManager >::value();
  }
  static const char* value(const ::alpha2::TurtleManagerResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ALPHA2_MESSAGE_TURTLEMANAGER_H
