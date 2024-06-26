use16                       ;������������ 16-������ ���
org 100h                    ;��������� ���������� � ������ 100h

    mov cx, [l]
    mov si, 0

hamburger:
    mov ax, [arr+si]
    call print_word_sdec
    add si, 2
    cmp cx, 1
je exit
    mov di, comma
    call print_str
exit:
loop hamburger
    call print_endline

    mov di,s_pak
    call print_str                 ;����� ������ 'Press any key...'
    mov ah,8                ;������� DOS 08h - ���� ������� ��� ���
    int 21h

    mov ax,4C00h            ;\
    int 21h                 ;/ ���������� ���������

;----------------------------------------------------------------------
;��������� ������ ����� �� ������� � ���������� ���� (�� ������)
; AX - �����
print_word_sdec:
    push di
    mov di,buffer           ;DI = ����� ������
    push di                 ;���������� DI � �����
    call word_to_sdec_str   ;�������������� ����� � AX � ������
    mov byte[di],'$'        ;���������� ������� ����� ������
    pop di                  ;DI = ����� ������ ������
    call print_str          ;����� ������ �� �������
    pop di
    ret

;----------------------------------------------------------------------
print_str:
    push ax
    mov ah,9                ;������� DOS 09h - ����� ������
    xchg dx,di              ;����� ���������� DX � DI
    int 21h                 ;��������� � ������� DOS
    xchg dx,di              ;����� ���������� DX � DI
    pop ax
    ret

;----------------------------------------------------------------------
print_endline:
    push di
    mov di,endline          ;DI = ����� ������ � ��������� CR,LF
    call print_str          ;����� ������ �� �������
    pop di
    ret
;----------------------------------------------------------------------
word_to_udec_str:
    push ax
    push cx
    push dx
    push bx
    xor cx,cx               ;��������� CX
    mov bx,10               ;� BX �������� (10 ��� ���������� �������)

wtuds_lp1:                  ;���� ��������� �������� �� �������
    xor dx,dx               ;��������� ������� ����� �������� �����
    div bx                  ;������� AX=(DX:AX)/BX, ������� � DX
    add dl,'0'              ;�������������� ������� � ��� �������
    push dx                 ;���������� � �����
    inc cx                  ;���������� �������� ��������
    test ax,ax              ;�������� AX
    jnz wtuds_lp1           ;������� � ������ �����, ���� ������� �� 0.

wtuds_lp2:                  ;���� ���������� �������� �� �����
    pop dx                  ;�������������� ������� �� �����
    mov [di],dl             ;���������� ������� � ������
    inc di                  ;��������� ������ ������
    loop wtuds_lp2          ;������� �����

    pop bx
    pop dx
    pop cx
    pop ax
    ret
;----------------------------------------------------------------------
word_to_sdec_str:
    push ax
    test ax,ax              ;�������� ����� AX
    jns wtsds_no_sign       ;���� >= 0, ����������� ��� �����������
    mov byte[di],'-'        ;���������� ����� � ������ ������
    inc di                  ;��������� DI
    neg ax                  ;��������� ����� �������� AX
wtsds_no_sign:
    call word_to_udec_str   ;�������������� ������������ ��������
    pop ax
    ret

;---------------------------------------------------------------------
s_pak    db 'Press any key...$'
endline  db 13,10,'$'
buffer   rb 7


    arr dw 1, -1, 0, 651, -26
    l dw 5

