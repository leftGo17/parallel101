#include <iostream>
#include <new>
#include <vector>

// 全局计数器
size_t current_usage = 0;
size_t max_usage = 0;

// 重写全局 new 以监控内存
void* operator new(size_t size) {
    current_usage += size;
    if (current_usage > max_usage) max_usage = current_usage;
    void* p = malloc(size);
    if (!p) throw std::bad_alloc();
    return p;
}

void operator delete(void* p, size_t size) noexcept {
    current_usage -= size;
    free(p);
}

struct HugeObject {
    static const size_t Chunk = 100 * 1024 * 1024;  // 100MB
    char* data;
    HugeObject() { data = new char[Chunk]; }
    ~HugeObject() {
        if (data) delete[] data;
    }

    // 移动构造：关键在于这个时刻
    HugeObject(HugeObject&& other) noexcept : data(other.data) {
        other.data = nullptr;
    }
    // 禁用拷贝
    HugeObject(const HugeObject&) = delete;
};

int main() {
    {
        std::vector<HugeObject> v;
        v.reserve(1);  // 预留 1 个位置，排除扩容干扰

        std::cout << "--- 测试 push_back ---" << std::endl;
        max_usage = 0;
        current_usage = 0;

        // 这一行会产生瞬时峰值
        v.push_back(HugeObject());

        std::cout << "Push_back 峰值内存: " << max_usage / 1024 / 1024 << " MB"
                  << std::endl;
    }

    {
        std::vector<HugeObject> v;
        v.reserve(1);

        std::cout << "\n--- 测试 emplace_back ---" << std::endl;
        max_usage = 0;
        current_usage = 0;

        v.emplace_back();

        std::cout << "Emplace_back 峰值内存: " << max_usage / 1024 / 1024
                  << " MB" << std::endl;
    }
    return 0;
}