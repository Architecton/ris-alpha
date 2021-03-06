// Generated by gencpp from file task1/CheckpointProcessorResponse.msg
// DO NOT EDIT!


#ifndef TASK1_MESSAGE_CHECKPOINTPROCESSORRESPONSE_H
#define TASK1_MESSAGE_CHECKPOINTPROCESSORRESPONSE_H


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
struct CheckpointProcessorResponse_
{
  typedef CheckpointProcessorResponse_<ContainerAllocator> Type;

  CheckpointProcessorResponse_()
    : output_x(0.0)
    , output_y(0.0)
    , valid(false)  {
    }
  CheckpointProcessorResponse_(const ContainerAllocator& _alloc)
    : output_x(0.0)
    , output_y(0.0)
    , valid(false)  {
  (void)_alloc;
    }



   typedef double _output_x_type;
  _output_x_type output_x;

   typedef double _output_y_type;
  _output_y_type output_y;

   typedef uint8_t _valid_type;
  _valid_type valid;





  typedef boost::shared_ptr< ::task1::CheckpointProcessorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::task1::CheckpointProcessorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct CheckpointProcessorResponse_

typedef ::task1::CheckpointProcessorResponse_<std::allocator<void> > CheckpointProcessorResponse;

typedef boost::shared_ptr< ::task1::CheckpointProcessorResponse > CheckpointProcessorResponsePtr;
typedef boost::shared_ptr< ::task1::CheckpointProcessorResponse const> CheckpointProcessorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::task1::CheckpointProcessorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace task1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'task1': ['/home/dkalsan/ris-alpha/workspaces/tasks/src/task1/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::task1::CheckpointProcessorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::task1::CheckpointProcessorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::task1::CheckpointProcessorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d43cce861a65119db3648d950c7f417f";
  }

  static const char* value(const ::task1::CheckpointProcessorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd43cce861a65119dULL;
  static const uint64_t static_value2 = 0xb3648d950c7f417fULL;
};

template<class ContainerAllocator>
struct DataType< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "task1/CheckpointProcessorResponse";
  }

  static const char* value(const ::task1::CheckpointProcessorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 output_x\n\
float64 output_y\n\
bool valid\n\
";
  }

  static const char* value(const ::task1::CheckpointProcessorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.output_x);
      stream.next(m.output_y);
      stream.next(m.valid);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CheckpointProcessorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::task1::CheckpointProcessorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::task1::CheckpointProcessorResponse_<ContainerAllocator>& v)
  {
    s << indent << "output_x: ";
    Printer<double>::stream(s, indent + "  ", v.output_x);
    s << indent << "output_y: ";
    Printer<double>::stream(s, indent + "  ", v.output_y);
    s << indent << "valid: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.valid);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TASK1_MESSAGE_CHECKPOINTPROCESSORRESPONSE_H
