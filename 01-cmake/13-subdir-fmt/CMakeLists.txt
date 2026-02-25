cmake_minimum_required(VERSION 3.12)
project(hellocmake LANGUAGES CXX)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

add_subdirectory(fmt)
add_executable(a.out main.cpp)
target_link_libraries(a.out fmt::fmt)