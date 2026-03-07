add_library(hellolib STATIC hello.cpp)
# 对于 hellolib 这个库， 请将 当前目录（.） 添加到头文件搜索路径中。 并且，这是一个 PUBLIC 的属性——这意味着，
# 不仅编译 hellolib 时要到这里找头文件，以后任何链接了 hellolib 的程序，也要自动到这里找头文件
target_include_directories(hellolib PUBLIC .)
