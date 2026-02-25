#include <fmt/core.h>

#include <iostream>
#include <string>

#include "fmt/format.h"

int main() {
    // std::string msg = fmt::format("The answer is {}.\n", 42);
    std::string msg = fmt::format("The answer is {}.", 42);
    std::cout << msg << std::endl;
    return 0;
}
