use16
org 100h

jmp start

    arr1 dw 1,2,2,0,3,0,4
    arr2 dw 0,1,0,2,0,3,0
    length db 7

    diff db 13,10,'A difference has found!$'
    comp db 13,10,'Elements of arrays are identical$'

    mov ax,4C00h
    int 21h
;-------------------------------------------------------
start:
    mov si, 0
    movzx cx, [length]
    search:
        dec cx
        mov ax, [arr1+si]
        mov bx, [arr2+si+2]
        add si, 4
        cmp cx, 0
        je exit_comp
        cmp ax, bx
        loope search
        jne exit_diff
        jmp exit_comp

exit_diff:
mov ah, 09h
mov dx, diff
int 21h
    mov ah,01h
    int 21h

    mov ax,4C00h
    int 21h

exit_comp:
mov ah, 09h
mov dx, comp
int 21h
    mov ah,01h
    int 21h

    mov ax,4C00h
    int 21h

