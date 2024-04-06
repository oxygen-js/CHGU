use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
 
    mov ax,[n]      ;Загружаем значение a в AL
    mov bx,[m]      ;Загружаем значение b в AH
    inc bx          ;BX = BX + 1 = b+1
    sub bx,ax       ;BX = BX -AX =( b+1-n)

    mov cx,[r]      ;cx=r
    dec cx          ;CX=CX-1

    add cx,[m]      ; cx= CX + m

    add cx,bx       ;cx=cx+bx
    mov [k],cx      ;k=cx
 
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
n dw 2
m dw 3
r dw 5
k dw ?
