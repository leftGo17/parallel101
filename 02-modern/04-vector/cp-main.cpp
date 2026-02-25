#include <cstddef>
#include <cstdlib>
#include <iostream>

class vector {
  public:
    size_t m_size;
    int *m_data;

    explicit vector(int n) : m_size(n) {
        m_data = (int *)malloc(n * sizeof(int));
    }

    ~vector() { free(m_data); }

    size_t size() { return m_size; }

    // realloc扩容的方式：后面有内存就直接扩在后面，后面没有在别的地方重新申请，然后执行原有数据的拷贝
    void resize(size_t size) {
        m_size = size;
        m_data = (int *)realloc(m_data, m_size);
    }

    int &operator[](size_t index) { return m_data[index]; }
};

int main() {
    vector v(2);
    v[0] = 4;
    v[1] = 3;

    v.resize(4);
    v[2] = 2;
    v[3] = 1;

    int sum = 0;
    for (size_t i = 0; i < v.size(); i++) {
        sum += v[i];
    }
    std::cout << sum << std::endl;
    return 0;
}