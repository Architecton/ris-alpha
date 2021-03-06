// Generated by gencpp from file task3/TerminalApproachFeedback.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_TERMINALAPPROACHFEEDBACK_H
#define TASK3_MESSAGE_TERMINALAPPROACHFEEDBACK_H


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
struct TerminalApproachFeedback_
{
  typedef TerminalApproachFeedback_<ContainerAllocator> Type;

  TerminalApproachFeedback_()
    : target_center_x(0)
    , center_x(0)
    , window_size(0)  {
    }
  TerminalApproachFeedback_(const ContainerAllocator& _alloc)
    : target_center_x(0)
    , center_x(0)
    , window_size(0)  {
  (void)_alloc;
    }



   typedef int32_t _target_center_x_type;
  _target_center_x_type target_center_x;

   typedef int32_t _center_x_type;
  _center_x_type center_x;

   typedef int32_t _window_size_type;
  _window_size_type window_size;





  typedef boost::shared_ptr< ::task3::TerminalApproachFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::TerminalApproachFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct TerminalApproachFeedback_

typedef ::task3::TerminalApproachFeedback_<std::allocator<void> > TerminalApproachFeedback;

typedef boost::shared_ptr< ::task3::TerminalApproachFeedback > TerminalApproachFeedbackPtr;
typedef boost::shared_ptr< ::task3::TerminalApproachFeedback const> TerminalApproachFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::TerminalApproachFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::TerminalApproachFeedback_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::TerminalApproachFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::TerminalApproachFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::TerminalApproachFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8251b1bb88dbf79ef5ad5d622a580458";
  }

  static const char* value(const ::task3::TerminalApproachFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8251b1bb88dbf79eULL;
  static const uint64_t static_value2 = 0xf5ad5d622a580458ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/TerminalApproachFeedback";
  }

  static const char* value(const ::task3::TerminalApproachFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#Center x coordinate of the window representing the area in which to keep the ring center.\n\
int32 target_center_x\n\
\n\
#index of the x coordinate of the ring center.\n\
int32 center_x\n\
\n\
#side length of the window in which to keep the center of the ellipse.\n\
int32 window_size\n\
";
  }

  static const char* value(const ::task3::TerminalApproachFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.target_center_x);
      stream.next(m.center_x);
      stream.next(m.window_size);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TerminalApproachFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::TerminalApproachFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::TerminalApproachFeedback_<ContainerAllocator>& v)
  {
    s << indent << "target_center_x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.target_center_x);
    s << indent << "center_x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.center_x);
    s << indent << "window_size: ";
    Printer<int32_t>::stream(s, indent + "  ", v.window_size);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_TERMINALAPPROACHFEEDBACK_H
