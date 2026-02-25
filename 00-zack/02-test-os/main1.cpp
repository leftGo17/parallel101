#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

#include <iostream>

int main() {
    const char* filename = "test_data.bin";
    size_t size = 100 * 1024 * 1024;  // 100MB

    // 1. 创建一个 100MB 的大文件
    int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);
    lseek(fd, size - 1, SEEK_SET);
    write(fd, "", 1);

    // 2. 将文件映射到内存
    void* addr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

    // 3. 关键：告诉内核释放该区域的缓存，强制下次访问时从磁盘读取
    // MADV_DONTNEED 会解除物理内存映射
    posix_fadvise(fd, 0, size, POSIX_FADV_DONTNEED);
    madvise(addr, size, MADV_DONTNEED);

    std::cout << "准备访问内存，触发 Major Page Fault..." << std::endl;
    sleep(1);

    // 4. 访问内存：由于我们之前清理了缓存，这里会触发 Major Fault
    unsigned char* ptr = static_cast<unsigned char*>(addr);
    long long sum = 0;
    for (size_t i = 0; i < size; i += 4096) {  // 每隔一个 Page 访问一次
        sum += ptr[i];
    }

    std::cout << "访问完成Sum: " << sum << std::endl;

    // 清理
    munmap(addr, size);
    close(fd);
    unlink(filename);

    return 0;
}