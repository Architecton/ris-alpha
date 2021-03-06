// Generated by gencpp from file task3/Checkpoint_resResponse.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_CHECKPOINT_RESRESPONSE_H
#define TASK3_MESSAGE_CHECKPOINT_RESRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <task3/Checkpoints.h>

namespace task3
{
template <class ContainerAllocator>
struct Checkpoint_resResponse_
{
  typedef Checkpoint_resResponse_<ContainerAllocator> Type;

  Checkpoint_resResponse_()
    : points()  {
    }
  Checkpoint_resResponse_(const ContainerAllocator& _alloc)
    : points(_alloc)  {
  (void)_alloc;
    }



   typedef  ::task3::Checkpoints_<ContainerAllocator>  _points_type;
  _points_type points;





  typedef boost::shared_ptr< ::task3::Checkpoint_resResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::Checkpoint_resResponse_<ContainerAllocator> const> ConstPtr;

}; // struct Checkpoint_resResponse_

typedef ::task3::Checkpoint_resResponse_<std::allocator<void> > Checkpoint_resResponse;

typedef boost::shared_ptr< ::task3::Checkpoint_resResponse > Checkpoint_resResponsePtr;
typedef boost::shared_ptr< ::task3::Checkpoint_resResponse const> Checkpoint_resResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::Checkpoint_resResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::Checkpoint_resResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::Checkpoint_resResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::Checkpoint_resResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::Checkpoint_resResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f7b43fb4c3dc044f1ecb1f843f952947";
  }

  static const char* value(const ::task3::Checkpoint_resResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf7b43fb4c3dc044fULL;
  static const uint64_t static_value2 = 0x1ecb1f843f952947ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/Checkpoint_resResponse";
  }

  static const char* value(const ::task3::Checkpoint_resResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Checkpoints points\n\
\n\
================================================================================\n\
MSG: task3/Checkpoints\n\
geometry_msgs/Point[] points\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::task3::Checkpoint_resResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.points);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Checkpoint_resResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::Checkpoint_resResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::Checkpoint_resResponse_<ContainerAllocator>& v)
  {
    s << indent << "points: ";
    s << std::endl;
    Printer< ::task3::Checkpoints_<ContainerAllocator> >::stream(s, indent + "  ", v.points);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_CHECKPOINT_RESRESPONSE_H
