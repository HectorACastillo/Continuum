// Generated by gencpp from file continuum/MotorStatesRequest.msg
// DO NOT EDIT!


#ifndef CONTINUUM_MESSAGE_MOTORSTATESREQUEST_H
#define CONTINUUM_MESSAGE_MOTORSTATESREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace continuum
{
template <class ContainerAllocator>
struct MotorStatesRequest_
{
  typedef MotorStatesRequest_<ContainerAllocator> Type;

  MotorStatesRequest_()
    {
    }
  MotorStatesRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::continuum::MotorStatesRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::continuum::MotorStatesRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MotorStatesRequest_

typedef ::continuum::MotorStatesRequest_<std::allocator<void> > MotorStatesRequest;

typedef boost::shared_ptr< ::continuum::MotorStatesRequest > MotorStatesRequestPtr;
typedef boost::shared_ptr< ::continuum::MotorStatesRequest const> MotorStatesRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::continuum::MotorStatesRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::continuum::MotorStatesRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace continuum

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::continuum::MotorStatesRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::continuum::MotorStatesRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::continuum::MotorStatesRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::continuum::MotorStatesRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::continuum::MotorStatesRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::continuum::MotorStatesRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::continuum::MotorStatesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::continuum::MotorStatesRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::continuum::MotorStatesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "continuum/MotorStatesRequest";
  }

  static const char* value(const ::continuum::MotorStatesRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::continuum::MotorStatesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::continuum::MotorStatesRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::continuum::MotorStatesRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MotorStatesRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::continuum::MotorStatesRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::continuum::MotorStatesRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // CONTINUUM_MESSAGE_MOTORSTATESREQUEST_H