#include <iostream>
#include <string>
#include "fraction.h"
using namespace std;



int main()
{
    Fraction a_b = Fraction(1, 3);
    Fraction c_d = Fraction(1,2);
    Fraction e_f = Fraction(4,1);
    Fraction g_h = Fraction(11,2);
    Fraction k_l = Fraction(1,1);

    Fraction z = ((a_b + c_d) / e_f) * (g_h - k_l);

    z.print();
    z.reduction();
    z.print();
    
}
