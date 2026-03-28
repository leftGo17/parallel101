#include <cuda_fp16.h>
#include <cuda_runtime.h>
#include <mma.h>

#include <iostream>

using namespace nvcuda;

// 定义 Tensor Core 运算的维度 (必须是硬件支持的固定尺寸，如 16x16x16)
const size_t WMMA_M = 16;
const size_t WMMA_N = 16;
const size_t WMMA_K = 16;

__global__ void wmma_ker(half *a, half *b, float *c, float *d) {
    // 声明片段 (Fragments) - 这是 Tensor Core 运算的寄存器抽象
    wmma::fragment<wmma::matrix_a, WMMA_M, WMMA_N, WMMA_K, half,
                   wmma::row_major>
        a_frag;
    wmma::fragment<wmma::matrix_b, WMMA_M, WMMA_N, WMMA_K, half,
                   wmma::col_major>
        b_frag;
    wmma::fragment<wmma::accumulator, WMMA_M, WMMA_N, WMMA_K, float> c_frag;
    wmma::fragment<wmma::accumulator, WMMA_M, WMMA_N, WMMA_K, float> d_frag;

    // 初始化累计器片段为 0
    wmma::fill_fragment(c_frag, 0.0f);

    // 从全局内存加载数据到片段
    // 这里简单演示一个 16x16 的块运算
    wmma::load_matrix_sync(a_frag, a, WMMA_K);
    wmma::load_matrix_sync(b_frag, b, WMMA_K);
    wmma::load_matrix_sync(c_frag, c, WMMA_N, wmma::mem_row_major);

    // 核心步骤：调用 Tensor Core 进行矩阵乘加运算
    wmma::mma_sync(d_frag, a_frag, b_frag, c_frag);

    // 将结果存回全局内存
    wmma::store_matrix_sync(d, d_frag, WMMA_N, wmma::mem_row_major);
}

int main() {
    size_t size_abc = WMMA_M * WMMA_K * sizeof(half);
    size_t size_d = WMMA_M * WMMA_N * sizeof(float);

    half *h_a, *h_b, *d_a, *d_b;
    float *h_c, *h_d, *d_c, *d_d;

    // 分配内存
    h_a = (half *)malloc(size_abc);
    h_b = (half *)malloc(size_abc);
    h_c = (float *)malloc(size_d);
    h_d = (float *)malloc(size_d);

    cudaMalloc(&d_a, size_abc);
    cudaMalloc(&d_b, size_abc);
    cudaMalloc(&d_c, size_d);
    cudaMalloc(&d_d, size_d);

    // 初始化数据：A 和 B 全设为 1.0 (FP16)
    for (int i = 0; i < WMMA_M * WMMA_K; i++) {
        h_a[i] = __float2half(1.0f);
        h_b[i] = __float2half(1.0f);
    }
    for (int i = 0; i < WMMA_M * WMMA_N; i++) h_c[i] = 0.0f;

    cudaMemcpy(d_a, h_a, size_abc, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, size_abc, cudaMemcpyHostToDevice);
    cudaMemcpy(d_c, h_c, size_d, cudaMemcpyHostToDevice);

    // 启动内核：1个 Warp (32线程) 即可完成一个 16x16x16 的 Tensor Core 任务
    wmma_ker<<<1, 32>>>(d_a, d_b, d_c, d_d);

    cudaMemcpy(h_d, d_d, size_d, cudaMemcpyDeviceToHost);

    // 验证结果：对于 16x16x16 的全 1 矩阵乘法，结果每个元素应为 16.0
    std::cout << "Tensor Core Result (first element): " << h_d[0] << "\n";
    if (h_d[0] == 16.0f) {
        std::cout << "SUCCESS: Tensor Core is working on your RTX 5070!"
                  << "\n";
    } else {
        std::cout << "FAILURE: Unexpected result." << "\n";
    }

    // 释放资源
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);
    cudaFree(d_d);
    free(h_a);
    free(h_b);
    free(h_c);
    free(h_d);

    return 0;
}