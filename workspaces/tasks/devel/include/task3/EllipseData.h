// Generated by gencpp from file task3/EllipseData.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_ELLIPSEDATA_H
#define TASK3_MESSAGE_ELLIPSEDATA_H


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
struct EllipseData_
{
  typedef EllipseData_<ContainerAllocator> Type;

  EllipseData_()
    : found(0)
    , dpt()
    , agl()
    , timestamp()
    , perp_agl()
    , perp_y_itrcpt()  {
    }
  EllipseData_(const ContainerAllocator& _alloc)
    : found(0)
    , dpt(_alloc)
    , agl(_alloc)
    , timestamp(_alloc)
    , perp_agl(_alloc)
    , perp_y_itrcpt(_alloc)  {
  (void)_alloc;
    }



   typedef uint8_t _found_type;
  _found_type found;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _dpt_type;
  _dpt_type dpt;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _agl_type;
  _agl_type agl;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _timestamp_type;
  _timestamp_type timestamp;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _perp_agl_type;
  _perp_agl_type perp_agl;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _perp_y_itrcpt_type;
  _perp_y_itrcpt_type perp_y_itrcpt;





  typedef boost::shared_ptr< ::task3::EllipseData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::EllipseData_<ContainerAllocator> const> ConstPtr;

}; // struct EllipseData_

typedef ::task3::EllipseData_<std::allocator<void> > EllipseData;

typedef boost::shared_ptr< ::task3::EllipseData > EllipseDataPtr;
typedef boost::shared_ptr< ::task3::EllipseData const> EllipseDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::EllipseData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::EllipseData_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/dkalsan/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::EllipseData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::EllipseData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::EllipseData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::EllipseData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::EllipseData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::EllipseData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::EllipseData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d912b32b2cc4be2dc6d9a88df7bfe800";
  }

  static const char* value(const ::task3::EllipseData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd912b32b2cc4be2dULL;
  static const uint64_t static_value2 = 0xc6d9a88df7bfe800ULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::EllipseData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/EllipseData";
  }

  static const char* value(const ::task3::EllipseData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::EllipseData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#Found flag that takes on values 1 or 0 (ellipse detected or not)\n\
uint8 found\n\
\n\
#Depth value at pixel representing the centre of the found ellipse\n\
#Contains garbage if found flag value equal to 0\n\
float64[] dpt\n\
\n\
#angle_min + index_center*angle_increment\n\
float64[] agl\n\
\n\
#result of rospy.Time.now().to_time() when image taken\n\
float64[] timestamp\n\
\n\
#angle of line perpendicular to the face of the ellipse\n\
float64[] perp_agl\n\
\n\
#y intercept of the line perpendicular to the face of the ellips\n\
float64[] perp_y_itrcpt\n\
";
  }

  static const char* value(const ::task3::EllipseData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::EllipseData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.found);
      stream.next(m.dpt);
      stream.next(m.agl);
      stream.next(m.timestamp);
      stream.next(m.perp_agl);
      stream.next(m.perp_y_itrcpt);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EllipseData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::EllipseData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::EllipseData_<ContainerAllocator>& v)
  {
    s << indent << "found: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.found);
    s << indent << "dpt[]" << std::endl;
    for (size_t i = 0; i < v.dpt.size(); ++i)
    {
      s << indent << "  dpt[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.dpt[i]);
    }
    s << indent << "agl[]" << std::endl;
    for (size_t i = 0; i < v.agl.size(); ++i)
    {
      s << indent << "  agl[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.agl[i]);
    }
    s << indent << "timestamp[]" << std::endl;
    for (size_t i = 0; i < v.timestamp.size(); ++i)
    {
      s << indent << "  timestamp[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.timestamp[i]);
    }
    s << indent << "perp_agl[]" << std::endl;
    for (size_t i = 0; i < v.perp_agl.size(); ++i)
    {
      s << indent << "  perp_agl[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.perp_agl[i]);
    }
    s << indent << "perp_y_itrcpt[]" << std::endl;
    for (size_t i = 0; i < v.perp_y_itrcpt.size(); ++i)
    {
      s << indent << "  perp_y_itrcpt[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.perp_y_itrcpt[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_ELLIPSEDATA_H
