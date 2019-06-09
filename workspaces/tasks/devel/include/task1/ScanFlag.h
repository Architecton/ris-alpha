// Generated by gencpp from file task1/ScanFlag.msg
// DO NOT EDIT!


#ifndef TASK1_MESSAGE_SCANFLAG_H
#define TASK1_MESSAGE_SCANFLAG_H


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
struct ScanFlag_
{
  typedef ScanFlag_<ContainerAllocator> Type;

  ScanFlag_()
    : flag(0)  {
    }
  ScanFlag_(const ContainerAllocator& _alloc)
    : flag(0)  {
  (void)_alloc;
    }



   typedef uint8_t _flag_type;
  _flag_type flag;





  typedef boost::shared_ptr< ::task1::ScanFlag_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task1::ScanFlag_<ContainerAllocator> const> ConstPtr;

}; // struct ScanFlag_

typedef ::task1::ScanFlag_<std::allocator<void> > ScanFlag;

typedef boost::shared_ptr< ::task1::ScanFlag > ScanFlagPtr;
typedef boost::shared_ptr< ::task1::ScanFlag const> ScanFlagConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task1::ScanFlag_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task1::ScanFlag_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'task1': ['/home/team_alpha/ris-alpha/workspaces/tasks/src/task1/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task1::ScanFlag_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task1::ScanFlag_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::ScanFlag_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::ScanFlag_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::ScanFlag_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::ScanFlag_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task1::ScanFlag_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b6a8907dbdc46dea839fb59e243dc983";
  }

  static const char* value(const ::task1::ScanFlag_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb6a8907dbdc46deaULL;
  static const uint64_t static_value2 = 0x839fb59e243dc983ULL;
};

template<class ContainerAllocator>
struct DataType< ::task1::ScanFlag_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task1/ScanFlag";
  }

  static const char* value(const ::task1::ScanFlag_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task1::ScanFlag_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 flag\n\
";
  }

  static const char* value(const ::task1::ScanFlag_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task1::ScanFlag_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.flag);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ScanFlag_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task1::ScanFlag_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task1::ScanFlag_<ContainerAllocator>& v)
  {
    s << indent << "flag: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.flag);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK1_MESSAGE_SCANFLAG_H
