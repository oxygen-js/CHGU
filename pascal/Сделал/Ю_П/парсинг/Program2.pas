Var 
    f:File;		// Двоичный файл
    s:string;

// Функция шифрования
Function Encryption(s:string):string;
Var i:integer;
    ss:string;
begin
    ss:='';
    For i:=1 to Length(s) do ss:=ss+Chr(Ord(s[i])-2);
    Encryption:=ss
end;

// Запись сведений о просмотрщике в двоичный файл  
Procedure WriteInfo(s:string);
Var i,L:integer;
begin
    L:=Length(s);    
    Write(f,L);
    for i:=1 to L do Write(f,s[i]);
end;

Begin    
    AssignFile(f,'DataViewer');
    Rewrite(f);    
    s:='Программа просмотра сведений о блюдах.';s:=Encryption(s);    
    WriteInfo(s);    
    s:='Автор: Трынова Ю.А.';s:=Encryption(s);
    WriteInfo(s);
    s:='Меню:';s:=Encryption(s);
    WriteInfo(s);
    s:='1. Просмотр';s:=Encryption(s);
    WriteInfo(s);
    s:='2. Поиск';s:=Encryption(s);
    WriteInfo(s);
    s:='3. Добавление';s:=Encryption(s);
    WriteInfo(s);
    s:='4. Удаление';s:=Encryption(s);
    WriteInfo(s);
    s:='5. Выход';s:=Encryption(s);
    WriteInfo(s);    
    Close(f);
End.
