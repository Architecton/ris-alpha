// Generated by gencpp from file alpha2/TurtleManagerRequest.msg
// DO NOT EDIT!


#ifndef ALPHA2_MESSAGE_TURTLEMANAGERREQUEST_H
#define ALPHA2_MESSAGE_TURTLEMANAGERREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace alpha2
{
template <class ContainerAllocator>
struct TurtleManagerRequest_
{
  typedef TurtleManagerRequest_<ContainerAllocator> Type;

  TurtleManagerRequest_()
    : trajection()
    , duration(0)  {
    }
  TurtleManagerRequest_(const ContainerAllocator& _alloc)
    : trajection(_alloc)
    , duration(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _trajection_type;
  _trajection_type trajection;

   typedef uint64_t _duration_type;
  _duration_type duration;





  typedef boost::shared_ptr< ::alpha2::TurtleManagerRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::alpha2::TurtleManagerRequest_<ContainerAllocator> const> ConstPtr;

}; // struct TurtleManagerRequest_

typedef ::alpha2::TurtleManagerRequest_<std::allocator<void> > TurtleManagerRequest;

typedef boost::shared_ptr< ::alpha2::TurtleManagerRequest > TurtleManagerRequestPtr;
typedef boost::shared_ptr< ::alpha2::TurtleManagerRequest const> TurtleManagerRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::alpha2::TurtleManagerRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace alpha2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::alpha2::TurtleManagerRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::alpha2::TurtleManagerRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::alpha2::TurtleManagerRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5b4fe41f14e7d3f220a38a44a8a4bcb4";
  }

  static const char* value(const ::alpha2::TurtleManagerRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5b4fe41f14e7d3f2ULL;
  static const uint64_t static_value2 = 0x20a38a44a8a4bcb4ULL;
};

template<class ContainerAllocator>
struct DataType< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "alpha2/TurtleManagerRequest";
  }

  static const char* value(const ::alpha2::TurtleManagerRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string trajection\n\
uint64 duration\n\
";
  }

  static const char* value(const ::alpha2::TurtleManagerRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.trajection);
      stream.next(m.duration);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TurtleManagerRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::alpha2::TurtleManagerRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::alpha2::TurtleManagerRequest_<ContainerAllocator>& v)
  {
    s << indent << "trajection: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.trajection);
    s << indent << "duration: ";
    Printer<uint64_t>::stream(s, indent + "  ", v.duration);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ALPHA2_MESSAGE_TURTLEMANAGERREQUEST_H