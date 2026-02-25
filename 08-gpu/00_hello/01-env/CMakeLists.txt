cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Release)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
project(hellocuda LANGUAGES CXX CUDA)

add_executable(main main.cu)
