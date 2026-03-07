cmake_minimum_required(VERSION 3.12)
project(hellocmake LANGUAGES CXX)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

add_executable(a.out main.cpp)
target_include_directories(a.out PUBLIC glm/include)
# #include <glm/vec3.hpp>正好拼接成完整路径
