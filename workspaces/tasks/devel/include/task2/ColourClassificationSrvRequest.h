// Generated by gencpp from file task2/ColourClassificationSrvRequest.msg
// DO NOT EDIT!


#ifndef TASK2_MESSAGE_COLOURCLASSIFICATIONSRVREQUEST_H
#define TASK2_MESSAGE_COLOURCLASSIFICATIONSRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace task2
{
template <class ContainerAllocator>
struct ColourClassificationSrvRequest_
{
  typedef ColourClassificationSrvRequest_<ContainerAllocator> Type;

  ColourClassificationSrvRequest_()
    : features_mat()
    , num_features(0)  {
    }
  ColourClassificationSrvRequest_(const ContainerAllocator& _alloc)
    : features_mat(_alloc)
    , num_features(0)  {
  (void)_alloc;
    }



   typedef std::vector<int64_t, typename ContainerAllocator::template rebind<int64_t>::other >  _features_mat_type;
  _features_mat_type features_mat;

   typedef int64_t _num_features_type;
  _num_features_type num_features;





  typedef boost::shared_ptr< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ColourClassificationSrvRequest_

typedef ::task2::ColourClassificationSrvRequest_<std::allocator<void> > ColourClassificationSrvRequest;

typedef boost::shared_ptr< ::task2::ColourClassificationSrvRequest > ColourClassificationSrvRequestPtr;
typedef boost::shared_ptr< ::task2::ColourClassificationSrvRequest const> ColourClassificationSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task2::ColourClassificationSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'task2': ['/home/team_alpha/ris-alpha/workspaces/tasks/src/task2/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "63aff3ad827b2f844a2b9710c151a2bc";
  }

  static const char* value(const ::task2::ColourClassificationSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x63aff3ad827b2f84ULL;
  static const uint64_t static_value2 = 0x4a2b9710c151a2bcULL;
};

template<class ContainerAllocator>
struct DataType< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task2/ColourClassificationSrvRequest";
  }

  static const char* value(const ::task2::ColourClassificationSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64[] features_mat\n\
int64 num_features\n\
";
  }

  static const char* value(const ::task2::ColourClassificationSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.features_mat);
      stream.next(m.num_features);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ColourClassificationSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task2::ColourClassificationSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task2::ColourClassificationSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "features_mat[]" << std::endl;
    for (size_t i = 0; i < v.features_mat.size(); ++i)
    {
      s << indent << "  features_mat[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.features_mat[i]);
    }
    s << indent << "num_features: ";
    Printer<int64_t>::stream(s, indent + "  ", v.num_features);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK2_MESSAGE_COLOURCLASSIFICATIONSRVREQUEST_H
