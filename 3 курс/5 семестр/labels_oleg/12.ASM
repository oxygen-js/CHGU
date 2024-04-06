use16
org 100h
jmp start
;----------------------------------------------------------------------
string db '123456789a',13,10,'$'
n dw 3
l dw 10
;----------------------------------------------------------------------
start:

mov ah,09h
mov dx,string
int 21h

    shr [l], 1
    mov si, 0
    mov bl, 4
    mov cx, [l]
    mov ax, [n]
    div bl
    mov ah, 0
    mov [n], ax
    mov bx, 0

loop1:
    mov dx, cx
    mov cx, [n]
    add cx, bx
    rol byte[string+si], cl
    ror byte[string+si+1], cl
    inc bx
    add si, 2
    mov cx, dx
loop loop1

mov ah,09h
mov dx,string
int 21h

    mov cx, [l]
    mov bx, 0
    mov si, 0

loop2:
    mov dx, cx
    mov cx, [n]
    add cx, bx
    ror [string+si], cl
    rol [string+si+1], cl
    inc bx
    add si, 2
    mov cx, dx
loop loop2

mov ah,09h
mov dx,string

int 21h

mov ax,4C00h
int 21h
