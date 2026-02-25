#include <cstddef>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4};
    int sum = 0;
    for (size_t i = 0; i < v.size(); i++) sum += v[i];
    std::cout << sum << std::endl;
    return 0;
}