#include <iostream>
#include <string>

class Pig {
  public:
    std::string name{};
    int weight{};

    Pig() : name("peiqi"), weight(80) {};
};

int main() {
    Pig pig{};

    std::cout << pig.name << " " << pig.weight << std::endl;

    return 0;
}