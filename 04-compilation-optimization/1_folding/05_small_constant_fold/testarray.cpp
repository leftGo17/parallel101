#include <array>
#include <iostream>
#include <vector>

int main() {
    std::array<int, 10> a;
    a[0] = 1;
    a[1] = 2;
    std::cout << sizeof(a) << std::endl;
    std::cout << sizeof(std::vector<int>) << std::endl;
    std::cout << sizeof(std::array<int, 1000>) << std::endl;
    return 0;
}