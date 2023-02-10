#include <iostream>
#include <string>
using namespace std;

class Fraction
{
public:
    double x, y;
    Fraction(double in_x, double in_y)
    {
        x = in_x;
        y = in_y;
    }

    ~Fraction()
    {
        cout << "Object deleted.\n";
    }

    void prdouble_fraction()
    {
        cout << x << "/" << y << endl;
    }

    Fraction operator+(const Fraction &other)
    {
        Fraction temp(0, 0);
        temp.x = this->x + other.x;
        temp.y = this->y + other.y;
        return temp;
    }

    Fraction operator/(const Fraction &other)
    {
        Fraction temp(0, 0);
        temp.x = this->x / other.x;
        temp.y = this->y / other.y;
        return temp;
    }

    Fraction operator*(const Fraction &other)
    {
        Fraction temp(0, 0);
        temp.x = this->x * other.x;
        temp.y = this->y * other.y;
        return temp;
    }

    Fraction operator-(const Fraction &other)
    {
        Fraction temp(0, 0);
        temp.x = this->x - other.x;
        temp.y = this->y - other.y;
        return temp;
    }

    void reduction()
    {
        int divisor = 2;
        int copy_x = x;
        int copy_y = y;
        while (true)
        {
            if (copy_x % divisor == 0 && copy_y % divisor == 0)
            {
                copy_x /= divisor;
                copy_y /= divisor;
                break;
            }
            else
            {
                divisor++;
            }
        }

        if (copy_x != x)
        {
            cout << copy_x << "/" << copy_y << endl;
            x = copy_x;
            y = copy_y;
        }
        else
        {
            cout << "Fraction cannot be shortened." << endl;
        }
    }

    void print()
    {
        cout << "x: " << this->x << "\ny: " << this->y << endl;
    }
};
