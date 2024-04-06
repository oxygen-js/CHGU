#include <iostream>
#include <ctime>
#include "windows.h"
#include "psapi.h"
#include <stdio.h>
#include <tchar.h>

int main()
{
    int a, b, c, D = 0;
    unsigned __int64 start, end;
    std::cout << "The discriminant equation\n";
    std::cout << "Ax^2 + Bx + C = 0;\n";
    std::cout << "Enter the numbers for A, B, C:\n";
    std::cout << "A: "; std::cin >> a;
    std::cout << "B: "; std::cin >> b;
    std::cout << "C: "; std::cin >> c;
    
    start = __rdtsc();
    D = b * b - 4 * a * c;

    if (D > 0) {
        std::cout << "There are 2 total roots\n";
    }

    if (D == 0) {
        std::cout << "Only 1 root\n";
    }

    if (D < 0) {
        std::cout << "There are no roots\n";
    }  

    end = __rdtsc();
    std::cout << "Time - " << (end - start);


    unsigned __int64 asm_start, asm_end;
    int k = 0;
    asm_start = __rdtsc();

    __asm {
        mov eal, b
        mul eal
        mov d, eax
        mov eax, 0
        mov eal, a
        mov ebl, c
        mul ebl
        mov ebx
        mol ebl
        mov ebx, d
        sub ebx, eax
        cmp ebx, 0
        mov k, 1
        je exit
        mov k, 2
        jq exit
        mov k, 0
        jl exit

        exit: 
    }

    asm_end = __rdtsc();

    std::cout << "Number of roots" << k << "\n";
    std::cout << "ASM Time - " << (asm_end - asm_start) << std::endl;
    return 0;
}
