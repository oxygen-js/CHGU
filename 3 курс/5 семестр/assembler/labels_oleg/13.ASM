use16
org 100h
jmp start
;----------------------------------------------------------------------
string db '$!olleH'
l dw 7
;----------------------------------------------------------------------
start:

mov cx, [l]
mov si, 0

hamburger:
    push word[string+si]
    add si, 1
loop hamburger

mov cx, [l]
mov si, 0

cheeseburger:
    pop word[string+si]
    add si,1
loop cheeseburger

mov ah,09h
mov dx,string

int 21h

mov ax,4C00h
int 21h
