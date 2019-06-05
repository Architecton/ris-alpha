// Generated by gencpp from file task3/TreasureLocatorResponse.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_TREASURELOCATORRESPONSE_H
#define TASK3_MESSAGE_TREASURELOCATORRESPONSE_H


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
struct TreasureLocatorResponse_
{
  typedef TreasureLocatorResponse_<ContainerAllocator> Type;

  TreasureLocatorResponse_()
    : treasure_x(0.0)
    , treasure_y(0.0)  {
    }
  TreasureLocatorResponse_(const ContainerAllocator& _alloc)
    : treasure_x(0.0)
    , treasure_y(0.0)  {
  (void)_alloc;
    }



   typedef double _treasure_x_type;
  _treasure_x_type treasure_x;

   typedef double _treasure_y_type;
  _treasure_y_type treasure_y;





  typedef boost::shared_ptr< ::task3::TreasureLocatorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::TreasureLocatorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct TreasureLocatorResponse_

typedef ::task3::TreasureLocatorResponse_<std::allocator<void> > TreasureLocatorResponse;

typedef boost::shared_ptr< ::task3::TreasureLocatorResponse > TreasureLocatorResponsePtr;
typedef boost::shared_ptr< ::task3::TreasureLocatorResponse const> TreasureLocatorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::TreasureLocatorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::TreasureLocatorResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::TreasureLocatorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::TreasureLocatorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::TreasureLocatorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "35a8c353b62fb549dc16741d0d6d9d13";
  }

  static const char* value(const ::task3::TreasureLocatorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x35a8c353b62fb549ULL;
  static const uint64_t static_value2 = 0xdc16741d0d6d9d13ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/TreasureLocatorResponse";
  }

  static const char* value(const ::task3::TreasureLocatorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 treasure_x\n\
float64 treasure_y\n\
";
  }

  static const char* value(const ::task3::TreasureLocatorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.treasure_x);
      stream.next(m.treasure_y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TreasureLocatorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::TreasureLocatorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::TreasureLocatorResponse_<ContainerAllocator>& v)
  {
    s << indent << "treasure_x: ";
    Printer<double>::stream(s, indent + "  ", v.treasure_x);
    s << indent << "treasure_y: ";
    Printer<double>::stream(s, indent + "  ", v.treasure_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_TREASURELOCATORRESPONSE_H
