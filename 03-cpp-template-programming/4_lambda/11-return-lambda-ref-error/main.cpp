#include <iostream>

template <class Func>
void call_twice(Func const &func) {
    std::cout << func(0) << std::endl;
    std::cout << func(1) << std::endl;
    std::cout << "Func 大小: " << sizeof(Func) << std::endl;
}

// 本质上
// __lambda_11_12 make_twice(int fac)
// {

//   class __lambda_11_12
//   {
//     public:
//     inline /*constexpr */ int operator()(int n) const
//     {
//       return n * fac;
//     }

// 注意这里fac是一个引用，引用的是一个临时的变量fac，所以会产生错误

//     private:
//     int & fac;

//     public:
//     __lambda_11_12(int & _fac)
//     : fac{_fac}
//     {}

//   } __lambda_11_12{fac};

//   return __lambda_11_12;
// }

// 本质上就相当于引用了一个右值去创建类
auto make_twice(int fac) {
    return [&](int n) { return n * fac; };
}

int main() {
    auto twice = make_twice(2);
    call_twice(twice);
    return 0;
}
