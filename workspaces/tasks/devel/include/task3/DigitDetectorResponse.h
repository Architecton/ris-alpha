// Generated by gencpp from file task3/DigitDetectorResponse.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_DIGITDETECTORRESPONSE_H
#define TASK3_MESSAGE_DIGITDETECTORRESPONSE_H


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
struct DigitDetectorResponse_
{
  typedef DigitDetectorResponse_<ContainerAllocator> Type;

  DigitDetectorResponse_()
    : result()  {
    }
  DigitDetectorResponse_(const ContainerAllocator& _alloc)
    : result(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int64_t, typename ContainerAllocator::template rebind<int64_t>::other >  _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::task3::DigitDetectorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::DigitDetectorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct DigitDetectorResponse_

typedef ::task3::DigitDetectorResponse_<std::allocator<void> > DigitDetectorResponse;

typedef boost::shared_ptr< ::task3::DigitDetectorResponse > DigitDetectorResponsePtr;
typedef boost::shared_ptr< ::task3::DigitDetectorResponse const> DigitDetectorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::DigitDetectorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::DigitDetectorResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/dkalsan/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::DigitDetectorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::DigitDetectorResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::DigitDetectorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::DigitDetectorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::DigitDetectorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::DigitDetectorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::DigitDetectorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "67cdd51ca1859f10c723484b0bc5b1b6";
  }

  static const char* value(const ::task3::DigitDetectorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x67cdd51ca1859f10ULL;
  static const uint64_t static_value2 = 0xc723484b0bc5b1b6ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::DigitDetectorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/DigitDetectorResponse";
  }

  static const char* value(const ::task3::DigitDetectorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::DigitDetectorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64[] result\n\
\n\
";
  }

  static const char* value(const ::task3::DigitDetectorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::DigitDetectorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DigitDetectorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::DigitDetectorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::DigitDetectorResponse_<ContainerAllocator>& v)
  {
    s << indent << "result[]" << std::endl;
    for (size_t i = 0; i < v.result.size(); ++i)
    {
      s << indent << "  result[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.result[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_DIGITDETECTORRESPONSE_H
