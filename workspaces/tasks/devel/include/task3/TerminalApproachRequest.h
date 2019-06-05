// Generated by gencpp from file task3/TerminalApproachRequest.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_TERMINALAPPROACHREQUEST_H
#define TASK3_MESSAGE_TERMINALAPPROACHREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <task3/TerminalApproachFeedback.h>

namespace task3
{
template <class ContainerAllocator>
struct TerminalApproachRequest_
{
  typedef TerminalApproachRequest_<ContainerAllocator> Type;

  TerminalApproachRequest_()
    : feedback()  {
    }
  TerminalApproachRequest_(const ContainerAllocator& _alloc)
    : feedback(_alloc)  {
  (void)_alloc;
    }



   typedef  ::task3::TerminalApproachFeedback_<ContainerAllocator>  _feedback_type;
  _feedback_type feedback;





  typedef boost::shared_ptr< ::task3::TerminalApproachRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::TerminalApproachRequest_<ContainerAllocator> const> ConstPtr;

}; // struct TerminalApproachRequest_

typedef ::task3::TerminalApproachRequest_<std::allocator<void> > TerminalApproachRequest;

typedef boost::shared_ptr< ::task3::TerminalApproachRequest > TerminalApproachRequestPtr;
typedef boost::shared_ptr< ::task3::TerminalApproachRequest const> TerminalApproachRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::TerminalApproachRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::TerminalApproachRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/miha/Desktop/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::TerminalApproachRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::TerminalApproachRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::TerminalApproachRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::TerminalApproachRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::TerminalApproachRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::TerminalApproachRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::TerminalApproachRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fe183daa6c268d4e2a978bceb0e5896f";
  }

  static const char* value(const ::task3::TerminalApproachRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfe183daa6c268d4eULL;
  static const uint64_t static_value2 = 0x2a978bceb0e5896fULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::TerminalApproachRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/TerminalApproachRequest";
  }

  static const char* value(const ::task3::TerminalApproachRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::TerminalApproachRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "TerminalApproachFeedback feedback\n\
\n\
================================================================================\n\
MSG: task3/TerminalApproachFeedback\n\
#Center x coordinate of the window representing the area in which to keep the ring center.\n\
int32 target_center_x\n\
\n\
#index of the x coordinate of the ring center.\n\
int32 center_x\n\
\n\
#side length of the window in which to keep the center of the ellipse.\n\
int32 window_size\n\
";
  }

  static const char* value(const ::task3::TerminalApproachRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::TerminalApproachRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TerminalApproachRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::TerminalApproachRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::TerminalApproachRequest_<ContainerAllocator>& v)
  {
    s << indent << "feedback: ";
    s << std::endl;
    Printer< ::task3::TerminalApproachFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_TERMINALAPPROACHREQUEST_H
