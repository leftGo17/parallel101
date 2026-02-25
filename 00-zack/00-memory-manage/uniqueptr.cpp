#include <memory>

#include "student.h"

int main() {
    std::unique_ptr<student> ptr1 = std::make_unique<student>(18, "z");
    ptr1->show();

    auto ptr2 = std::make_unique<student>(18, "l");
    ptr2->show();

    auto ptr3 = std::move(ptr1);
    ptr3->show();
    ptr1->show();

    ptr3.reset();
    return 0;
}