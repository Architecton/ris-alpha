// Generated by gencpp from file task1/Checkpoint_resRequest.msg
// DO NOT EDIT!


#ifndef TASK1_MESSAGE_CHECKPOINT_RESREQUEST_H
#define TASK1_MESSAGE_CHECKPOINT_RESREQUEST_H


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
struct Checkpoint_resRequest_
{
  typedef Checkpoint_resRequest_<ContainerAllocator> Type;

  Checkpoint_resRequest_()
    {
    }
  Checkpoint_resRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::task1::Checkpoint_resRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task1::Checkpoint_resRequest_<ContainerAllocator> const> ConstPtr;

}; // struct Checkpoint_resRequest_

typedef ::task1::Checkpoint_resRequest_<std::allocator<void> > Checkpoint_resRequest;

typedef boost::shared_ptr< ::task1::Checkpoint_resRequest > Checkpoint_resRequestPtr;
typedef boost::shared_ptr< ::task1::Checkpoint_resRequest const> Checkpoint_resRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task1::Checkpoint_resRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task1::Checkpoint_resRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'task1': ['/home/miha/Desktop/ris-alpha/workspaces/tasks/src/task1/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task1::Checkpoint_resRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::Checkpoint_resRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::Checkpoint_resRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::task1::Checkpoint_resRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task1/Checkpoint_resRequest";
  }

  static const char* value(const ::task1::Checkpoint_resRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::task1::Checkpoint_resRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Checkpoint_resRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task1::Checkpoint_resRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::task1::Checkpoint_resRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // TASK1_MESSAGE_CHECKPOINT_RESREQUEST_H
