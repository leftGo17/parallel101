#include <cuda_runtime_api.h>
#include <memory>
#include <vector>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <cuda/cmath>

// 1. 定义 CUDA 资源的 RAII 删除器
struct CudaDeleter {
    void operator()(void* ptr) const {
        if (ptr) {
            cudaFree(ptr);
        }
    }
};

// 2. 使用智能指针别名简化统一内存管理
template <typename T>
using CudaManagedPtr = std::unique_ptr<T[], CudaDeleter>;

// 3. 辅助函数：分配统一内存并返回智能指针
template <typename T>
CudaManagedPtr<T> make_cuda_managed(size_t n) {
    T* ptr = nullptr;
    cudaMallocManaged(&ptr, n * sizeof(T));
    return CudaManagedPtr<T>(ptr);
}

__global__ void vecAdd(float* A, float* B, float* C, int vectorLength) {
    int workIndex = threadIdx.x + blockIdx.x * blockDim.x;
    if (workIndex < vectorLength) {
        C[workIndex] = A[workIndex] + B[workIndex];
    }
}

void initArray(float* A, int length) {
    for (int i = 0; i < length; i++) {
        A[i] = rand() / (float)RAND_MAX;
    }
}

void serialVecAdd(const float* A, const float* B, float* C, int length) {
    for (int i = 0; i < length; i++) {
        C[i] = A[i] + B[i];
    }
}

bool vectorApproximatelyEqual(const float* A, const float* B, int length,
                              float epsilon = 0.00001) {
    for (int i = 0; i < length; i++) {
        if (fabs(A[i] - B[i]) > epsilon) {
            printf("Index %d mismatch: %f != %f\n", i, A[i], B[i]);
            return false;
        }
    }
    return true;
}

void unifiedMemExample(int vectorLength) {
    // 使用 std::vector 管理主机对比内存 (RAII)
    std::vector<float> comparisonResult(vectorLength);

    // 使用自定义智能指针管理统一内存 (RAII)
    auto A = make_cuda_managed<float>(vectorLength);
    auto B = make_cuda_managed<float>(vectorLength);
    auto C = make_cuda_managed<float>(vectorLength);

    // 初始化数据
    initArray(A.get(), vectorLength);
    initArray(B.get(), vectorLength);

    // 计算网格大小
    int threads = 256;
    int blocks = (vectorLength + threads - 1) / threads;
    
    // 启动内核
    vecAdd<<<blocks, threads>>>(A.get(), B.get(), C.get(), vectorLength);
    
    // 同步
    cudaDeviceSynchronize();

    // 串行验证
    serialVecAdd(A.get(), B.get(), comparisonResult.data(), vectorLength);

    if (vectorApproximatelyEqual(C.get(), comparisonResult.data(), vectorLength)) {
        printf("Unified Memory (RAII): CPU and GPU answers match\n");
    } else {
        printf("Unified Memory (RAII): Error - CPU and GPU answers do not match\n");
    }

    // A, B, C 和 comparisonResult 在此处离开作用域时会自动释放内存
}

int main(int argc, char** argv) {
    std::srand(std::time(nullptr));
    int vectorLength = 1024;
    if (argc >= 2) {
        vectorLength = std::atoi(argv[1]);
    }
    unifiedMemExample(vectorLength);
    return 0;
}
