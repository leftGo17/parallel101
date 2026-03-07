#include <algorithm>
#include <iostream>
#include <string>
#include <utility>  // 包含 std::move 和 std::forward

class BigData {
public:
    std::string name;
    size_t size;
    int* data;

    // 1. 基本构造函数
    BigData(std::string n, size_t s) : name(n), size(s) {
        data = new int[size];
        std::cout << "  [构造] " << name << " 分配了内存\n";
    }

    // 2. 析构函数
    ~BigData() {
        if (data) {
            delete[] data;
            std::cout << "  [析构] " << name << " 释放了内存\n";
        } else {
            std::cout << "  [析构] " << name << " 为空，无需释放\n";
        }
    }

    // 3. 拷贝构造函数 (C++98) - 执行深拷贝
    BigData(const BigData& other)
        : name(other.name + "_copy"), size(other.size) {
        data = new int[size];
        std::copy(other.data, other.data + size, data);
        std::cout << "  [拷贝构造] 从 " << other.name << " 深拷贝\n";
    }

    // 4. 移动构造函数 (C++11) - 执行资源窃取
    // 知识点：这里的 other 虽然是右值引用类型，但在函数内部它是左值，所以必须
    // move(other.name)
    BigData(BigData&& other) noexcept
        : name(std::move(other.name)), size(other.size), data(other.data) {
        other.data =
            nullptr;  // 关键：断开原对象的指针，防止原对象析构时删掉这块内存
        other.size = 0;
        std::cout << "  [移动构造] 从 " << name << " 窃取了资源\n";
    }
};

// 5. 万能引用包装器 (Universal Reference)
// 知识点：T&& 配合模板推导，既能接左值也能接右值
template <typename T>
void logAndRelay(T&& arg) {
    std::cout << "\n>>> 包装器接收参数，准备转发..." << std::endl;

    // 知识点：完美转发。如果 arg 原本是右值，forward 把它转回右值；
    // 如果不加 forward，arg 在这里永远是左值，会触发上面的【拷贝构造】
    BigData target(std::forward<T>(arg));

    std::cout << ">>> 转发完成,target 对象已创建完毕。\n" << std::endl;
}

// ---------------------------------------------------------

int main() {
    std::cout << "--- 实验 1: 传递左值 ---" << std::endl;
    BigData lval("左值A", 100);
    logAndRelay(lval);  // 传入左值，T 被推导为 BigData&，forward 转发为左值引用
                        // -> 触发【拷贝构造】

    std::cout << "\n--- 实验 2: 传递右值 (临时对象) ---" << std::endl;
    logAndRelay(
        BigData("右值B", 200));  // 传入右值，T 被推导为 BigData，forward
                                 // 转发为右值引用 -> 触发【移动构造】

    std::cout << "\n--- 实验 3: 手动 move 左值 ---" << std::endl;
    BigData lval2("左值C", 300);
    logAndRelay(std::move(lval2));  // 强制转为右值 -> 触发【移动构造】

    std::cout << "\n--- 主函数结束 ---" << std::endl;
    return 0;
}