cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_COMPILER "/home/linuxbrew/.linuxbrew/bin/g++-15")
project(hello)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(hello main.cpp)
target_include_directories(hello PRIVATE .)
