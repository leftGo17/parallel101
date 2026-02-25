#include <cstdio>

void print_number(int n) { printf("Number %d\n", n); }

using mytype = void (*)(int);
void call_twice(mytype func) {
    func(0);
    func(1);
}

int main() {
    call_twice(print_number);
    return 0;
}
