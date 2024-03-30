use16
org 100h

   mov cl, [n]
   mov si, 8
   loop1:
      mov ax, [array1+si]
      mov bx, [array2+si]
      sub bx, ax
      mov word[array2+si], bx
      sub si, 2
   loop loop1

    mov ax,4C00h
    int 21h
;-------------------------------------------------------
n db 5
array1 dw 1,2,3,4,5
array2 dw 2,3,4,5,6



