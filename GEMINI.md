# Parallel101 Project Instructions

## Project Overview
This repository contains source code and course materials for the "High Performance Parallel Programming and Optimization" (高性能并行编程与优化) course. It covers a wide range of topics from modern C++ fundamentals to advanced GPU programming with CUDA.

### Key Technologies
- **Language:** C++17/C++20, CUDA C++
- **Build System:** CMake
- **Parallel Frameworks:** OpenMP, Intel TBB, CUDA
- **Tools:** GCC/Clang, NVCC, GDB, Valgrind

## Directory Structure
The project is organized by chapters and sections:
- `NN-topic/`: A chapter covering a specific theme (e.g., `05-concurrency`).
- `NN-topic/MM/`: An individual lesson or section containing code examples.
- `slides/` or `ppt/`: Course presentation materials.

## Building and Running
The repository is **not** a single monolithic CMake project. Instead, most subdirectories under the chapters are independent projects.

### Standard Workflow
For most sections, use the following commands:
1. Navigate to the section directory: `cd <chapter>/<section>`
2. Build and run using the provided script (if available):
   ```bash
   bash run.sh
   ```
3. Alternatively, manually build with CMake:
   ```bash
   cmake -B build
   cmake --build build
   # Executable name varies by section, check CMakeLists.txt
   ```

### Prerequisites
- **Compiler:** GCC 9+ or Clang equivalent.
- **Build Tools:** CMake 3.12+.
- **GPU Tools:** CUDA Toolkit (required for chapters 08-10).

## Development Conventions
- **Code Style:** Strictly follow the `.clang-format` configuration in the root directory.
  - Indentation: 4 spaces.
  - Pointer Alignment: Left (e.g., `int* p`).
  - Column Limit: 80.
- **Modern C++:** Use idiomatic C++17/20 features (RAII, STL containers, lambdas) as demonstrated in the course.
- **Safety:** Prioritize smart pointers (`std::unique_ptr`, `std::shared_ptr`) over raw pointers for memory management.
- **Optimization:** Be mindful of compiler optimizations, memory bandwidth, and cache locality as taught in chapters 04 and 07.
