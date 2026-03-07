#include <fmt/core.h>
#include <fmt/ranges.h>

#include <vector>

int main() {
    fmt::print("Hello world\n");
    fmt::print("Name: {}\nAge: {}\n", "L", 18);

    std::vector<int> v{1, 2, 3};
    fmt::print("Vector {}\n", v);
    return 0;
}
