# Repository Guidelines

## Project Structure & Module Organization

This repository is a C++ course codebase for modern C++, CMake, concurrency,
parallel algorithms, memory performance, and CUDA topics. Numbered top-level
directories such as `01-cmake-fundamentals/`, `04-compilation-optimization/`,
`06-parallel-algorithms/`, and `08-cuda-programming/` contain lesson examples.
Most examples live in their own subdirectory with a `main.cpp`, `CMakeLists.txt`,
and often a `run.sh`. Slides and teaching materials are stored in `slides/`,
`ppt/`, and per-topic `slides.pptx` files. Standalone experiments are in
folders such as `specalloc/`, `specifelse/`, and `specmacro/`.

## Build, Test, and Development Commands

Build examples from the example directory, not from the repository root:

```sh
cd 02-cpp-modern-features/13-unique-ptr
./run.sh
```

Most `run.sh` scripts configure a local `build/` directory, build the target,
and execute it. For manual CMake work, use:

```sh
cmake -B build
cmake --build build
./build/<target>
```

Some examples require optional system packages such as CUDA, OpenMP, TBB, or
fmt. Check the local `CMakeLists.txt` before changing dependencies.

## Coding Style & Naming Conventions

Use C++17 unless an example intentionally demonstrates another standard.
Formatting is controlled by `.clang-format`: 4-space indentation, 80-column
limit, attached braces, left pointer alignment, and grouped includes. Run
`clang-format -i main.cpp` or format only the files you changed. Preserve the
course example naming style: directories are usually numbered (`01_raw/`,
`06_vector/01/`), source files are short and descriptive (`main.cpp`,
`ticktock.h`, `randint.h`), and build output stays in `build/`.

## Testing Guidelines

There is no single repository-wide test runner. Treat each example as its own
test: build it, run it, and verify the expected console output or benchmark
behavior. When adding test-style examples, prefer names already used in the
repo, such as `test*.cpp`, and include a local `run.sh` or `CMakeLists.txt` so
others can reproduce the result.

## Commit & Pull Request Guidelines

Git history uses short, direct commit subjects, often English or Chinese, for
example `学习RAII思想`, `add .clangd`, and `fix gpu-env in yixi`. Keep commits
focused on one lesson or experiment. Pull requests should describe the changed
topic directory, list the commands run, mention required libraries or hardware
such as CUDA-capable GPUs, and include screenshots only when slides or visual
assets changed.

## Agent-Specific Instructions

Do not remove generated or local `build/` directories unless asked. Keep edits
scoped to the target example and avoid broad refactors across lesson folders.
