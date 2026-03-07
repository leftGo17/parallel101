#include <iostream>
#include <vector>

// 首先只有一个模板参数T，我们是知道返回类型的，所以返回类型就直接用T就行
template <class T>
T sum(const std::vector<T> &arr) {
    T res = 0;
    for (int i = 0; i < arr.size(); i++) {
        res += arr[i];
    }
    return res;
}

// 但是如果我的模板参数本身是一个容器类（容器类的参数类型又由容器内部决定，这就存在一个两层的推导关系了）
// 这时候第一种方法是使用auto
template <class C>
typename C::value_type sum1(const C &container) {
    using returntype = typename C::value_type;
    returntype res = 0;
    for (auto const &val : container) {
        res += val;
    }
    return res;
}

template <class C>
auto sum2(const C &container) {
    // 1. 获取迭代器解引用后的类型（通常是引用，如 int&）
    // 2. 使用 std::decay<>::type 去掉引用和 const，得到原始值类型（如 int）
    using returntype =
        typename std::decay<decltype(*std::begin(container))>::type;

    returntype res{};
    for (auto const &val : container) {
        res += val;
    }
    return res;
}

// template <class C>
// auto sum3(C &&container) {
//     // 使用 std::forward 保持容器的左右值属性
//     using T = typename std::decay<decltype(*std::begin(
//         std::forward<C>(container)))>::type;
//     T res{};
//     for (auto &&val : std::forward<C>(container)) {
//         res += val;
//     }
//     return res;
// }

template <class C>
decltype(auto) sum4(const C &container) {
    // 依然需要确定内部求和变量的类型
    using T = std::decay_t<decltype(*std::begin(container))>;

    T res{};
    for (const auto &val : container) {
        res += val;
    }
    return res;  // 编译器根据 res 的类型自动推导返回值
}

int main() {
    std::vector<int> a = {4, 3, 2, 1};
    std::cout << sum(a) << std::endl;
    std::vector<float> b = {3.14f, 2.718f};
    std::cout << sum(b) << std::endl;
}
