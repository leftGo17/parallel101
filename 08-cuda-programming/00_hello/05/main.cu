#include <cstdio>
#include <cuda_runtime.h>

__global__ void kernel() {
    printf("Hello, world from GPU!\n");
}

int main() {
    kernel<<<3, 1>>>();
    
    // 获取最后一个错误
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
    }

    // 同步
    err = cudaDeviceSynchronize();
    if (err != cudaSuccess) {
        printf("Sync Error: %s\n", cudaGetErrorString(err));
    }

    printf("Hello, world from CPU!\n");
    return 0;
}