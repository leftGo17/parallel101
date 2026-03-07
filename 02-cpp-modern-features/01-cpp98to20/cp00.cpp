#include <cstddef>
#include <cstdio>
#include <cstdlib>

int main() {
    size_t nv = 4;
    int *v = (int *)malloc(nv * sizeof(int));
    v[0] = 1;
    v[1] = 2;
    v[2] = 3;
    v[3] = 4;

    int sum = 0;
    for (size_t i = 0; i < nv; i++) sum += v[i];
    printf("%d\n", sum);
    free(v);
    return 0;
}