#include <iostream>
#include <type_traits>

void test1(int&& p) {}

void test2(const int& p) {}

void test3(int& p) {}

int main() {
    auto p = std::is_same_v<int const, const int>;
    std::cout << p << std::endl;

    using name1 = std::remove_reference_t<int&>;
    name1 b;

    int a = 1;

    test1(3);
    // test1(a);

    test2(a);
    test2(1);

    test3(a);
    // test3(1);

    return 0;
}