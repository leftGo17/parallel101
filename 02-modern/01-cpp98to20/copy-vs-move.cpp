#include <algorithm>  // for std::copy
#include <chrono>     // 用于计时
#include <iostream>

using namespace std;

class BigMemory {
private:
    int* data;
    size_t size;

public:
    // 构造函数：申请一大片内存
    BigMemory(size_t s) : size(s) {
        data = new int[size];
        for (size_t i = 0; i < size; ++i) {
            data[i] = i;  // 填点数据
        }
    }

    // 析构函数
    ~BigMemory() {
        if (data) delete[] data;
    }

    // ==========================================
    // 1. 拷贝构造函数 (慢)
    // ==========================================
    BigMemory(const BigMemory& other) : size(other.size) {
        // 【关键耗时点】
        // 1. 重新申请一块全新的内存
        data = new int[size];

        // 2. 把对面所有的数据一个一个抄过来 (O(N))
        std::copy(other.data, other.data + size, data);

        // cout << "执行了拷贝构造 (Deep Copy)" << endl;
    }

    // ==========================================
    // 2. 移动构造函数 (快)
    // ==========================================
    BigMemory(BigMemory&& other) noexcept : size(other.size), data(other.data) {
        // 【关键省时点】
        // 1. 直接偷走对方的指针 (data 指向旧内存)
        // 2. 不需要申请新内存，也不需要复制数据

        // 3. 把对方的指针置空，防止他析构时把内存释放了
        other.data = nullptr;
        other.size = 0;

        // cout << "执行了移动构造 (Move)" << endl;
    }
};

// 计时器辅助函数
template <typename Func>
void measureTime(const string& name, Func func) {
    auto start = chrono::high_resolution_clock::now();
    func();
    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double, milli> diff = end - start;
    cout << name << " 耗时: " << diff.count() << " ms" << endl;
}

int main() {
    // 创建一个包含 1亿 个整数的对象 (约 380MB)
    cout << "正在初始化 1亿 个整数..." << endl;
    BigMemory source(100000000);

    cout << "\n--- 开始测试 ---\n" << endl;

    // 测试 1: 拷贝
    measureTime("拷贝构造 (Copy)", [&]() {
        BigMemory target = source;  // 调用 Copy Constructor
    });

    // 测试 2: 移动
    measureTime("移动构造 (Move)", [&]() {
        BigMemory target = std::move(source);  // 调用 Move Constructor
    });

    return 0;
}