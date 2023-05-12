#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include "fraction.h"
using namespace std;

int main()
{

    cout << "\t\t\t\t========== INFO ==========\n\n";

    Square square_1 = Square(4);
    square_1.prtin_info();
    Square square_2 = Square(3);
    square_2.prtin_info();
    Square square_3 = Square(23);
    square_3.prtin_info();
    Square square_4 = Square(15);
    square_4.prtin_info();
    Square squares[] = {square_1, square_2, square_3, square_4};

    double min_area = squares[0].area();

    for (int i = 1; i < 4; i++)
    {
        int h = squares[i].area();
        if (h < min_area)
        {
            min_area = squares[i].area();
        }
    }

    for (int i = 0; i < 4; i++)
    {
        double h = squares[i].area();
        if (h == min_area)
        {
            cout << "1) Min S: " << min_area << endl;
            squares[i].prtin_info();
            break;
        }
    }

    int a, count = 0;
    cout << "a: ";
    cin >> a;

    Piramida pirm_1 = Piramida(1, 10);
    pirm_1.prtin_info();
    Piramida pirm_2 = Piramida(20, 3);
    pirm_2.prtin_info();
    Piramida pirm_3 = Piramida(17, 56);
    pirm_3.prtin_info();

    Piramida pirms[] = {pirm_1, pirm_2, pirm_3};
    for (int i = 0; i < 3; i++)
    {
        if (pirms[i].H > a)
        {
            count++;
        }
    }

    cout << "2) Piramid`s the height of which > " << a << "h = " << count << endl;

    return 0;
}
