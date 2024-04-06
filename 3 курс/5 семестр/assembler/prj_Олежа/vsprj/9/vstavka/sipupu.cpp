#include <iostream>
#include <intrin.h>
#include <cstdlib>

using namespace std;


int main() {
    setlocale(LC_ALL, "rus");
    unsigned __int64 start, end;
    int a, b, c, d, k = 1;
    cout << "Ax^2+Bx+C=0\nEnter A" << endl;
    cin >> a;
    cout << "Enter B" << endl;
    cin >> b;
    cout << "Enter C" << endl;
    cin >> c;
    start = __rdtsc();

    d = b * b - (4 * a * c);
    if (d > 0)
        k = 2;
    if (d < 0)
        k = 0;

    end = __rdtsc();
    cout << "Количество действительных корней - " << k << endl;
    cout << "Затрачено времени - " << (end - start) << endl;
    system("pause");
    return 0;
}
