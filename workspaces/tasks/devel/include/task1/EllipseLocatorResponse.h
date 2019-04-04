// Generated by gencpp from file task1/EllipseLocatorResponse.msg
// DO NOT EDIT!


#ifndef TASK1_MESSAGE_ELLIPSELOCATORRESPONSE_H
#define TASK1_MESSAGE_ELLIPSELOCATORRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace task1
{
template <class ContainerAllocator>
struct EllipseLocatorResponse_
{
  typedef EllipseLocatorResponse_<ContainerAllocator> Type;

  EllipseLocatorResponse_()
    : target()  {
    }
  EllipseLocatorResponse_(const ContainerAllocator& _alloc)
    : target(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _target_type;
  _target_type target;





  typedef boost::shared_ptr< ::task1::EllipseLocatorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task1::EllipseLocatorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct EllipseLocatorResponse_

typedef ::task1::EllipseLocatorResponse_<std::allocator<void> > EllipseLocatorResponse;

typedef boost::shared_ptr< ::task1::EllipseLocatorResponse > EllipseLocatorResponsePtr;
typedef boost::shared_ptr< ::task1::EllipseLocatorResponse const> EllipseLocatorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task1::EllipseLocatorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task1::EllipseLocatorResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'task1': ['/home/miha/Desktop/ris-alpha/workspaces/tasks/src/task1/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task1::EllipseLocatorResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::EllipseLocatorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::EllipseLocatorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7b497188d656d59d92c0ddf8ac50fe8a";
  }

  static const char* value(const ::task1::EllipseLocatorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7b497188d656d59dULL;
  static const uint64_t static_value2 = 0x92c0ddf8ac50fe8aULL;
};

template<class ContainerAllocator>
struct DataType< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task1/EllipseLocatorResponse";
  }

  static const char* value(const ::task1::EllipseLocatorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] target\n\
\n\
";
  }

  static const char* value(const ::task1::EllipseLocatorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.target);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EllipseLocatorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task1::EllipseLocatorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task1::EllipseLocatorResponse_<ContainerAllocator>& v)
  {
    s << indent << "target[]" << std::endl;
    for (size_t i = 0; i < v.target.size(); ++i)
    {
      s << indent << "  target[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.target[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK1_MESSAGE_ELLIPSELOCATORRESPONSE_H
