#!/bin/bash
set -e  # 遇到错误立即退出

# 1. 准备 vcpkg (如果目录不存在才 clone，避免重复下载)
if [ ! -d "vcpkg" ]; then
    echo "Cloning vcpkg..."
    git clone https://github.com/microsoft/vcpkg.git --depth=1
fi

# 2. 编译 vcpkg 工具自身 (bootstrap)
# 注意：bootstrap 脚本在 vcpkg 根目录下
if [ ! -f "vcpkg/vcpkg" ]; then
    echo "Bootstrapping vcpkg..."
    ./vcpkg/bootstrap-vcpkg.sh -disableMetrics
fi

# 3. 安装依赖库 (关键步骤：必须在 CMake 运行前完成)
echo "Installing dependencies..."
./vcpkg/vcpkg install fmt:x64-linux

# 4. 配置 CMake
# 此时 vcpkg 已经准备好了，库也装好了，CMake 才能找到 fmt
echo "Configuring project..."
rm -rf build
cmake -B build -DCMAKE_TOOLCHAIN_FILE="./vcpkg/scripts/buildsystems/vcpkg.cmake"

# 5. 编译项目
echo "Building project..."
cmake --build build --target a.out

# 6. 运行
echo "Running application..."
./build/a.out