#pragma once

#include <iostream>
#include <string>
class student {
  public:
    int age{18};
    std::string name{"zhangsan"};

    student(int age, std::string name) : age(age), name(name) {
        std::cout << "Student Constructor " << *this << std::endl;
    }

    ~student() { std::cout << "Student Destructor " << *this << std::endl; }

    void show() { std::cout << *this << std::endl; }

    friend std::ostream& operator<<(std::ostream& os, const student& stu);
};

inline std::ostream& operator<<(std::ostream& os, const student& stu) {
    os << stu.name << stu.age << std::endl;
    return os;
}
