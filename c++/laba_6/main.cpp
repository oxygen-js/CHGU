#include <iostream>
using namespace std;

class D4
{
public:
    double x;
    D4() {}
    D4(double in_x)
    {
        x = in_x;
    }

    void show()
    {
        cout << "D4.X: " << x << endl;
    }
};

class B2 : private D4
{
public:
    double y;
    B2(double in_y)
    {
        y = in_y;
    }
    void show()
    {
        cout << "B2.Y: " << y << endl;
    }
};

class D2 : public D4
{
public:
    D2() {}
    D2(double in_x)
    {
        x = in_x;
    }
};

class D1 : public D4
{
public:
    D1() {}
    D1(double in_x)
    {
        x = in_x;
    }
};

// class B1 : public D1, private D2
// {
// public:
//     B1(double in_x)
//     {
//         x = in_x;
//     }
// };

int main()
{
    D4 obj_d4 = D4(1);
    obj_d4.show();

    D1 obj_d1 = D1(2);
    obj_d1.show();

    D2 obj_d2 = D2(3);
    obj_d2.show();

    B2 obj_b2 = B2(4);
    obj_b2.show();


    // B1 obj_b1 = B1(5);

    return 0;
}
