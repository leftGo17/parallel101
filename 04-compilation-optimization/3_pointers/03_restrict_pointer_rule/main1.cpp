void func(int *a, int *b, int *__restrict c) {
    *c = *a;
    *c = *b;
}
