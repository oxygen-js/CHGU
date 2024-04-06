use16
org 100h
jmp startm

   intro db 13,10,'k=m+3-(n-m)-1',13,10,13,10,'$'

   pak db 13,10,13,10,'Press any key...',13,10 ,'$'

   menu_m db '0 - m=0',13,10
          db '1 - m=1',13,10
          db '2 - m=2',13,10
          db '3 - m=3',13,10
          db '4 - exit',13,10,'$'

   menu_n db 13,10,13,10,'0 - n=0',13,10
          db '1 - n=1',13,10
          db '2 - n=2',13,10
          db '3 - n=2',13,10
          db '4 - exit',13,10,'$'

   select db 13,10,'Select>$'

   kl db 13,10,13,10,'k < 0$'
   kz db 13,10,13,10,'k = 0$'
   kb db 13,10,13,10,'k > 0$'

    mov ax,4C00h
    int 21h
;-------------------------------------------------------

startm:
    mov ah,09h
    mov dx,intro
    int 21h
    mov ah,09h
    mov dx,menu_m
    int 21h
    jmp numm

startn:
    mov bh, al
    sub bh, 48

    mov ah,09h
    mov dx,menu_n
    int 21h
    jmp numn

numm:
    mov ah,09h
    mov dx,select
    int 21h
 
    mov ah,01h
    int 21h

    cmp al,'0'
    je startn
    cmp al,'1'
    je startn
    cmp al,'2'
    je startn
    cmp al,'3'
    je startn
    jne exit

numn:

    mov ah,09h
    mov dx,select
    int 21h

    mov ah,01h
    int 21h

    cmp al,'0'
    je count
    cmp al,'1'
    je count
    cmp al,'2'
    je count
    cmp al,'3'
    je count
    jmp exit

count:
     mov bl, al
     sub bl, 48

     add bh, bh
     sub bh, bl
     add bh, 2

     cmp bh,0
         jl res1
         je res2
         jg res3

res1:
    mov ah,09h
    mov dx,kl
    int 21h
    jmp exit

res2:
    mov ah,09h
    mov dx,kz
    int 21h
    jmp exit

res3:
    mov ah,09h
    mov dx,kb
    int 21h
    jmp exit

exit:
    mov ah,09h
    mov dx,pak
    int 21h

    mov ah,01h
    int 21h

    mov ax,4C00h
    int 21h

