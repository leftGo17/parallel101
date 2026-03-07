// #include <iostream>

// template <typename T>
// void fetch_data(T const& func) {
//     for (int i = 0; i < 32; i++) {
//         func(i);
//         func(i + 0.5);
//     }
// }
#include <iostream>
#include <type_traits>
#include <vector>

namespace test0 {
class obj {
  public:
    std::string name;  // 涉及动态内存分配
    std::vector<int> data;
};

void test1(obj a) { std::cout << "test1" << std::endl; }

void test2(obj const& a) { std::cout << "test2" << std::endl; }

int main() {
    test1({"hello", {1, 2, 3}});
    test2({"hello", {1, 2, 3}});

    obj a = {"hello", {1, 2, 3}};
    obj const& b = {"hello", {1, 2, 3}};
    return 0;
}

}  // namespace test0

template <typename T>
void fetch_data(T const& func) {
    for (int i = 0; i < 10; i++) {
        func(i);
        func(i + 0.5f);
    }
}

int main() {
    std::vector<int> res_i;
    std::vector<float> res_f;

    fetch_data([&](auto const& x) {
        using T = std::decay_t<decltype(x)>;
        if constexpr (std::is_same_v<T, int>) {
            res_i.push_back(x);
        } else if constexpr (std::is_same_v<T, float>) {
            res_f.push_back(x);
        }
    });

    std::cout << res_i.size() << std::endl;
    std::cout << res_f.size() << std::endl;
    return 0;
}