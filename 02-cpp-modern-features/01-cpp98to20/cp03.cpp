#include <iostream>
#include <vector>

int main() {
    std::vector<int> v1{3, 2, 1, 1};
    std::vector<int> v2 = {1, 2, 3, 4};

    int sum = 0;
    for (auto &&vi : v1) {
        sum += vi;
    }
    std::cout << sum << std::endl;
    return 0;
}