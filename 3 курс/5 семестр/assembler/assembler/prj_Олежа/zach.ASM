use16
org 100h

jmp start

arr dw -1,2,3,4,5,-6
n db 6

;-------------------------------------------------------
start:
mov si, 0
mov bl, [n]
mov dx, 0

testing:
cmp bl, 0
je exit
mov ax, word[arr+si]

positive:
cmp ax, 0
jg chet
jmp next

chet:
test ax, 1
jz summ
jmp next

next:
add si, 2
sub bl, 1
jmp testing

summ:
add dx, ax
jmp next

exit:
mov [arr], dx
mov ax, 4c00h
int 21h