// Generated by gencpp from file task3/Checkpoint_resRequest.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_CHECKPOINT_RESREQUEST_H
#define TASK3_MESSAGE_CHECKPOINT_RESREQUEST_H


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
struct Checkpoint_resRequest_
{
  typedef Checkpoint_resRequest_<ContainerAllocator> Type;

  Checkpoint_resRequest_()
    : num_of_checkpoints(0)  {
    }
  Checkpoint_resRequest_(const ContainerAllocator& _alloc)
    : num_of_checkpoints(0)  {
  (void)_alloc;
    }



   typedef uint64_t _num_of_checkpoints_type;
  _num_of_checkpoints_type num_of_checkpoints;





  typedef boost::shared_ptr< ::task3::Checkpoint_resRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::Checkpoint_resRequest_<ContainerAllocator> const> ConstPtr;

}; // struct Checkpoint_resRequest_

typedef ::task3::Checkpoint_resRequest_<std::allocator<void> > Checkpoint_resRequest;

typedef boost::shared_ptr< ::task3::Checkpoint_resRequest > Checkpoint_resRequestPtr;
typedef boost::shared_ptr< ::task3::Checkpoint_resRequest const> Checkpoint_resRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::Checkpoint_resRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::Checkpoint_resRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
<<<<<<< HEAD
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/dkalsan/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}
=======
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/jernej/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}
>>>>>>> 421acea4e6516f0b1f751f12223a0631f49cf0f4

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::Checkpoint_resRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::Checkpoint_resRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::Checkpoint_resRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "db60db3ba58061c23afcd04151ecbaf1";
  }

  static const char* value(const ::task3::Checkpoint_resRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdb60db3ba58061c2ULL;
  static const uint64_t static_value2 = 0x3afcd04151ecbaf1ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/Checkpoint_resRequest";
  }

  static const char* value(const ::task3::Checkpoint_resRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint64 num_of_checkpoints\n\
";
  }

  static const char* value(const ::task3::Checkpoint_resRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.num_of_checkpoints);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Checkpoint_resRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::Checkpoint_resRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::Checkpoint_resRequest_<ContainerAllocator>& v)
  {
    s << indent << "num_of_checkpoints: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.num_of_checkpoints);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_CHECKPOINT_RESREQUEST_H
