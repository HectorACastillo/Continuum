# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "continuum: 0 messages, 3 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(continuum_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv" NAME_WE)
add_custom_target(_continuum_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "continuum" "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv" ""
)

get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv" NAME_WE)
add_custom_target(_continuum_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "continuum" "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv" ""
)

get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv" NAME_WE)
add_custom_target(_continuum_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "continuum" "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/continuum
)
_generate_srv_cpp(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/continuum
)
_generate_srv_cpp(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/continuum
)

### Generating Module File
_generate_module_cpp(continuum
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/continuum
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(continuum_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(continuum_generate_messages continuum_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv" NAME_WE)
add_dependencies(continuum_generate_messages_cpp _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv" NAME_WE)
add_dependencies(continuum_generate_messages_cpp _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv" NAME_WE)
add_dependencies(continuum_generate_messages_cpp _continuum_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(continuum_gencpp)
add_dependencies(continuum_gencpp continuum_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS continuum_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/continuum
)
_generate_srv_eus(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/continuum
)
_generate_srv_eus(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/continuum
)

### Generating Module File
_generate_module_eus(continuum
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/continuum
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(continuum_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(continuum_generate_messages continuum_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv" NAME_WE)
add_dependencies(continuum_generate_messages_eus _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv" NAME_WE)
add_dependencies(continuum_generate_messages_eus _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv" NAME_WE)
add_dependencies(continuum_generate_messages_eus _continuum_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(continuum_geneus)
add_dependencies(continuum_geneus continuum_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS continuum_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/continuum
)
_generate_srv_lisp(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/continuum
)
_generate_srv_lisp(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/continuum
)

### Generating Module File
_generate_module_lisp(continuum
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/continuum
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(continuum_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(continuum_generate_messages continuum_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv" NAME_WE)
add_dependencies(continuum_generate_messages_lisp _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv" NAME_WE)
add_dependencies(continuum_generate_messages_lisp _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv" NAME_WE)
add_dependencies(continuum_generate_messages_lisp _continuum_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(continuum_genlisp)
add_dependencies(continuum_genlisp continuum_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS continuum_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/continuum
)
_generate_srv_nodejs(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/continuum
)
_generate_srv_nodejs(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/continuum
)

### Generating Module File
_generate_module_nodejs(continuum
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/continuum
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(continuum_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(continuum_generate_messages continuum_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv" NAME_WE)
add_dependencies(continuum_generate_messages_nodejs _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv" NAME_WE)
add_dependencies(continuum_generate_messages_nodejs _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv" NAME_WE)
add_dependencies(continuum_generate_messages_nodejs _continuum_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(continuum_gennodejs)
add_dependencies(continuum_gennodejs continuum_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS continuum_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum
)
_generate_srv_py(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum
)
_generate_srv_py(continuum
  "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum
)

### Generating Module File
_generate_module_py(continuum
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(continuum_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(continuum_generate_messages continuum_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/GoTo.srv" NAME_WE)
add_dependencies(continuum_generate_messages_py _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/Reset.srv" NAME_WE)
add_dependencies(continuum_generate_messages_py _continuum_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hector/Documents/Continuum/catkin_ws/src/continuum/srv/MotorStates.srv" NAME_WE)
add_dependencies(continuum_generate_messages_py _continuum_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(continuum_genpy)
add_dependencies(continuum_genpy continuum_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS continuum_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/continuum)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/continuum
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/continuum)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/continuum
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/continuum)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/continuum
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/continuum)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/continuum
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/continuum/.+/__init__.pyc?$"
  )
endif()
