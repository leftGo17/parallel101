# sys-fmt
首先通过
```
brew install fmt
```
安装 fmt 库

编译时候需要链接 fmt 库，通过
```
find_package(fmt REQUIRED)
```
其中 REQUIRED 表示 fmt 库是必须的，否则会报错

现在问题是系统是如何找到 fmt 库的？
我们可以通过
```
brew info fmt
```
查看 fmt 库的信息，其中包含了 fmt 库的安装路径
还可以通过compile_commands.json查看编译时的参数
```
[
{
  "directory": "/home/zjp/code/cpp/parallel101/01-cmake-fundamentals/13-sys-fmt/build",
  "command": "/usr/bin/c++ -DFMT_SHARED -isystem /home/linuxbrew/.linuxbrew/include -std=gnu++17 -o CMakeFiles/sys-fmt.dir/main.cpp.o -c /home/zjp/code/cpp/parallel101/01-cmake-fundamentals/13-sys-fmt/main.cpp",
  "file": "/home/zjp/code/cpp/parallel101/01-cmake-fundamentals/13-sys-fmt/main.cpp",
  "output": "CMakeFiles/sys-fmt.dir/main.cpp.o"
}
]
