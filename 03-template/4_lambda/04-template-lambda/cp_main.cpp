#include <iostream>

template <typename T>
void call_twice(T func) {
    func(0);
    func(1);
    std::cout << sizeof(T) << std::endl;
}

int main() {
    auto myfunc = [](int n) { std::cout << n << std::endl; };

    call_twice(myfunc);

    return 0;
}