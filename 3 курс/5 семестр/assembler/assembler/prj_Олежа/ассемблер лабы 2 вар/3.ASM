use16
org 100h

        mov ax,word[b]
        mov bx, word[a]

        imul bx
        add bx, word[c]
        idiv bx

        mov word[k], ax
        mov word[k+2], dx

mov ax,4C00h
int 21h
;-------------------------------------------------------
a dw 9
b dw 2
c dw 6
k rb 2