Uses Crt;  

Type DataTr=Record
        Name,DName:string[50];
     end;

Var 
    f:File;               // двоичный файл
    ff:File of DataTr;  // файл БД
    s,s1,s2:string;c:char;
    i,k,L:integer;
    Tr:DataTr;

// Сравнение строк
Function Compare(p:DataTr;s1,s2:string):boolean;
Var s,ss:string;
begin
    s:=s1+s2;    ;
    ss:='';
    If s1<>'' then ss:=ss+Tr.Name;
    If s2<>'' then ss:=ss+Tr.DName;   
    Compare:=s=ss       
end;

// Дешифрование информации
Function Decryption(s:string):string;
Var i:integer;
    ss:string;
begin
    ss:='';
    For i:=1 to Length(s) do ss:=ss+Chr(Ord(s[i])+2);
    Decryption:=ss
end;

// Процедура линейного поиска  
Procedure LinPoisk(s1,s2:string);
Var p:boolean;
    i:integer;
begin
    Reset(ff);
    While Not Eof(ff) do begin   
        Read(ff,Tr);
        p:=Compare(Tr,s1,s2);        
        If p then 
          Writeln(Tr.Name,' ',Tr.DName,' ')
   end;
end;   

// Чтение сведений о просмотрщике из двоичного файла
Procedure ReadInfo(Var s:string);
Var i,L:integer;  
begin
    read(f,L);
    s:='';
    for i:=1 to L do begin
      read(f,c);
      s:=s+c
    end; 
end;

// Просмотр данных
Procedure ViewData;
Var i:integer;
begin
    ClrScr;
    Reset(ff);
    i:=0;
    While Not Eof(ff) do begin
    //For i:=1 to 10 do begin
      Read(ff,Tr);
      i:=i+1;
      Writeln(i+'. '+Tr.Name,' ',Tr.DName,' ')
    end;  
    Close(ff);    
    Readln    
end;

// Поиск данных
Procedure FindData;
Var i:integer;
    s1,s2:string;
    x,y:string;
begin
   Writeln('Название блюда:');
   Readln(x);
   Writeln('Введите время приготовления:');
   Readln(y);

  
   Reset(ff);
    While Not Eof(ff) do begin
      Read(ff,Tr);
     // Writeln(Tr);
      if (Pos(x,Tr.Name)>0) and (Pos(y,Tr.DName)>0) then Writeln(Tr);
    end; 
    Close(ff);
  
   //LinPoisk(s1,s2);   
   Readln 
   
end;

// Добавление данных
Procedure AddData;
Var i,p:integer;
    s,ss,s1,s2:string;
    f1:File of DataTr;
    Tr:DataTr;
begin
   ClrScr;
   Writeln('Ввод данных о блюдах');
   Writeln('Введите название блюда:');
   Readln(s1);
   Writeln('Введите часы приготовления:');
   Readln(s2);
   
   s:=s1+s2;
   
   Reset(ff);   
   AssignFile(f1,'TempFile.prep');
   Rewrite(f1);
   
   p:=0;
   While Not Eof(ff) do begin
      Read(ff,Tr);
      ss:=Tr.Name+Tr.DName;
      If (ss<s) And (p=0) Then Write(f1,Tr);
      If (ss>s) And (p=1) Then Write(f1,Tr); 
      If (ss>s) And (p=0) Then
      begin
        Tr.Name:=s1;
        Tr.DName:=s2;
        
        Write(f1,Tr);        
        p:=1
      end;      
   end;
   Close(f1);
   Close(ff);
   Erase(ff);
   Rename(f1,'DBTr.dta');  
   Writeln('Добавлено.');
   Readln
end;

// Удаление данных
Procedure DelData;
Var i:integer;
    s,ss,s1,s2:string;
    f1:File of DataTr;
    Tr:DataTr;
    x:integer;
begin
   ClrScr;
   //Writeln('Ввод данных о блюде');
   //Writeln('Введите название блюда:');
   Writeln('Введите номер записи для удаления');
   Readln(x);
  
   //s:=s1;
   
   Reset(ff);   
   AssignFile(f1,'TempFile.prep');
   Rewrite(f1);
   
   i:=0;
   While Not Eof(ff) do begin
   i:=i+1;
      Read(ff,Tr);
      ss:=Tr.Name;      
      If (x<>i) Then Write(f1,Tr);
   end;

   Close(f1);
   Close(ff);
   Erase(ff);
   Rename(f1,'DBTr.dta');  
   Writeln('Удалено.');
   Readln
end;

Begin
   AssignFile(ff,'DBTr.dta');    
   AssignFile(f,'DataViewer');
        
   Repeat
      ClrScr;
      Reset(f);      
      While Not Eof(f) do begin
        ReadInfo(s);
        s:=Decryption(s);
        Writeln(s);
      end;
      Readln(k);
      Case k of
      1:ViewData;
      2:FindData;
      3:AddData;
      4:DelData
      end
   Until k=5;
    
   Close(f);
   Close(ff);
end.

