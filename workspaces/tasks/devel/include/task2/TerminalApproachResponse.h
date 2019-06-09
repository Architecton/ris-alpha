// Generated by gencpp from file task2/TerminalApproachResponse.msg
// DO NOT EDIT!


#ifndef TASK2_MESSAGE_TERMINALAPPROACHRESPONSE_H
#define TASK2_MESSAGE_TERMINALAPPROACHRESPONSE_H


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
struct TerminalApproachResponse_
{
  typedef TerminalApproachResponse_<ContainerAllocator> Type;

  TerminalApproachResponse_()
    {
    }
  TerminalApproachResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::task2::TerminalApproachResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task2::TerminalApproachResponse_<ContainerAllocator> const> ConstPtr;

}; // struct TerminalApproachResponse_

typedef ::task2::TerminalApproachResponse_<std::allocator<void> > TerminalApproachResponse;

typedef boost::shared_ptr< ::task2::TerminalApproachResponse > TerminalApproachResponsePtr;
typedef boost::shared_ptr< ::task2::TerminalApproachResponse const> TerminalApproachResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task2::TerminalApproachResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task2::TerminalApproachResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::task2::TerminalApproachResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task2::TerminalApproachResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::TerminalApproachResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::TerminalApproachResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::TerminalApproachResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::TerminalApproachResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task2::TerminalApproachResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::task2::TerminalApproachResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::task2::TerminalApproachResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task2/TerminalApproachResponse";
  }

  static const char* value(const ::task2::TerminalApproachResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task2::TerminalApproachResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::task2::TerminalApproachResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task2::TerminalApproachResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TerminalApproachResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task2::TerminalApproachResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::task2::TerminalApproachResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // TASK2_MESSAGE_TERMINALAPPROACHRESPONSE_H
