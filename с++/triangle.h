#include <iostream>
#include <string>
using namespace std;

class Triangle
{
private:
  int a, b, c;

public:
  void set_a(int side_a)
  {
    a = side_a;
  }

  void set_b(int side_b)
  {
    b = side_b;
  }

  void set_c(int side_c)
  {
    c = side_c;
  }
};
