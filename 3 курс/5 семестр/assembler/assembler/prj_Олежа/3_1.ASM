use16
org 100h

        mov ax,word[b]
        mov bx,word[a]
        mul bx
        mov word[k],ax
        mov word[k+2],dx

        mov ax,word[b+2]
        mul bx
        add word[k+2],ax
        mov word[k+4],dx
        adc word[k+4],0
        adc cx,0

        mov ax,word[b]
        mov bx,word[a+2]
        mul bx
        add word[k+2],ax
        adc word[k+4],dx
        adc cx,0

        mov ax,word[b+2]
        mul bx
        add word[k+4],ax
        mov word[k+6],dx
        adc word[k+6],0
        add word[k+6],cx

mov ax,4C00h
int 21h
;-------------------------------------------------------
a dd 12345678h
b dd 87654321h
k rb 8