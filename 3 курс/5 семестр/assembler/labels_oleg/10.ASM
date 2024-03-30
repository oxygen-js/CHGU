use16
org 100h

jmp start

    arr1 dw 1,2,3,4,5,6,7
    arr2 dw 1,2,3,4,5,6,7
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
        mov ax, [arr1+si]
        mov bx, [arr2+si]
        add si, 2
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

