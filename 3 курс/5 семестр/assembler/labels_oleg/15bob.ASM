use16                       ;Генерировать 16-битный код
org 100h                    ;Программа начинается с адреса 100h

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
    call print_str                 ;Вывод строки 'Press any key...'
    mov ah,8                ;Функция DOS 08h - ввод символа без эха
    int 21h

    mov ax,4C00h            ;\
    int 21h                 ;/ Завершение программы

;----------------------------------------------------------------------
;Процедура вывода слова на консоль в десятичном виде (со знаком)
; AX - слово
print_word_sdec:
    push di
    mov di,buffer           ;DI = адрес буфера
    push di                 ;Сохранение DI в стеке
    call word_to_sdec_str   ;Преобразование слова в AX в строку
    mov byte[di],'$'        ;Добавление символа конца строки
    pop di                  ;DI = адрес начала строки
    call print_str          ;Вывод строки на консоль
    pop di
    ret

;----------------------------------------------------------------------
print_str:
    push ax
    mov ah,9                ;Функция DOS 09h - вывод строки
    xchg dx,di              ;Обмен значениями DX и DI
    int 21h                 ;Обращение к функции DOS
    xchg dx,di              ;Обмен значениями DX и DI
    pop ax
    ret

;----------------------------------------------------------------------
print_endline:
    push di
    mov di,endline          ;DI = адрес строки с символами CR,LF
    call print_str          ;Вывод строки на консоль
    pop di
    ret
;----------------------------------------------------------------------
word_to_udec_str:
    push ax
    push cx
    push dx
    push bx
    xor cx,cx               ;Обнуление CX
    mov bx,10               ;В BX делитель (10 для десятичной системы)

wtuds_lp1:                  ;Цикл получения остатков от деления
    xor dx,dx               ;Обнуление старшей части двойного слова
    div bx                  ;Деление AX=(DX:AX)/BX, остаток в DX
    add dl,'0'              ;Преобразование остатка в код символа
    push dx                 ;Сохранение в стеке
    inc cx                  ;Увеличение счетчика символов
    test ax,ax              ;Проверка AX
    jnz wtuds_lp1           ;Переход к началу цикла, если частное не 0.

wtuds_lp2:                  ;Цикл извлечения символов из стека
    pop dx                  ;Восстановление символа из стека
    mov [di],dl             ;Сохранение символа в буфере
    inc di                  ;Инкремент адреса буфера
    loop wtuds_lp2          ;Команда цикла

    pop bx
    pop dx
    pop cx
    pop ax
    ret
;----------------------------------------------------------------------
word_to_sdec_str:
    push ax
    test ax,ax              ;Проверка знака AX
    jns wtsds_no_sign       ;Если >= 0, преобразуем как беззнаковое
    mov byte[di],'-'        ;Добавление знака в начало строки
    inc di                  ;Инкремент DI
    neg ax                  ;Изменение знака значения AX
wtsds_no_sign:
    call word_to_udec_str   ;Преобразование беззнакового значения
    pop ax
    ret

;---------------------------------------------------------------------
s_pak    db 'Press any key...$'
endline  db 13,10,'$'
comma  db ', $'
buffer   rb 7


    arr dw 112,-1,124,621,-32,2,10
    l dw 7

