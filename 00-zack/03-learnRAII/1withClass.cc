#include <iostream>

struct myInt {
    int *p;
    myInt(int x) { p = new int(x); }
    ~myInt() { delete p; }
};

int main() {
    myInt a(10);
    std::cout << *a.p << std::endl;

    return 0;
}
