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

  void edit_side_precent(char side, int precent)
  {
    int value = 0;
    switch (side)
    {
    case 'a':
      value = (a / 100) * precent;
      a = precent > 0 ? a + value : a - value;
      break;
    case 'b':
      value = (b / 100) * precent;
      b = precent > 0 ? b + value : b - value;
      break;
    case 'c':
      value = (c / 100) * precent;
      c = precent > 0 ? c + value : c - value;
      break;
    default:
      cout << "Side \"" << side << "\" not found" << endl;
      break;
    }
  }
};
