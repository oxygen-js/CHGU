use16                 ;Генерировать 16-битный код
org 100h              ;Программа начинается с адреса 100h
    ; k=(a*b)/(a-c) = 39
    movsx ax, [a]
    imul [b]
    movsx bx, [a]
    sub bx, [c]
    cwd
    idiv bx
    cwd
    mov word[k], ax
    mov word[k+2], dx

    mov ax,4C00h      ;\
    int 21h           ;/ Завершение программы
;-------------------------------------------------------
k dd ?
a db -10
b dw -2000
c dw -500