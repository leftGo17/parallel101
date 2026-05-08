#include <cuda_runtime.h>
#include <iostream>

int main() {
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    if (deviceCount == 0) return 1;
    
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    
    std::cout << "GPU Name: " << prop.name << std::endl;
    std::cout << "SM Count: " << prop.multiProcessorCount << std::endl;
    std::cout << "Clock Rate (KHz): " << prop.clockRate << std::endl;
    std::cout << "Compute Capability: " << prop.major << "." << prop.minor << std::endl;
    
    return 0;
}
