#include <cuda_runtime.h>

#include <cstdio>

__global__ void kernel() { printf("Hello, world!\n"); }

int main() {
    kernel<<<1, 1>>>();
    cudaDeviceSynchronize();
    return 0;
}
