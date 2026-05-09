#include <iostream>
#include <mutex>
#include <thread>
#include <vector>

class MTVector {
    std::vector<int> m_arr;
    std::mutex m_mtx;

  public:
    class Getlock {
        MTVector &m_that;
        std::unique_lock<std::mutex> m_guard;

      public:
        Getlock(MTVector &that) : m_that(that), m_guard(that.m_mtx) {}

        void push_back(int val) const { return m_that.m_arr.push_back(val); }

        size_t size() const { return m_that.m_arr.size(); }
    };

    Getlock getlock() { return Getlock{*this}; }
};

class ThreadPool {
    std::vector<std::thread> m_threads;

  public:
    void add_thread(std::thread t) { m_threads.push_back(std::move(t)); };
    ~ThreadPool() {
        for (auto &t : m_threads) {
            t.join();
        }
    }
};

int main() {
    MTVector arr;
    {
        ThreadPool tp;

        std::thread t1([&]() {
            auto axr = arr.getlock();
            for (int i = 0; i < 1000; i++) {
                axr.push_back(i);
            }
        });
        tp.add_thread(std::move(t1));

        std::thread t2([&]() {
            auto axr = arr.getlock();
            for (int i = 0; i < 1000; i++) {
                axr.push_back(1000 + i);
            }
        });
        tp.add_thread(std::move(t2));
    }
    std::cout << arr.getlock().size() << std::endl;

    return 0;
}
