#include <cstddef>
#include <iostream>

// template <int N = 1, class T>
// void show_times(T msg) {
//     for (int i = 0; i < N; i++) {
//         std::cout << msg << std::endl;
//     }
// }

template <int N = 1, typename T>
void show_times(T t) {
    for (size_t i = 0; i < N; i++) {
        std::cout << t << " ";
    }
    std::cout << std::endl;
}

int main() {
    show_times("one");
    show_times<3>(42);
    show_times<4>('%');
}
