#include <iostream>

void say_hello() { std::cout << "hello" << std::endl; }

// void call_twice(void func) {
//     func();
//     func();
// }

// c函数指针
void call_twice_1(void (*func)()) {
    func();  // 执行
    func();  // 执行
}

// using 简化
using FuncPtr = void (*)();  // 定义一种“无参无返回值函数指针”类型

void call_twice_2(FuncPtr func) {
    func();
    func();
}

int main() {
    call_twice_1(say_hello);
    call_twice_2(say_hello);
    return 0;
}