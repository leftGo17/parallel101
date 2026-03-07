#include <iostream>

class NonMoveable {
public:
    NonMoveable(int x) { std::cout << "Constructor" << std::endl; }

    // copy
    NonMoveable(const NonMoveable&) = delete;
    NonMoveable(NonMoveable&&) = delete;
};

NonMoveable create() { return NonMoveable(42); }

int main() {
    NonMoveable x = create();
    return 0;
}