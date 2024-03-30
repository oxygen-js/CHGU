#include "pch.h"
#include <iostream>
#include <ctime>
#include "windows.h"
#include "psapi.h"
#include <stdio.h>
#include <tchar.h>


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
        mov eal, b
        mul eal
        mov d, eax
        mov eax, 0
        mov eal, a
        mov ebl, c
        mul ebl
        mov ebx, 4
        mul ebl
        mov ebx, d
        sub ebx, eax
        cmp ebx, 0
        je exit
        mov k, 2
        jg exit
        mov k, 0
        jl exit

        exit:
    }

    end = __rdtsc();
    cout << "Количество действительных корней - " << k << endl;
    cout << "Затрачено времени - " << (end - start);
    return 0;
}
