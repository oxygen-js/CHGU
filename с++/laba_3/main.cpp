#include <iostream>
#include <string>
#include "triangle.h"
using namespace std;


bool check_value(int value)
{
  if (value <= 0) {
    cout << "Ошибка. Значение должно быть > 0.";
    return false;
  } 

  return true;
}

int main()
{
  setlocale(LC_ALL, "RUS");
  cout << "\t\t\t\t *** Треугольник ***" << endl;

  int side_A, side_B, side_C;
  Triangle triangle;

  cout << "A: "; cin >> side_A;
  if (check_value(side_A)) {
    triangle.set_A(side_A);
  } else {
    return 1;
  }

  cout << "B: "; cin >> side_B;
  if (check_value(side_B)) {
    triangle.set_A(side_B);
  } else {
    return 1;
  }

  cout << "C: "; cin >> side_C;
  if (check_value(side_C)) {
    triangle.set_C(side_C);
  } else {
    return 1;
  }

  triangle.check_type_triangle();
  triangle.middle_line();
  
  return 0;
}
