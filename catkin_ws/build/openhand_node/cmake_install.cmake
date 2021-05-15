# Install script for directory: /home/hector/Documents/Continuum/catkin_ws/src/openhand_node

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/hector/Documents/Continuum/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/hector/Documents/Continuum/catkin_ws/build/openhand_node/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/openhand_node/srv" TYPE FILE FILES
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/MoveServos.srv"
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/OperatingMode.srv"
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/ReadServos.srv"
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/HoldServos.srv"
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/ReadCurrent.srv"
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/ReadTemperature.srv"
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/ReadLoad.srv"
    "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/srv/TorqueServos.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/openhand_node/cmake" TYPE FILE FILES "/home/hector/Documents/Continuum/catkin_ws/build/openhand_node/catkin_generated/installspace/openhand_node-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/hector/Documents/Continuum/catkin_ws/devel/include/openhand_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/hector/Documents/Continuum/catkin_ws/devel/share/roseus/ros/openhand_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/hector/Documents/Continuum/catkin_ws/devel/share/common-lisp/ros/openhand_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/hector/Documents/Continuum/catkin_ws/devel/share/gennodejs/ros/openhand_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/hector/Documents/Continuum/catkin_ws/devel/lib/python2.7/dist-packages/openhand_node")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/hector/Documents/Continuum/catkin_ws/devel/lib/python2.7/dist-packages/openhand_node" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/hector/Documents/Continuum/catkin_ws/devel/lib/python2.7/dist-packages/openhand_node" FILES_MATCHING REGEX "/home/hector/Documents/Continuum/catkin_ws/devel/lib/python2.7/dist-packages/openhand_node/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hector/Documents/Continuum/catkin_ws/build/openhand_node/catkin_generated/installspace/openhand_node.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/openhand_node/cmake" TYPE FILE FILES "/home/hector/Documents/Continuum/catkin_ws/build/openhand_node/catkin_generated/installspace/openhand_node-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/openhand_node/cmake" TYPE FILE FILES
    "/home/hector/Documents/Continuum/catkin_ws/build/openhand_node/catkin_generated/installspace/openhand_nodeConfig.cmake"
    "/home/hector/Documents/Continuum/catkin_ws/build/openhand_node/catkin_generated/installspace/openhand_nodeConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/openhand_node" TYPE FILE FILES "/home/hector/Documents/Continuum/catkin_ws/src/openhand_node/package.xml")
endif()

