#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector v = {4, 3, 2, 1};

    int sum =
        std::reduce(v.begin(), v.end(), 0, [](int x, int y) { return x + y; });

    std::cout << sum << std::endl;
    return 0;
}
