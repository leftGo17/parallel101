#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;

    int* a = new int(10);
    std::cout << *a << std::endl;
    delete a;

    return 0;
}