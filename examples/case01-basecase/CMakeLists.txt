# Minimum CMake required
cmake_minimum_required(VERSION 2.8.12)

# Project
project(case01-basecase)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${WERROR_FLAGS} -fPIC -fPIE -Wall")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${WERROR_FLAGS} -fPIC -fPIE -Wall")

# Find required protobuf package
find_package(protobuf REQUIRED)

if(Protobuf_VERSION)
  message(STATUS "Using Protocol Buffers ${Protobuf_VERSION}")
endif()

PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS
                      person.proto
                     )

PROTOBUF_GENERATE_PYTHON(PROTO_PY person.proto
)

message(STATUS "PROTO_HDRS: " ${PROTO_HDRS})
message(STATUS "PROTO_SRCS: " ${PROTO_SRCS})
message(STATUS "PROTO_PY: " ${PROTO_PY})

include_directories(${Protobuf_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} main.cc
                               test.cc
                               ${PROTO_SRCS}
)
target_include_directories(${PROJECT_NAME}
    PUBLIC
    ${Protobuf_INCLUDE_DIRS}
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
)

target_link_libraries(${PROJECT_NAME} ${Protobuf_LIBRARIES})