#include <iostream>
#include <string>
#include "triangle.h"
using namespace std;

int input_value(string side)
{
  int value;

  do
  {
    cout << side; cin >> value;
    if (value <= 0)
      cout << "Invalid value. Value maste be > 0.\n";
  } while (value <= 0);

  return value;
}

int main()
{
  cout << "\t\t\t\t *** Triangle *** " << endl;
  Triangle triangle;

  triangle.set_a(input_value("A = "));
  triangle.set_b(input_value("B = "));
  triangle.set_c(input_value("C = "));

  return 0;
}
