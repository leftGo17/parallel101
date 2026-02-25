#include <iostream>

int main() {
    // 使用 volatile 防止编译器优化掉循环
    // 10亿次循环在现代 CPU 上大约跑 1-3 秒
    volatile int a = 0;
    long long iterations = 1000000000LL;

    std::cout << "正在运行 10 亿次循环，请稍候..." << std::endl;

    for (long long i = 0; i < iterations; ++i) {
        a = 1;
    }

    std::cout << "计算完成！" << std::endl;
    return 0;
}