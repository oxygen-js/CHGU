#include <iostream>
using namespace std;

class B1
{
    int a;

public:
    B1() {}
    B1(int in_a)
    {
        a = in_a;
    }
    void show_B1() { cout << "B1: " << a << endl; }
};

class D1 : public B1
{
    int b;

public:
    D1(int x, int y) : B1(y) { b = x; }
    void show_D1()
    {
        cout << "D1: " << b << endl;
        show_B1();
    }
};

class D2 : private B1
{
    int c;

public:
    D2(int x, int y) : B1(y) { c = x; }
    void show_D2()
    {
        cout << "D2: " << c << endl;
        show_B1();
    }
};

class D4 : public D1, public D2
{
    int d;

public:
    D4(int x, int y, int z, int n, int e) : D1(y, z), D2(n, e) { d = x; }
    void show_D4()
    {
        cout << "D4: " << d << endl;
        show_D1();
        show_D2();
    }
};

class B2 : private D4
{
    int e;

public:
    B2(int x, int y, int z, int n, int e, int l) : D4(y, z, n, e, l) { e = x; }
    void show_B2()
    {
        cout << "B2: " << e << endl;
        show_D4();
    }
};

int main()
{
    B2 temp(100, 200, 300, 400, 500, 600);
    D4 temp1(10, 20, 30, 40, 50);

    cout << "B2 temp(100, 200, 300, 400, 500, 600);\n";
    cout << "D4 temp(10, 20, 30, 40, 50);\n";

    cout << "\nСледуя иерархии класса B2: \n";
    temp.show_B2();

    cout << "\nСледуя иерархии класса D4: \n";
    temp1.show_D4();

    return 0;
}
