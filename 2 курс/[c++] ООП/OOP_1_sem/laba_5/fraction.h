#include <iostream>
#include <string>
#include <math.h>
using namespace std;

class Square
{
public:
    double x;
    Square()
    {
        x = 0;
    }
    Square(double side)
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

    double area()
    {
        return x * x;
    }

    void prtin_info()
    {
        cout << "\nSQUARE: " << x << endl;
        cout << "Area:\t" << area() << endl;
        cout << "Perimeter:\t" << perimeter() << endl;
        cout << "Diagonal:\t" << diagonal() << endl;
        cout << "--------------\n\n";
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
        return (3.0 / 2) * (a * H);
    }

    double volume()
    {
        return (1.0 / 3) * area() * H;
    }

    void prtin_info()
    {
        cout << "\nPIRAMIDA: " << H << "h, " << a << "side" << endl;
        double area_result = area();
        cout << "Area:\t" << area_result << endl;
        cout << "volume:\t" << volume() << endl;
        cout << "--------------\n\n";
    }
};
