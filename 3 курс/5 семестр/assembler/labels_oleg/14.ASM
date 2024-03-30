use16
org 100h
jmp start
;----------------------------------------------------------------------
arr1 dw 1,2,3,4 ;2 è 2
arr2 dw 2,3,4,5,6 ;4
arr3 dw 3,4,5,6,7,8 ;5 è 3

l1 dw 4
l2 dw 5
l3 dw 6

a1 dw ?
a2 dw ?
a3 dw ?

;----------------------------------------------------------------------
arif:
    push cx
    mov si, 0
    mov ax, 0
    mov dx, 0

    arif_loop:
    add ax, [bx+si]
    add si, 2
    loop arif_loop

    pop bx
    div bx
ret

start:
    mov bx, arr1
    mov cx, [l1]
    call arif
    mov [a1], ax
    mov [a1+2], dx

    mov bx, arr2
    mov cx, [l2]
    call arif
    mov [a2], ax
    mov [a2+2], dx

    mov bx, arr3
    mov cx, [l3]
    call arif
    mov [a3], ax
    mov [a3+2], dx
;----------------------------------------------------------------------

mov ax,4C00h
int 21h
