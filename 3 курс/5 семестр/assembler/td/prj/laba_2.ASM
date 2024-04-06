use16                 ;Генерировать 16-битный код
org 100h              ;Программа начинается с адреса 100h
    ; k=a+b+1+c
    mov ax,word[a]
    mov bx,word[a+2]
    mov cl,byte[a+4]

    add ax,word[b]
    adc bx,word[b+2]
    adc cl,byte[b+4]

    add ax,word[c]
    adc bx,word[c+2]
    adc cl,byte[c+4]

    add ax,1

    mov word[k],ax
    mov word[k+2],bx
    mov byte[k+4],cl

    mov ax,4C00h      ;\
    int 21h           ;/ Завершение программы
;-------------------------------------------------------
a dd 1200FFFFh
  db 10h
b dd 00000100h
  db 10h
c dd 00000050h
  db 10h
k rb 5