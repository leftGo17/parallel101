#include <fmt/core.h>

#include <memory>
class B;
class A {
  public:
    std::shared_ptr<B> ptr_b;
    A() { fmt::print("A()\n"); }
    ~A() { fmt::print("~A()\n"); }
};

class B {
  public:
    std::shared_ptr<A> ptr_a;
    B() { fmt::print("B()\n"); }
    ~B() { fmt::print("~B()\n"); }
};

int main() {
    {
        // auto a = std::make_shared<A>();
        // auto b = std::make_shared<B>();
        // a->ptr_b = b;
        // b->ptr_a = a;
        // A a;
        // B b;
        // a.ptr_b = b;
        // b.ptr_a = a;
    }
    return 0;
}