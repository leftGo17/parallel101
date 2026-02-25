// #include <iostream>

// template <class T>
// T twice(T t) {
//     return t * 2;
// }

// int main(){
//     std::cout << twice<int>(21) << std::endl;
//     std::cout << twice<float>(3.14f) << std::endl;
//     std::cout << twice<double>(2.718) << std::endl;
// }

#include <iostream>

template <typename T>
T twice(T t) {
    return t * 2;
}

int main() {
    std::cout << twice(1) << std::endl;
    std::cout << twice(1.1f) << std::endl;
    std::cout << twice(1.1) << std::endl;
    return 0;
}
