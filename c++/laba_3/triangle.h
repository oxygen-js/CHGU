#include <iostream>
#include <string>
using namespace std;

class Triangle
{
private:
  double A, B, C;

public:
  double get_A() { return A; }
  void set_A(double side_A) { A = side_A; }

  double get_B() { return B; }
  void set_B(double side_B) { B = side_B; }

  double get_C() { return C; }
  void set_C(double side_C) { C = side_C; }

  bool is_valid()
  {
    return A > 0 && B > 0 && C > 0;
  }

  void edit_side_precent(double precent)
  {
    double pr_A, pr_B, pr_C;
    pr_A = (A / 100) * precent;
    pr_B = (B / 100) * precent;
    pr_C = (C / 100) * precent;

    if (precent > 0)
    {
      A += pr_A;
      B += pr_B;
      C += pr_C;
    }
    else
    {
      A -= pr_A;
      B -= pr_B;
      C -= pr_C;
    }

    cout << "A: " << A << endl;
    cout << "B: " << B << endl;
    cout << "C: " << C << endl;
  }

  void check_type_triangle();

  void middle_line()
  {
    double ml_A, ml_B, ml_C;
    ml_A = A / 2;
    ml_B = B / 2;
    ml_C = C / 2;

    cout << "Middle Line A: " << ml_A << endl;
    cout << "Middle Line B: " << ml_B << endl;
    cout << "Middle Line C: " << ml_C << endl;
  }
};
