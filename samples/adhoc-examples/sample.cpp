#include <iostream>
#include <string>

int main() {
  std::string cars[4] = {"Volvo", "BMW", "Ford", "Mazda"};
  for(int i = 0; i < 4; i++) {
    std::cout << cars[i] << "\n";
  }
  return 0;
}

