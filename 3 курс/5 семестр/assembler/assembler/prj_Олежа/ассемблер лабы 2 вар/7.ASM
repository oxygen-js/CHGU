use16
org 100h
      ;82 = 10000010
      ;10000010 -> 10110110 = B6
      ;B6 -> 00
      ;00000000 -> 11111100 = FC

    mov ax, word[x+2]
    mov dx, word[x]

    xor dl, 00110100b
    and dl, 00000000b
    or dl, 11111100b
    or dh, 00000001b
    not [x]

    mov word[y], ax
    mov word[y+2], dx

    mov ax,4C00h
    int 21h
;-------------------------------------------------------
x dd 59916382h
y dd ?

