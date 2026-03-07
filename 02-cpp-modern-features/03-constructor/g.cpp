#include <iostream>
#include <string>

struct Pig {
    std::string name{"peiqi"};
    int weight{80};

    // 构造函数不是普通函数，所以不存在Pig&，返回引用的情况
    // 只有当构造函数接受不同的，单个的类型参数时，才建议加explicit
    Pig() = default;

    Pig(std::string n, int w) : name(std::move(n)), weight(w) {}

    Pig(const Pig& other) : name(other.name), weight(other.weight) {};

    Pig(Pig&& other) noexcept
        : name(std::move(other.name)), weight(std::move(other.weight)) {}

    Pig& operator=(const Pig& other) {
        name = other.name;
        weight = other.weight;
        return *this;
    }

    Pig& operator=(Pig&& other) noexcept {
        name = std::move(other.name);
        weight = std::move(other.weight);
        return *this;
    }

    ~Pig() {}
};

int main() {
    std::string name{"zhu"};
    std::cout << name << std::endl;
    return 0;
}