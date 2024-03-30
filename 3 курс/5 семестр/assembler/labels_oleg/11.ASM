use16
org 100h
    jmp start
;----------------------------------------------------------------------
arr dw 1,2,3,4,5,6,7
n dw 3
;----------------------------------------------------------------------
start:
    mov si, 0
    mov bl, 2
    mov cx, 7
    mov ax, [n]
    div bl
    mov ah, 0
    mov [n], ax
    mov bx, 0
loop1:
    mov dx, cx
    mov cx, [n]
    add cx, bx
    test dl,00000001b
    jz metka
       mov ax, [arr+si]
    shl [arr+si], cl
        mov ax, [arr+si]
    jmp metka2
    metka:
        mov ax, [arr+si]
    shr [arr+si], cl
        mov ax, [arr+si]
    metka2:
    test dl,00000001b
    jnz metka3
    inc bx
    metka3:
    add si, 2
    mov cx, dx
loop loop1

    mov ax,4C00h
    int 21h
