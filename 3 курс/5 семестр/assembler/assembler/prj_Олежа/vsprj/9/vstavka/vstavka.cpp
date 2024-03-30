#include <iostream>
#include <intrin.h>
#include <cstdlib>

using namespace std;


int main() {
    setlocale(LC_ALL, "rus");
    unsigned __int64 start, end;
    int a, b, c, d, k = 1;
    cout << "Тут ассемблер\nAx^2+Bx+C=0\nEnter A" << endl;
    cin >> a;
    cout << "Enter B" << endl;
    cin >> b;
    cout << "Enter C" << endl;
    cin >> c;
    start = __rdtsc();

    __asm {
        mov eax, b
        imul eax, eax
        mov d, eax
        mov eax, 0
        mov eax, a
        mov ebx, c
        imul eax, ebx
        mov ebx, 0
        imul eax, 4
        mov ebx, d
        sub ebx, eax
        cmp ebx, 0
        je exit1
        mov k, 2
        jg exit1
        mov k, 0
        jl exit1

        exit1:
    }

    end = __rdtsc();
    cout << "Количество действительных корней - " << k << endl;
    cout << "Затрачено времени - " << (end - start) << endl;
    system("pause");
    return 0;
}
