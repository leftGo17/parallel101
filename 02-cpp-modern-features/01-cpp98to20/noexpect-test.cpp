#include <iostream>
#include <vector>

using namespace std;

// === 类 A: 移动构造函数【没有】 noexcept ===
class NoNoexcept {
public:
    int data;
    NoNoexcept(int data) : data(data) {
        cout << data << " constructor" << endl;
    }

    // 拷贝构造
    NoNoexcept(const NoNoexcept& other) : data(other.data) {
        cout << data << "  [A] Copy" << endl;
    }

    // 移动构造 (没加 noexcept)
    NoNoexcept(NoNoexcept&& other) : data(other.data) {
        cout << data << "  [A] Move" << endl;
    }
};

// === 类 B: 移动构造函数【加了】 noexcept ===
class WithNoexcept {
public:
    int data;
    WithNoexcept(int data) : data(data) {
        cout << data << " constructor" << endl;
    }

    // 拷贝构造
    WithNoexcept(const WithNoexcept& other) : data(other.data) {
        cout << data << "  [B] Copy" << endl;
    }

    // 移动构造 (加了 noexcept !!!)
    WithNoexcept(WithNoexcept&& other) noexcept : data(other.data) {
        cout << data << "  [B] Move" << endl;
    }
};

int main() {
    cout << "--- 测试 A: 没有 noexcept ---" << endl;
    vector<NoNoexcept> vecA;
    cout << vecA.capacity() << endl;
    vecA.push_back(NoNoexcept(1));  // 放入第1个
    cout << vecA.capacity() << endl;
    cout << "push 2:" << endl;
    vecA.push_back(NoNoexcept(2));
    cout << vecA.capacity() << endl;
    cout << "push 3:" << endl;
    vecA.push_back(NoNoexcept(3));
    cout << vecA.capacity() << endl;

    cout << "\n--- 测试 B: 有 noexcept ---" << endl;
    vector<WithNoexcept> vecB;
    vecB.push_back(WithNoexcept(1));  // 放入第1个
    cout << "push 2:" << endl;
    vecB.push_back(WithNoexcept(2));
    cout << "push 3:" << endl;
    vecB.push_back(WithNoexcept(3));
    return 0;
}