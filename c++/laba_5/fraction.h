#include <iostream>
#include <string>
#include <math.h>
using namespace std;

class Square
{
public:
    double area(double x)
    {
        return x * x;
    }
};

class Side : public Square
{
public:
    double x;
    Side(double side)
    {
        x = side;
    }

    double perimeter()
    {
        return 4 * x;
    }

    double diagonal()
    {
        return sqrt(x * x * 2);
    }
};

class Piramida : public Square
{
public:
    double H, a;

    Piramida(double in_H, double in_a)
    {
        H = in_H;
        a = in_a;
    }

    double area()
    {
        return 3 / 2 * (a * H);
    }

    double area(double in_a, double in_H)
    {
        return 3 / 2 * (in_a * in_H);
    }

    double amount(double in_H, double in_a)
    {
        return (H * a) / (4 * sqrt(3));
    }
};
