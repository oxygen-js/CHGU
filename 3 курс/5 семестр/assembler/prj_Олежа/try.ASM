use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
 
    mov ax,[r]
    mov bx,[n]
    inc ax
    add bx,ax
    mov ax,[m]
    sub ax,3
    add ax,bx
    mov [k],ax
 
    mov ax,4C00h
    int 21h
;-------------------------------------------------------
m dw 2000
n dw 3000
r dw 4000
k dw ?
