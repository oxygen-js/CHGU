use16
org 100h
 
    mov ax,word[a]
    mov bx,word[a+2]
    mov cl,byte[a+4]

    sub ax, word[b]
    sbb bx, word[b+2]
    sbb cl, byte[b+4]

    add ax, 1
    adc bx, 0
    adc cl, 0

    add ax, word[c]
    adc bx, word[c+2]
    adc cl, byte[c+4]

    mov word[k],ax
    mov word[k+2],bx
    mov byte[k+4],cl

    mov ax,4C00h
    int 21h
;-------------------------------------------------------
a dd 22222222h
  db 22h
b dd 11111111h
  db 11h
c dd 33333333h
  db 33h
k rb 5