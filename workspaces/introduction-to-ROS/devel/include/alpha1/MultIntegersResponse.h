// Generated by gencpp from file alpha1/MultIntegersResponse.msg
// DO NOT EDIT!


#ifndef ALPHA1_MESSAGE_MULTINTEGERSRESPONSE_H
#define ALPHA1_MESSAGE_MULTINTEGERSRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace alpha1
{
template <class ContainerAllocator>
struct MultIntegersResponse_
{
  typedef MultIntegersResponse_<ContainerAllocator> Type;

  MultIntegersResponse_()
    : result(0)  {
    }
  MultIntegersResponse_(const ContainerAllocator& _alloc)
    : result(0)  {
  (void)_alloc;
    }



   typedef int64_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::alpha1::MultIntegersResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::alpha1::MultIntegersResponse_<ContainerAllocator> const> ConstPtr;

}; // struct MultIntegersResponse_

typedef ::alpha1::MultIntegersResponse_<std::allocator<void> > MultIntegersResponse;

typedef boost::shared_ptr< ::alpha1::MultIntegersResponse > MultIntegersResponsePtr;
typedef boost::shared_ptr< ::alpha1::MultIntegersResponse const> MultIntegersResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::alpha1::MultIntegersResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::alpha1::MultIntegersResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace alpha1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'alpha1': ['/home/miha/Desktop/ris-alpha/workspaces/introduction-to-ROS/src/alpha1/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::alpha1::MultIntegersResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alpha1::MultIntegersResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alpha1::MultIntegersResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9b05623554ab950ed237d43d45f0b4dd";
  }

  static const char* value(const ::alpha1::MultIntegersResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9b05623554ab950eULL;
  static const uint64_t static_value2 = 0xd237d43d45f0b4ddULL;
};

template<class ContainerAllocator>
struct DataType< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "alpha1/MultIntegersResponse";
  }

  static const char* value(const ::alpha1::MultIntegersResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 result\n\
";
  }

  static const char* value(const ::alpha1::MultIntegersResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MultIntegersResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::alpha1::MultIntegersResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::alpha1::MultIntegersResponse_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<int64_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ALPHA1_MESSAGE_MULTINTEGERSRESPONSE_H
