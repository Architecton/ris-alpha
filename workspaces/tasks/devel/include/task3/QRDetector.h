// Generated by gencpp from file task3/QRDetector.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_QRDETECTOR_H
#define TASK3_MESSAGE_QRDETECTOR_H

#include <ros/service_traits.h>


#include <task3/QRDetectorRequest.h>
#include <task3/QRDetectorResponse.h>


namespace task3
{

struct QRDetector
{

typedef QRDetectorRequest Request;
typedef QRDetectorResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct QRDetector
} // namespace task3


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::task3::QRDetector > {
  static const char* value()
  {
    return "74768431c7b5d3256bc92cadde0c032a";
  }

  static const char* value(const ::task3::QRDetector&) { return value(); }
};

template<>
struct DataType< ::task3::QRDetector > {
  static const char* value()
  {
    return "task3/QRDetector";
  }

  static const char* value(const ::task3::QRDetector&) { return value(); }
};


// service_traits::MD5Sum< ::task3::QRDetectorRequest> should match 
// service_traits::MD5Sum< ::task3::QRDetector > 
template<>
struct MD5Sum< ::task3::QRDetectorRequest>
{
  static const char* value()
  {
    return MD5Sum< ::task3::QRDetector >::value();
  }
  static const char* value(const ::task3::QRDetectorRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::QRDetectorRequest> should match 
// service_traits::DataType< ::task3::QRDetector > 
template<>
struct DataType< ::task3::QRDetectorRequest>
{
  static const char* value()
  {
    return DataType< ::task3::QRDetector >::value();
  }
  static const char* value(const ::task3::QRDetectorRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::task3::QRDetectorResponse> should match 
// service_traits::MD5Sum< ::task3::QRDetector > 
template<>
struct MD5Sum< ::task3::QRDetectorResponse>
{
  static const char* value()
  {
    return MD5Sum< ::task3::QRDetector >::value();
  }
  static const char* value(const ::task3::QRDetectorResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::task3::QRDetectorResponse> should match 
// service_traits::DataType< ::task3::QRDetector > 
template<>
struct DataType< ::task3::QRDetectorResponse>
{
  static const char* value()
  {
    return DataType< ::task3::QRDetector >::value();
  }
  static const char* value(const ::task3::QRDetectorResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TASK3_MESSAGE_QRDETECTOR_H
