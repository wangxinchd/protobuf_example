cmake_minimum_required(VERSION 3.5.1)

set(Protobuf_PATH ${CMAKE_HOME_DIRECTORY}/third_party/protobuf-3.21.12)
set(Protobuf_INCLUDE_DIRS ${Protobuf_PATH}/include)
set(Protobuf_LIBRARIES ${Protobuf_PATH}/lib/libprotobuf.a)
set(Protobuf_PROTOC_EXECUTABLE ${Protobuf_PATH}/tools/protoc)

# Version info variable
include("${Protobuf_PATH}/cmake/protobuf/protobuf-config-version.cmake")
include("${Protobuf_PATH}/cmake/protobuf/protobuf-config.cmake")
include("${Protobuf_PATH}/cmake/protobuf/protobuf-module.cmake")


message(STATUS "Protobuf_VERSION: " ${Protobuf_VERSION})
message(STATUS "Protobuf_INCLUDE_DIRS: " ${Protobuf_INCLUDE_DIRS})
message(STATUS "Protobuf_LIBRARIES: " ${Protobuf_LIBRARIES})
message(STATUS "Protobuf_PROTOC_EXECUTABLE: " ${Protobuf_PROTOC_EXECUTABLE})