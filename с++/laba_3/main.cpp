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

void commands()
{
  string commands[] = {
    "(1) increase/decrease the size of the sides by a specified number of percent;",
    "(2) calculation of the middle line for any of the sides;",
    "(3) determination of the type of triangle by the magnitude of the angles (Sharp-angled. Obtuse, Rectangular)",
    "(4) determination of the value of angles"
  };

  for (int i = 0; i < int(sizeof(commands) / sizeof(*commands)); i++)
    cout << commands[i] << endl;
  
}

int main()
{
  cout << "\t\t\t\t *** Triangle ***" << endl;
  Triangle triangle;

  triangle.set_a(input_value("A = "));
  triangle.set_b(input_value("B = "));
  triangle.set_c(input_value("C = "));

  commands();
  
  return 0;
}



  /** 
  string command_1 = "(1) increase/decrease the size of the sides by a specified number of percent;";
  string command_2 = "(2) calculation of the middle line for any of the sides;";
  string command_3 = "(3) determination of the type of triangle by the magnitude of the angles (Sharp-angled. Obtuse, Rectangular)";
  string command_4 = "(4) determination of the value of angles";
  */
