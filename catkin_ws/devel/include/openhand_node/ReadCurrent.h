// Generated by gencpp from file openhand_node/ReadCurrent.msg
// DO NOT EDIT!


#ifndef OPENHAND_NODE_MESSAGE_READCURRENT_H
#define OPENHAND_NODE_MESSAGE_READCURRENT_H

#include <ros/service_traits.h>


#include <openhand_node/ReadCurrentRequest.h>
#include <openhand_node/ReadCurrentResponse.h>


namespace openhand_node
{

struct ReadCurrent
{

typedef ReadCurrentRequest Request;
typedef ReadCurrentResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ReadCurrent
} // namespace openhand_node


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::openhand_node::ReadCurrent > {
  static const char* value()
  {
    return "640c8d4d28b8ccb823cd749d0957df5a";
  }

  static const char* value(const ::openhand_node::ReadCurrent&) { return value(); }
};

template<>
struct DataType< ::openhand_node::ReadCurrent > {
  static const char* value()
  {
    return "openhand_node/ReadCurrent";
  }

  static const char* value(const ::openhand_node::ReadCurrent&) { return value(); }
};


// service_traits::MD5Sum< ::openhand_node::ReadCurrentRequest> should match
// service_traits::MD5Sum< ::openhand_node::ReadCurrent >
template<>
struct MD5Sum< ::openhand_node::ReadCurrentRequest>
{
  static const char* value()
  {
    return MD5Sum< ::openhand_node::ReadCurrent >::value();
  }
  static const char* value(const ::openhand_node::ReadCurrentRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::openhand_node::ReadCurrentRequest> should match
// service_traits::DataType< ::openhand_node::ReadCurrent >
template<>
struct DataType< ::openhand_node::ReadCurrentRequest>
{
  static const char* value()
  {
    return DataType< ::openhand_node::ReadCurrent >::value();
  }
  static const char* value(const ::openhand_node::ReadCurrentRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::openhand_node::ReadCurrentResponse> should match
// service_traits::MD5Sum< ::openhand_node::ReadCurrent >
template<>
struct MD5Sum< ::openhand_node::ReadCurrentResponse>
{
  static const char* value()
  {
    return MD5Sum< ::openhand_node::ReadCurrent >::value();
  }
  static const char* value(const ::openhand_node::ReadCurrentResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::openhand_node::ReadCurrentResponse> should match
// service_traits::DataType< ::openhand_node::ReadCurrent >
template<>
struct DataType< ::openhand_node::ReadCurrentResponse>
{
  static const char* value()
  {
    return DataType< ::openhand_node::ReadCurrent >::value();
  }
  static const char* value(const ::openhand_node::ReadCurrentResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // OPENHAND_NODE_MESSAGE_READCURRENT_H