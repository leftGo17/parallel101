cmake_minimum_required(VERSION 3.10)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(sys-fmt)

find_package(fmt REQUIRED)

add_executable(sys-fmt main.cpp)
target_link_libraries(sys-fmt fmt::fmt)
