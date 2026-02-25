#include <iostream>
#include <vector>

int main() {
    std::vector<int> arr = {1, 2, 3, 4, 5, 6, 7};
    int flag = 0;
    int find_num = 5;
    for (auto& i : arr) {
        if (i == find_num) {
            flag = 1;
            break;
        }
    }
    if (flag == 1) {
        std::cout << "find" << std::endl;
    }

    int index = [&]() {
        for (auto const& i : arr) {
            if (i == find_num) return 1;
        }
        return 0;
    }();

    if (index) std::cout << "find" << std::endl;
    return 0;
}