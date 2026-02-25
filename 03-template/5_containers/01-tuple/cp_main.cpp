#include <iostream>
#include <tuple>

int main() {
    auto tup1 = std::tuple<int, float, char>{3, 3.4f, 'c'};
    auto tup2 = std::tuple{1, 1.2f, 'c'};

    auto first = std::get<0>(tup2);
    auto [fir, sec, thr] = tup2;
    auto &[fir1, sec1, thr1] = tup2;
    auto const &[fir2, sec2, thr2] = tup2;
    std::cout << "hello" << std::endl;
}