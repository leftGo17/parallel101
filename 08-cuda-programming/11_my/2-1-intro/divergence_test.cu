#include <cuda_runtime.h>
#include <iostream>
#include <cmath>

// 模拟一些复杂的计算，增加计算密度以放大分歧的影响
__device__ float complex_math(float x, int iterations) {
    for (int i = 0; i < iterations; i++) {
        x = cosf(x) + sinf(x);
    }
    return x;
}

// 1. 无分歧核函数：所有线程走同样的路径
__global__ void coherent_kernel(float *out, int n, int iters) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        out[idx] = complex_math(out[idx], iters);
    }
}

// 2. 有分歧核函数：相邻线程走不同的路径
__global__ void divergent_kernel(float *out, int n, int iters) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {
        // Warp Divergence! 同一个 Warp 内部会串行执行两个分支
        if (idx % 2 == 0) {
            out[idx] = complex_math(out[idx], iters);
        } else {
            out[idx] = complex_math(out[idx], iters); // 执行同样的逻辑，但因为在分支里，依然会分歧
        }
    }
}

void check_time(void (*kernel)(float*, int, int), float* d_out, int n, int iters, const char* name) {
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    cudaEventRecord(start);
    kernel<<< (n + 255) / 256, 256 >>>(d_out, n, iters);
    cudaEventRecord(stop);

    cudaEventSynchronize(stop);
    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, stop);
    
    std::cout << name << " 耗时: " << milliseconds << " ms" << std::endl;

    cudaEventDestroy(start);
    cudaEventDestroy(stop);
}

int main() {
    int n = 1 << 20; // 100万个数据
    int iters = 500;
    float *d_out;
    cudaMalloc(&d_out, n * sizeof(float));

    std::cout << "数据规模: " << n << ", 循环次数: " << iters << std::endl;

    // 预热 GPU
    coherent_kernel<<< (n + 255) / 256, 256 >>>(d_out, n, iters);
    cudaDeviceSynchronize();

    check_time(coherent_kernel, d_out, n, iters, "Coherent (无分歧)");
    check_time(divergent_kernel, d_out, n, iters, "Divergent (有分歧)");

    cudaFree(d_out);
    return 0;
}
