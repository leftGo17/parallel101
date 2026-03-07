#include <algorithm>
#include <iostream>
#include <vector>

int sum = 0;
void func(const int& vi) { sum += vi; }
int main() {
    std::vector<int> v{1, 2, 3, 4};
    std::for_each(v.begin(), v.end(), func);
    std::cout << sum << std::endl;
    return 0;
}