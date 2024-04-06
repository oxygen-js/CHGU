use16
org 100h
;Требуется из каждого элемента первого массива вычесть среднее значение второго
   sub ax,ax         ;AX = 0
   cwd               ;DX = 0
   mov si,ax         ;SI = 0 - смещение элемента от начала массива
   mov bx, array_2
   mov di, n
   mov cl, [di]

lp1:
        add ax, [bx+si]
        add si, 2
        loop lp1

        idiv [n]
        cwd

        mov dx, ax
        sub ax, ax
        mov si, ax
        mov bx, array
        mov di, n
        mov cl, [di]

lp2:
        sub [bx+si], dx
        add si, 2
        loop lp2



mov ax,4C00h
int 21h
;-------------------------------------------------------

n       db 2
array   dw 8, 8
array_2 dw 2, 2
