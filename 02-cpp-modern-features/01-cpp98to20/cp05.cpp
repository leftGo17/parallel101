#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4};
    int sum = 0;
    std::for_each(v.begin(), v.end(), [&sum](auto &vi) -> void { sum += vi; });
    std::cout << sum << std::endl;
    return 0;
}