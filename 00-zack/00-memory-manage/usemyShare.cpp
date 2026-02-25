#include <fmt/core.h>
#include <fmt/ranges.h>

#include <utility>
#include <vector>

#include "myShareptr.h"
#include "student.h"

int main() {
    std::vector<int> v{1, 2, 3};
    fmt::print("vector: {}\n", v);
    SimpleSharePtr<student> p(new student(18, "li"));
    fmt::print("p use{}\n", p.use_count());

    SimpleSharePtr<student> p1 = p;
    fmt::print("p1 use{}\n", p1.use_count());

    SimpleSharePtr<student> p2 = std::move(p1);
    // fmt::print("p1 use{}\n", p1.use_count());
    fmt::print("p2 use{}\n", p2.use_count());
    return 0;
}