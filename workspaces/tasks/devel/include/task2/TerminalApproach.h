// Generated by gencpp from file task2/TerminalApproach.msg
// DO NOT EDIT!


#ifndef TASK2_MESSAGE_TERMINALAPPROACH_H
#define TASK2_MESSAGE_TERMINALAPPROACH_H

#include <ros/service_traits.h>


#include <task2/TerminalApproachRequest.h>
#include <task2/TerminalApproachResponse.h>


namespace task2
{

struct TerminalApproach
{

typedef TerminalApproachRequest Request;
typedef TerminalApproachResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct TerminalApproach
} // namespace task2


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::task2::TerminalApproach > {
  static const char* value()
  {
    return "fe183daa6c268d4e2a978bceb0e5896f";
  }

  static const char* value(const ::task2::TerminalApproach&) { return value(); }
};

template<>
struct DataType< ::task2::TerminalApproach > {
  static const char* value()
  {
    return "task2/TerminalApproach";
  }

  static const char* value(const ::task2::TerminalApproach&) { return value(); }
};


// service_traits::MD5Sum< ::task2::TerminalApproachRequest> should match 
// service_traits::MD5Sum< ::task2::TerminalApproach > 
template<>
struct MD5Sum< ::task2::TerminalApproachRequest>
{
  static const char* value()
  {
    return MD5Sum< ::task2::TerminalApproach >::value();
  }
  static const char* value(const ::task2::TerminalApproachRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::task2::TerminalApproachRequest> should match 
// service_traits::DataType< ::task2::TerminalApproach > 
template<>
struct DataType< ::task2::TerminalApproachRequest>
{
  static const char* value()
  {
    return DataType< ::task2::TerminalApproach >::value();
  }
  static const char* value(const ::task2::TerminalApproachRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::task2::TerminalApproachResponse> should match 
// service_traits::MD5Sum< ::task2::TerminalApproach > 
template<>
struct MD5Sum< ::task2::TerminalApproachResponse>
{
  static const char* value()
  {
    return MD5Sum< ::task2::TerminalApproach >::value();
  }
  static const char* value(const ::task2::TerminalApproachResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::task2::TerminalApproachResponse> should match 
// service_traits::DataType< ::task2::TerminalApproach > 
template<>
struct DataType< ::task2::TerminalApproachResponse>
{
  static const char* value()
  {
    return DataType< ::task2::TerminalApproach >::value();
  }
  static const char* value(const ::task2::TerminalApproachResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TASK2_MESSAGE_TERMINALAPPROACH_H