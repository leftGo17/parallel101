#include <iostream>
#include <string>
#include <utility>  // for std::move

using namespace std;

// ==========================================
// 类 A: 装备齐全 (有拷贝，也有移动)
// ==========================================
class ClassWithMove {
public:
    string name;

    ClassWithMove(string n) : name(n) {}

    // 1. 拷贝构造函数 (接收 const引用)
    ClassWithMove(const ClassWithMove& other) {
        cout << "  [A] 调用了 拷贝构造 (Copy) -> 深拷贝，慢！" << endl;
    }

    // 2. 移动构造函数 (接收 右值引用)
    ClassWithMove(ClassWithMove&& other) {
        cout << "  [A] 调用了 移动构造 (Move) -> 偷资源，快！" << endl;
    }
};

// ==========================================
// 类 B: 残缺不全 (只有拷贝，没有移动)
// ==========================================
class ClassNoMove {
public:
    string name;

    ClassNoMove(string n) : name(n) {}

    // 1. 只有拷贝构造函数
    // 注意：它的参数是 const ClassNoMove& (万能特权)
    ClassNoMove(const ClassNoMove& other) {
        cout << "  [B] 调用了 拷贝构造 (Copy) -> 没办法，只能拷贝！" << endl;
    }

    // ❌ 没写移动构造函数
    // ClassNoMove(ClassNoMove&& other) ... 不存在的
};

int main() {
    cout << "=== 测试 1: 装备齐全的类 (ClassWithMove) ===" << endl;
    ClassWithMove a1("Object A");
    cout << "正在执行: ClassWithMove a2 = std::move(a1);" << endl;

    // std::move(a1) 产生右值
    // 编译器发现有 ClassWithMove(ClassWithMove&&)，完美匹配！
    ClassWithMove a2 = std::move(a1);

    cout << "\n----------------------------------------\n" << endl;

    cout << "=== 测试 2: 只有拷贝的类 (ClassNoMove) ===" << endl;
    ClassNoMove b1("Object B");
    cout << "正在执行: ClassNoMove b2 = std::move(b1);" << endl;

    // std::move(b1) 产生右值
    // 编译器找 ClassNoMove(ClassNoMove&&) -> 找不到！
    // 编译器退而求其次，找 ClassNoMove(const ClassNoMove&) -> 找到了！
    // 利用 const引用 可以绑定右值的特权，执行拷贝。
    ClassNoMove b2 = std::move(b1);

    return 0;
}