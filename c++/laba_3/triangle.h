#include <iostream>
#include <string>
using namespace std;

class Triangle
{
private:
  int A, B, C;

public:
  int get_A() { return A; }
  void set_A(int side_A) { A = side_A; }

  int get_B() { return B; }
  void set_B(int side_B) { B = side_B; }

  int get_C() { return C; }
  void set_C(int side_C) { C = side_C; }

  void edit_side_precent(char side, int precent)
  {
    int value = 0;
    switch (side)
    {
    case 'a':
      value = (A / 100) * precent;
      A = precent > 0 ? A + value : A - value;
      break;
    case 'b':
      value = (B / 100) * precent;
      B = precent > 0 ? B + value : B - value;
      break;
    case 'c':
      value = (C / 100) * precent;
      C = precent > 0 ? C + value : C - value;
      break;
    default:
      cout << "Side \"" << side << "\" not found" << endl;
      break;
    }
  }

  bool is_valid()
  {
    return A > 0 && B > 0 && C > 0;
  }

  void check_type_triangle()
  {
    if (C * C > (A * A + B * B))
    {
      // Треугольник тупоугольный.
      cout << "The triangle is obtuse.\n";
    }

    if (C * C == (A * A + B * B))
    {
      // Треугольник прямоугольный.
      cout << "The triangle is rectangular.\n";
    }

    if (C * C < (A * A + B * B))
    {
      // Треугольник остроугольный.
      cout << "The triangle is acute-angled.\n";
    }
  }

  void middle_line()
  {
    int ml_A, ml_B, ml_C;
    ml_A = A / 2;
    ml_B = B / 2;
    ml_C = C / 2;

    cout << "Middle Line A: " << ml_A << endl;
    cout << "Middle Line B: " << ml_B << endl;
    cout << "Middle Line C: " << ml_C << endl;
  }
};
