use16                 ;Генерировать 16-битный код
org 100h              ;Программа начинается с адреса 100h
    ; k = k^n
    mov cx,[n]
    mov bx,[k]
    mov ax,1
metka:
   mul bx
   loop metka
   mov [k],ax


    mov ax,4C00h      ;\
    int 21h           ;/ Завершение программы
;-------------------------------------------------------
n dw 6
k dw 5