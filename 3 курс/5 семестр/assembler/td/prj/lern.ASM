use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h

  mov al, [b]
  mov cl, [c]
  mul cl
  mov bx, ax

  mov al, [a]
  mov ah, [b]
  sub al, ah
  mov ah, 0

  div bx

  mov [k], ax


  mov ax,4C00h    ;\
  int 21h         ;/ Завершение программы

; -----------------------------------------------------------

;k=(a-b)/(b*c)
a db 10
b db 2
c db 2

k dw ?
