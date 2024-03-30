use16
org 100h

movsx ax, [a]
mov bx, [b]
imul bx
movsx bx, [a]
add bx, [c]
idiv bx
cwd

mov word[k], ax
mov word[k+2], dx

mov ax,4C00h
int 21h
;-------------------------------------------------------
a db 2h
b dw 3h
c dw 4h
k dd ?