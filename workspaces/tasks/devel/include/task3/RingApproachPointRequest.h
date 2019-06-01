// Generated by gencpp from file task3/RingApproachPointRequest.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_RINGAPPROACHPOINTREQUEST_H
#define TASK3_MESSAGE_RINGAPPROACHPOINTREQUEST_H


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
struct RingApproachPointRequest_
{
  typedef RingApproachPointRequest_<ContainerAllocator> Type;

  RingApproachPointRequest_()
    : input_x(0.0)
    , input_y(0.0)  {
    }
  RingApproachPointRequest_(const ContainerAllocator& _alloc)
    : input_x(0.0)
    , input_y(0.0)  {
  (void)_alloc;
    }



   typedef double _input_x_type;
  _input_x_type input_x;

   typedef double _input_y_type;
  _input_y_type input_y;





  typedef boost::shared_ptr< ::task3::RingApproachPointRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::RingApproachPointRequest_<ContainerAllocator> const> ConstPtr;

}; // struct RingApproachPointRequest_

typedef ::task3::RingApproachPointRequest_<std::allocator<void> > RingApproachPointRequest;

typedef boost::shared_ptr< ::task3::RingApproachPointRequest > RingApproachPointRequestPtr;
typedef boost::shared_ptr< ::task3::RingApproachPointRequest const> RingApproachPointRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::RingApproachPointRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::RingApproachPointRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/dkalsan/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::RingApproachPointRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::RingApproachPointRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::RingApproachPointRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::RingApproachPointRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::RingApproachPointRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::RingApproachPointRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::RingApproachPointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "778eac8212a9761df254633e5a7e78e5";
  }

  static const char* value(const ::task3::RingApproachPointRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x778eac8212a9761dULL;
  static const uint64_t static_value2 = 0xf254633e5a7e78e5ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::RingApproachPointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/RingApproachPointRequest";
  }

  static const char* value(const ::task3::RingApproachPointRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::RingApproachPointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 input_x\n\
float64 input_y\n\
";
  }

  static const char* value(const ::task3::RingApproachPointRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::RingApproachPointRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.input_x);
      stream.next(m.input_y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RingApproachPointRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::RingApproachPointRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::RingApproachPointRequest_<ContainerAllocator>& v)
  {
    s << indent << "input_x: ";
    Printer<double>::stream(s, indent + "  ", v.input_x);
    s << indent << "input_y: ";
    Printer<double>::stream(s, indent + "  ", v.input_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_RINGAPPROACHPOINTREQUEST_H
