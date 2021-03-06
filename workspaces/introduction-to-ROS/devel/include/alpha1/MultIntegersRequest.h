// Generated by gencpp from file alpha1/MultIntegersRequest.msg
// DO NOT EDIT!


#ifndef ALPHA1_MESSAGE_MULTINTEGERSREQUEST_H
#define ALPHA1_MESSAGE_MULTINTEGERSREQUEST_H


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
struct MultIntegersRequest_
{
  typedef MultIntegersRequest_<ContainerAllocator> Type;

  MultIntegersRequest_()
    : int_list()  {
    }
  MultIntegersRequest_(const ContainerAllocator& _alloc)
    : int_list(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int64_t, typename ContainerAllocator::template rebind<int64_t>::other >  _int_list_type;
  _int_list_type int_list;





  typedef boost::shared_ptr< ::alpha1::MultIntegersRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::alpha1::MultIntegersRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MultIntegersRequest_

typedef ::alpha1::MultIntegersRequest_<std::allocator<void> > MultIntegersRequest;

typedef boost::shared_ptr< ::alpha1::MultIntegersRequest > MultIntegersRequestPtr;
typedef boost::shared_ptr< ::alpha1::MultIntegersRequest const> MultIntegersRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::alpha1::MultIntegersRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::alpha1::MultIntegersRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace alpha1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'alpha1': ['/home/dkalsan/ris-alpha/workspaces/introduction-to-ROS/src/alpha1/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::alpha1::MultIntegersRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alpha1::MultIntegersRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alpha1::MultIntegersRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b40bc1a8dcd75018642e111fe68b7cbe";
  }

  static const char* value(const ::alpha1::MultIntegersRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb40bc1a8dcd75018ULL;
  static const uint64_t static_value2 = 0x642e111fe68b7cbeULL;
};

template<class ContainerAllocator>
struct DataType< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "alpha1/MultIntegersRequest";
  }

  static const char* value(const ::alpha1::MultIntegersRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64[] int_list\n\
";
  }

  static const char* value(const ::alpha1::MultIntegersRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.int_list);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MultIntegersRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::alpha1::MultIntegersRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::alpha1::MultIntegersRequest_<ContainerAllocator>& v)
  {
    s << indent << "int_list[]" << std::endl;
    for (size_t i = 0; i < v.int_list.size(); ++i)
    {
      s << indent << "  int_list[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.int_list[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ALPHA1_MESSAGE_MULTINTEGERSREQUEST_H
