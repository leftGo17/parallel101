#include <future>
#include <iostream>
#include <string>
#include <thread>

int download(std::string file) {
    for (int i = 0; i < 10; i++) {
        std::cout << "Downloading " << file << " (" << i * 10 << "%)..."
                  << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(400));
    }
    std::cout << "Download complete: " << file << std::endl;
    return 404;
}

void interact() {
    std::string name;
    std::cin >> name;
    std::cout << "Hi, " << name << std::endl;
}

int main() {
    std::promise<int> pret;
    std::future<int> fret = pret.get_future();
    std::thread t1([&] {
        auto ret = download("hello.zip");
        pret.set_value(ret);
    });

    interact();
    int ret = fret.get();
    std::cout << "Download result: " << ret << std::endl;

    t1.join();
    return 0;
}
