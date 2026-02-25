void add_arrays(int *__restrict a, int *__restrict c) {
    for (int i = 0; i < 100; i++) {
        *c += a[i];
    }
}