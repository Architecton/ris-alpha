// Generated by gencpp from file task2/ValidRegionsMapResponse.msg
// DO NOT EDIT!


#ifndef TASK2_MESSAGE_VALIDREGIONSMAPRESPONSE_H
#define TASK2_MESSAGE_VALIDREGIONSMAPRESPONSE_H


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
struct ValidRegionsMapResponse_
{
  typedef ValidRegionsMapResponse_<ContainerAllocator> Type;

  ValidRegionsMapResponse_()
    : output_x(0.0)
    , output_y(0.0)  {
    }
  ValidRegionsMapResponse_(const ContainerAllocator& _alloc)
    : output_x(0.0)
    , output_y(0.0)  {
  (void)_alloc;
    }



   typedef double _output_x_type;
  _output_x_type output_x;

   typedef double _output_y_type;
  _output_y_type output_y;





  typedef boost::shared_ptr< ::task2::ValidRegionsMapResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task2::ValidRegionsMapResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ValidRegionsMapResponse_

typedef ::task2::ValidRegionsMapResponse_<std::allocator<void> > ValidRegionsMapResponse;

typedef boost::shared_ptr< ::task2::ValidRegionsMapResponse > ValidRegionsMapResponsePtr;
typedef boost::shared_ptr< ::task2::ValidRegionsMapResponse const> ValidRegionsMapResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task2::ValidRegionsMapResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task2': ['/home/dkalsan/ris-alpha/workspaces/tasks/src/task2/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task2::ValidRegionsMapResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::ValidRegionsMapResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::ValidRegionsMapResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "afbd32084a014b9ac53ccb0b88a798f5";
  }

  static const char* value(const ::task2::ValidRegionsMapResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xafbd32084a014b9aULL;
  static const uint64_t static_value2 = 0xc53ccb0b88a798f5ULL;
};

template<class ContainerAllocator>
struct DataType< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task2/ValidRegionsMapResponse";
  }

  static const char* value(const ::task2::ValidRegionsMapResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 output_x\n\
float64 output_y\n\
";
  }

  static const char* value(const ::task2::ValidRegionsMapResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.output_x);
      stream.next(m.output_y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ValidRegionsMapResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task2::ValidRegionsMapResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task2::ValidRegionsMapResponse_<ContainerAllocator>& v)
  {
    s << indent << "output_x: ";
    Printer<double>::stream(s, indent + "  ", v.output_x);
    s << indent << "output_y: ";
    Printer<double>::stream(s, indent + "  ", v.output_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK2_MESSAGE_VALIDREGIONSMAPRESPONSE_H
