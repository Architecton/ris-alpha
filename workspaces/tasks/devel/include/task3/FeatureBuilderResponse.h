// Generated by gencpp from file task3/FeatureBuilderResponse.msg
// DO NOT EDIT!


#ifndef TASK3_MESSAGE_FEATUREBUILDERRESPONSE_H
#define TASK3_MESSAGE_FEATUREBUILDERRESPONSE_H


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
struct FeatureBuilderResponse_
{
  typedef FeatureBuilderResponse_<ContainerAllocator> Type;

  FeatureBuilderResponse_()
    : res()  {
    }
  FeatureBuilderResponse_(const ContainerAllocator& _alloc)
    : res(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _res_type;
  _res_type res;





  typedef boost::shared_ptr< ::task3::FeatureBuilderResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task3::FeatureBuilderResponse_<ContainerAllocator> const> ConstPtr;

}; // struct FeatureBuilderResponse_

typedef ::task3::FeatureBuilderResponse_<std::allocator<void> > FeatureBuilderResponse;

typedef boost::shared_ptr< ::task3::FeatureBuilderResponse > FeatureBuilderResponsePtr;
typedef boost::shared_ptr< ::task3::FeatureBuilderResponse const> FeatureBuilderResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task3::FeatureBuilderResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task3::FeatureBuilderResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task3

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
<<<<<<< HEAD
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/dkalsan/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}
=======
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task3': ['/home/jernej/ris-alpha/workspaces/tasks/src/task3/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}
>>>>>>> 421acea4e6516f0b1f751f12223a0631f49cf0f4

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task3::FeatureBuilderResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task3::FeatureBuilderResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task3::FeatureBuilderResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "53af918a2a4a2a182c184142fff49b0c";
  }

  static const char* value(const ::task3::FeatureBuilderResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x53af918a2a4a2a18ULL;
  static const uint64_t static_value2 = 0x2c184142fff49b0cULL;
};

template<class ContainerAllocator>
struct DataType< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task3/FeatureBuilderResponse";
  }

  static const char* value(const ::task3::FeatureBuilderResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string res\n\
\n\
";
  }

  static const char* value(const ::task3::FeatureBuilderResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.res);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FeatureBuilderResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task3::FeatureBuilderResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task3::FeatureBuilderResponse_<ContainerAllocator>& v)
  {
    s << indent << "res: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.res);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK3_MESSAGE_FEATUREBUILDERRESPONSE_H
