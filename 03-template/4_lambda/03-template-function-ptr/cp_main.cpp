#include <iostream>

void say_float(float n) { std::cout << n << std::endl; }

void say_int(int n) { std::cout << n << std::endl; }

void twice_1(void func(float)) {
    func(1);
    func(2);
}

void twice_2(void func(int)) {
    func(1);
    func(2);
}

template <typename T>
auto twice_3(T func) {
    func(1);
    func(2);
}

int main() {
    twice_1(say_float);
    twice_2(say_int);
    twice_3(say_int);
    twice_3(say_float);
    return 0;
}