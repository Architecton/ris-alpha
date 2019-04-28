// Generated by gencpp from file task2/GetRingColorResponse.msg
// DO NOT EDIT!


#ifndef TASK2_MESSAGE_GETRINGCOLORRESPONSE_H
#define TASK2_MESSAGE_GETRINGCOLORRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace task2
{
template <class ContainerAllocator>
struct GetRingColorResponse_
{
  typedef GetRingColorResponse_<ContainerAllocator> Type;

  GetRingColorResponse_()
    : color(0)  {
    }
  GetRingColorResponse_(const ContainerAllocator& _alloc)
    : color(0)  {
  (void)_alloc;
    }



   typedef int64_t _color_type;
  _color_type color;





  typedef boost::shared_ptr< ::task2::GetRingColorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task2::GetRingColorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetRingColorResponse_

typedef ::task2::GetRingColorResponse_<std::allocator<void> > GetRingColorResponse;

typedef boost::shared_ptr< ::task2::GetRingColorResponse > GetRingColorResponsePtr;
typedef boost::shared_ptr< ::task2::GetRingColorResponse const> GetRingColorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task2::GetRingColorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task2::GetRingColorResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task2': ['/home/miha/Desktop/ris-alpha/workspaces/tasks/src/task2/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task2::GetRingColorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task2::GetRingColorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::GetRingColorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::GetRingColorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::GetRingColorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::GetRingColorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task2::GetRingColorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "50d00d5fcc3181bd2158f397a80a876e";
  }

  static const char* value(const ::task2::GetRingColorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x50d00d5fcc3181bdULL;
  static const uint64_t static_value2 = 0x2158f397a80a876eULL;
};

template<class ContainerAllocator>
struct DataType< ::task2::GetRingColorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task2/GetRingColorResponse";
  }

  static const char* value(const ::task2::GetRingColorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task2::GetRingColorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 color\n\
";
  }

  static const char* value(const ::task2::GetRingColorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task2::GetRingColorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.color);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetRingColorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task2::GetRingColorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task2::GetRingColorResponse_<ContainerAllocator>& v)
  {
    s << indent << "color: ";
    Printer<int64_t>::stream(s, indent + "  ", v.color);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK2_MESSAGE_GETRINGCOLORRESPONSE_H
