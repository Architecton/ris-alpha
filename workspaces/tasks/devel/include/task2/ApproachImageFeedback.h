// Generated by gencpp from file task2/ApproachImageFeedback.msg
// DO NOT EDIT!


#ifndef TASK2_MESSAGE_APPROACHIMAGEFEEDBACK_H
#define TASK2_MESSAGE_APPROACHIMAGEFEEDBACK_H


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
struct ApproachImageFeedback_
{
  typedef ApproachImageFeedback_<ContainerAllocator> Type;

  ApproachImageFeedback_()
    : timestamp()
    , center_x(0)
    , center_y(0)
    , minor_axis(0)
    , major_axis(0)  {
    }
  ApproachImageFeedback_(const ContainerAllocator& _alloc)
    : timestamp()
    , center_x(0)
    , center_y(0)
    , minor_axis(0)
    , major_axis(0)  {
  (void)_alloc;
    }



   typedef ros::Time _timestamp_type;
  _timestamp_type timestamp;

   typedef int32_t _center_x_type;
  _center_x_type center_x;

   typedef int32_t _center_y_type;
  _center_y_type center_y;

   typedef int32_t _minor_axis_type;
  _minor_axis_type minor_axis;

   typedef int32_t _major_axis_type;
  _major_axis_type major_axis;





  typedef boost::shared_ptr< ::task2::ApproachImageFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task2::ApproachImageFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct ApproachImageFeedback_

typedef ::task2::ApproachImageFeedback_<std::allocator<void> > ApproachImageFeedback;

typedef boost::shared_ptr< ::task2::ApproachImageFeedback > ApproachImageFeedbackPtr;
typedef boost::shared_ptr< ::task2::ApproachImageFeedback const> ApproachImageFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task2::ApproachImageFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task2::ApproachImageFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task2': ['/home/team_alpha/ris-alpha/workspaces/tasks/src/task2/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task2::ApproachImageFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task2::ApproachImageFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::ApproachImageFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::ApproachImageFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::ApproachImageFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::ApproachImageFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task2::ApproachImageFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9f0d914c11b2e37db5f51064189d6c63";
  }

  static const char* value(const ::task2::ApproachImageFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9f0d914c11b2e37dULL;
  static const uint64_t static_value2 = 0xb5f51064189d6c63ULL;
};

template<class ContainerAllocator>
struct DataType< ::task2::ApproachImageFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task2/ApproachImageFeedback";
  }

  static const char* value(const ::task2::ApproachImageFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task2::ApproachImageFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#coordinates of the center of the ring\n\
time timestamp\n\
int32 center_x\n\
int32 center_y\n\
int32 minor_axis\n\
int32 major_axis\n\
";
  }

  static const char* value(const ::task2::ApproachImageFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task2::ApproachImageFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.timestamp);
      stream.next(m.center_x);
      stream.next(m.center_y);
      stream.next(m.minor_axis);
      stream.next(m.major_axis);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ApproachImageFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task2::ApproachImageFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task2::ApproachImageFeedback_<ContainerAllocator>& v)
  {
    s << indent << "timestamp: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.timestamp);
    s << indent << "center_x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.center_x);
    s << indent << "center_y: ";
    Printer<int32_t>::stream(s, indent + "  ", v.center_y);
    s << indent << "minor_axis: ";
    Printer<int32_t>::stream(s, indent + "  ", v.minor_axis);
    s << indent << "major_axis: ";
    Printer<int32_t>::stream(s, indent + "  ", v.major_axis);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK2_MESSAGE_APPROACHIMAGEFEEDBACK_H
