use16               ;������������ 16-������ ���
org 100h            ;��������� ���������� � ������ 100h
 
    mov al,[a]      ;��������� �������� a � AL
    mov ah,[b]      ;��������� �������� b � AH
    add ah,[c]      ;AH = AH + c = b+c
    dec ah          ;AH = AH - 1 = b+c-1
    sub al,ah       ;AL = AL - AH = a-(b+c-1)
    mov cl,[d]      ;CL = d
    neg cl          ;CL = -CL = -d
    add al,cl       ;AL = AL + CL = a-(b+c-1)+(-d)
    mov [e],al      ;��������� ��������� � e
 
    mov ax,4C00h    ;\
    int 21h         ;/ ���������� ���������
;-------------------------------------------------------
a db 2
b db 3
c db 5
d db -8
e db ?
