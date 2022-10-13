#include <iostream>
#include <string>
using namespace std;

class Fraction
{
public:
    int x, y;
    Fraction(int in_x, int in_y)
    {
        x = in_x;
        y = in_y;
    }

    ~Fraction()
    {
        cout << "Object deleted.\n";
    }

    void print_fraction()
    {
        cout << x << "/" << y << endl;
    }

    void reduction()
    {
        int divisor = 2;
        int copy_x = x;
        int copy_y = y;
        while (true)
        {
            if (copy_x % divisor == 0 && copy_x % divisor == 0)
            {
                copy_x /= divisor;
                copy_x /= divisor;
                break;
            }
            else
            {
                divisor++;
            }
        }

        if (copy_x != x)
        {
            print_fraction();
        }
        else
        {
            cout << "Fraction cannot be shortened." << endl;
        }
    }
};
