#include <fmt/core.h>

#include <memory>

int main() {
    fmt::print("hello\n");

    auto sp = std::make_shared<int>(1);
    std::weak_ptr<int> wp = sp;

    if (auto locked = wp.lock()) {
        fmt::print("value:{}\n", *locked);
    }

    sp.reset();

    if (auto locked = wp.lock()) {
    } else {
        fmt::print("no value\n");
    }

    return 0;
}