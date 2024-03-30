use16
org 100h
jmp start
;------------------------------------------------------------
lb db 11;1(MAX)+1(LEN)+8(TEXT)+1(0DH)=11

ans db ?

s_byte db 'Enter byte: $'
s_error db 13,10,'Oops... Something`s wrong!',13,10,'$'
s_pak db 13,10,'Success! Press any key...',13,10,'$'
;------------------------------------------------------------

start:

mov dx,s_byte
call print_str
call input_str

call str_to_byte
mov dx,s_pak
call print_str

mov ah,8
int 21h

mov ax,4C00h
int 21h
;------------------------------------------------------------

input_str:
push ax
mov dx,lb
mov ah,0Ah ;
int 21h
movzx cx,[lb+1]
add dx,2
pop ax
ret
;------------------------------------------------------------

str_to_byte:
push cx
push bx
push si

mov si,dx
xor ax,ax
xor bx,bx

studw_lp:
lp1:
    mov bl,[si]
    sub bl,'0'
    jz stu
    cmp bl,1
    jnz error
stu:
    shl al,1
    add al,bl
inc si ;
loop lp1 ;
jmp studw_exit

error:
xor ax,ax
mov dx,s_error
call print_str
jmp start

studw_exit:
mov [ans],al
pop si
pop bx
pop cx
ret

print_str:
push ax
mov ah,9
int 21h
pop ax
ret