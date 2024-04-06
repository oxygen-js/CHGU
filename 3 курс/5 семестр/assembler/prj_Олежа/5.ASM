use16
org 100h
 
    mov ax, 1
    mov bx, [k]
    mov cl, [n]
    loop1:
        mul bx

    loop loop1
    mov [x], ax

    mov ax,4C00h
    int 21h
;-------------------------------------------------------
k dw 2
n db 6
x dw ?
press:
        db 13,10,'Press any key...$'
