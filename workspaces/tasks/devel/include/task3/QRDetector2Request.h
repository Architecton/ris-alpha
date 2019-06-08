// Generated by gencpp from file task3/QRDetector2Request.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_QRDETECTOR2REQUEST_H
#define TASK3_MESSAGE_QRDETECTOR2REQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace task3
{
template <class ContainerAllocator>
struct QRDetector2Request_
{
  typedef QRDetector2Request_<ContainerAllocator> Type;

  QRDetector2Request_()
    : flg(0)  {
    }
  QRDetector2Request_(const ContainerAllocator& _alloc)
    : flg(0)  {
  (void)_alloc;
    }



   typedef int64_t _flg_type;
  _flg_type flg;





  typedef boost::shared_ptr< ::task3::QRDetector2Request_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::QRDetector2Request_<ContainerAllocator> const> ConstPtr;

}; // struct QRDetector2Request_

typedef ::task3::QRDetector2Request_<std::allocator<void> > QRDetector2Request;

typedef boost::shared_ptr< ::task3::QRDetector2Request > QRDetector2RequestPtr;
typedef boost::shared_ptr< ::task3::QRDetector2Request const> QRDetector2RequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::QRDetector2Request_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::QRDetector2Request_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::QRDetector2Request_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::QRDetector2Request_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::QRDetector2Request_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::QRDetector2Request_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::QRDetector2Request_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::QRDetector2Request_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::QRDetector2Request_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c8e58b690355adaa882da8790bb22595";
  }

  static const char* value(const ::task3::QRDetector2Request_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc8e58b690355adaaULL;
  static const uint64_t static_value2 = 0x882da8790bb22595ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::QRDetector2Request_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/QRDetector2Request";
  }

  static const char* value(const ::task3::QRDetector2Request_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::QRDetector2Request_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 flg\n\
";
  }

  static const char* value(const ::task3::QRDetector2Request_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::QRDetector2Request_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.flg);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct QRDetector2Request_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::QRDetector2Request_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::QRDetector2Request_<ContainerAllocator>& v)
  {
    s << indent << "flg: ";
    Printer<int64_t>::stream(s, indent + "  ", v.flg);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_QRDETECTOR2REQUEST_H
