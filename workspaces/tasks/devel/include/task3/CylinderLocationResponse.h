// Generated by gencpp from file task3/CylinderLocationResponse.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_CYLINDERLOCATIONRESPONSE_H
#define TASK3_MESSAGE_CYLINDERLOCATIONRESPONSE_H


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
struct CylinderLocationResponse_
{
  typedef CylinderLocationResponse_<ContainerAllocator> Type;

  CylinderLocationResponse_()
    : found(0)
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , x_a(0.0)
    , y_a(0.0)
    , z_a(0.0)  {
    }
  CylinderLocationResponse_(const ContainerAllocator& _alloc)
    : found(0)
    , x(0.0)
    , y(0.0)
    , z(0.0)
    , x_a(0.0)
    , y_a(0.0)
    , z_a(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _found_type;
  _found_type found;

   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;

   typedef double _x_a_type;
  _x_a_type x_a;

   typedef double _y_a_type;
  _y_a_type y_a;

   typedef double _z_a_type;
  _z_a_type z_a;





  typedef boost::shared_ptr< ::task3::CylinderLocationResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::CylinderLocationResponse_<ContainerAllocator> const> ConstPtr;

}; // struct CylinderLocationResponse_

typedef ::task3::CylinderLocationResponse_<std::allocator<void> > CylinderLocationResponse;

typedef boost::shared_ptr< ::task3::CylinderLocationResponse > CylinderLocationResponsePtr;
typedef boost::shared_ptr< ::task3::CylinderLocationResponse const> CylinderLocationResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::CylinderLocationResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::CylinderLocationResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/jernej/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::CylinderLocationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::CylinderLocationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::CylinderLocationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::CylinderLocationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::CylinderLocationResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::CylinderLocationResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::CylinderLocationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e2102fc99f4e6b63e16a185029b0e674";
  }

  static const char* value(const ::task3::CylinderLocationResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe2102fc99f4e6b63ULL;
  static const uint64_t static_value2 = 0xe16a185029b0e674ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::CylinderLocationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/CylinderLocationResponse";
  }

  static const char* value(const ::task3::CylinderLocationResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::CylinderLocationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
uint8 found\n\
\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
\n\
float64 x_a\n\
float64 y_a\n\
float64 z_a\n\
\n\
";
  }

  static const char* value(const ::task3::CylinderLocationResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::CylinderLocationResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.found);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.x_a);
      stream.next(m.y_a);
      stream.next(m.z_a);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CylinderLocationResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::CylinderLocationResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::CylinderLocationResponse_<ContainerAllocator>& v)
  {
    s << indent << "found: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.found);
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
    s << indent << "x_a: ";
    Printer<double>::stream(s, indent + "  ", v.x_a);
    s << indent << "y_a: ";
    Printer<double>::stream(s, indent + "  ", v.y_a);
    s << indent << "z_a: ";
    Printer<double>::stream(s, indent + "  ", v.z_a);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_CYLINDERLOCATIONRESPONSE_H
