#include <cmath>
#include <iostream>
#include <ranges>
#include <vector>

int main() {
    std::vector v = {4, 3, 2, 1, 0, -1, -2};

    for (auto &&vi :
         v | std::views::filter([](auto &&x) { return x >= 0; }) |
             std::views::transform([](auto &&x) { return sqrtf(x); })) {
        std::cout << vi << std::endl;
    }

    return 0;
}
