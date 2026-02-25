#include <functional>
#include <iostream>
#include <map>
#include <string>
#include <utility>
#include <vector>

namespace test0 {
// 1. 体现“解耦”：API 只需要知道签名，不需要知道具体的闭包类型
class TaskManager {
  private:
    // 关键点：std::function 允许存储“类型不同但签名相同”的可调用对象
    // 如果没有 std::function，由于每个 Lambda 类型都不同，你无法创建这个 map
    std::map<std::string, std::function<int(int)>> _task_map;

  public:
    void register_task(std::string name, std::function<int(int)> task) {
        _task_map[name] = std::move(task);
    }

    void execute_all(int input) {
        for (auto const& [name, func] : _task_map) {
            std::cout << "执行任务 [" << name << "] 结果: " << func(input)
                      << std::endl;
        }
    }
};

int main() {
    TaskManager manager;

    std::vector v = {1, 2, 3};

    // 2. 体现“多态性”：存入捕获不同变量、逻辑完全不同的 Lambda
    int factor = 10;
    manager.register_task("muliple", [=](int n) { return n * factor; });

    int base = 100;
    manager.register_task("addition", [=](int n) { return n + base; });

    // 3. 甚至存入普通函数
    manager.register_task("suquare", [](int n) { return n * n; });

    manager.execute_all(5);

    // 4. 查看大小：std::function 的固定大小体现了其“容器”本质
    std::function<int(int)> f = [](int x) { return x; };
    std::cout << "---" << std::endl;
    std::cout << "std::function 容器大小 (固定): " << sizeof(f) << " bytes"
              << std::endl;

    return 0;
}
}  // namespace test0

namespace test1 {
void test1(std::vector<int>&& v) {};

void test2(std::function<int(int)>&& f) {};

int main() {
    int&& x = 1;
    x = 10;
    int& y = x;
    y = 20;
    const int& z = y;
    // z = 10;
    // int & const m = z;
    const int& m = 10;
    // int& n = 10;

    test1({1, 2, 3});
    test2([](int n) { return n; });
    return 0;
}

}  // namespace test1

namespace test2 {

struct obj {
    int n;
    obj(int n) { std::cout << "obj()" << std::endl; }

    ~obj() { std::cout << "~obj()" << std::endl; }

    obj(const obj& other) { std::cout << "obj(const obj&)" << std::endl; }

    obj& operator=(const obj& other) {
        std::cout << "obj & operator=(const obj& other)" << std::endl;
        return *this;
    }

    obj(obj&& other) { std::cout << "obj(obj &&other)" << std::endl; }

    obj& operator=(obj&& other) {
        std::cout << "obj&operator=(obj && other)" << std::endl;
        return *this;
    }
};

int main() {
    obj&& a = 10;
    obj b = 10;

    std::cout << "-------------" << std::endl;

    const obj& d = 10;
    obj e = std::move(d);

    std::cout << "---------------" << std::endl;

    obj f = 10;
    obj g = std::move(f);

    return 0;
}

}  // namespace test2

int main() {
    test0::main();
    test2::main();
    return 0;
}