Uses Crt;

type
  DataPogoda = Record
    nomer: integer;
    day, temp, speed, humidity, direction: string[50]
  end;

var
  f: file;               // двоичный файл
  ff: file of DataPogoda;  // файл БД
  s, s1, s2: string;
  c: char;
  i, k, L: integer;
  Pogoda: DataPogoda;

// Сравнение строк
function Compare(p: DataPogoda; findDate: string): boolean;
var
  s, ss: string;
begin
  s := findDate;
  ss := '';
  if findDate <> '' then ss := ss + Pogoda.day;     
  Compare := s = ss
end;

// Дешифрование информации
function Decryption(s: string): string;
var
  i: integer;
  ss: string;
begin
  ss := '';
  for i := 1 to Length(s) do ss := ss + Chr(Ord(s[i]) + 2);
  Decryption := ss
end;

// Процедура линейного поиска  
procedure LinPoisk(findDate: string);
var
  p: boolean;
  i: integer;
begin
  Reset(ff);
  while not Eof(ff) do
  begin
    Read(ff, Pogoda);
    p := Compare(Pogoda, findDate);        
    if p then 
      Writeln(Pogoda.nomer, ' ', Pogoda.day, ' ', Pogoda.temp, ' ', Pogoda.speed, ' ', Pogoda.humidity, ' ', Pogoda.direction)
  end;
end;   

// Чтение сведений о просмотрщике из двоичного файла
procedure ReadInfo(var s: string);
var
  i, L: integer;
begin
  read(f, L);
  s := '';
  for i := 1 to L do
  begin
    read(f, c);
    s := s + c
  end; 
end;

// Просмотр данных
procedure ViewData;
var
  i: integer;
begin
  ClrScr;
  Reset(ff);
  while not Eof(ff) do
  begin
    //For i:=1 to 10 do begin
    Read(ff, Pogoda);
    Writeln(Pogoda.nomer, ' ', Pogoda.day, ' ', Pogoda.temp, ' ', Pogoda.speed, ' ', Pogoda.humidity, ' ', Pogoda.direction);
  end;    
  Readln
end;

// Поиск данных
procedure FindData;
var
  i: integer;
  findDate: string;
begin
  ClrScr;
  Writeln('Введите дату:');
  Readln(findDate);
  LinPoisk(findDate);   
  Readln
end;

// Добавление данных
procedure AddData;
var
  i, p: integer;
  s, ss, s1, s2, s3, s4, s5: string;
  f1: file of DataPogoda;
  Pogoda: DataPogoda;
begin
  ClrScr;
  Writeln('Ввод данных о погоде.');
  Writeln('Введите дату:');
  Readln(s1);
  Writeln('Введите температуру:');
  Readln(s2);
  Writeln('Введите влажность:');
  Readln(s3);
  Writeln('Введите направление ветра:');
  Readln(s4); 
  Writeln('Введите силу ветра:');
  Readln(s5); 

  p := FileSize(ff);
  Pogoda.nomer := p + 1;
  Pogoda.day := s1;
  Pogoda.temp := s2;
  Pogoda.speed := s3;
  Pogoda.humidity := s4;
  Pogoda.direction := s5;
  
  Reset(ff); 
  Seek(ff, p);
  Write(ff, Pogoda);
  Close(ff); 
  
  Writeln('Добавлено.');
  Readln
end;

// Удаление данных
procedure DelData;
var
  i: integer;
  s, ss, s1: string;
  f1: file of DataPogoda;
  Pogoda: DataPogoda;
begin
  ClrScr;
  Writeln('Ввод данных о преподавтеле');
  Writeln('Введите дату:');
  Readln(s1);
  s := s1;
  
  Reset(ff);   
  AssignFile(f1, 'save_data/TempFile.prep');
  Rewrite(f1);
  
  while not Eof(ff) do
  begin
    Read(ff, Pogoda);
    ss := Pogoda.day;      
    if (ss <> s) Then Write(f1, Pogoda);
  end;
  Close(f1);
  Close(ff);
  Erase(ff);
  Rename(f1, 'save_data/Data.dta');  
  Writeln('Удалено.');
  Readln
end;

begin
  AssignFile(ff, 'save_data/Data.dta');    
  AssignFile(f, 'save_data/DataViewer');
  
  repeat
    ClrScr;
    Reset(f);      
    while not Eof(f) do
    begin
      ReadInfo(s);
      s := Decryption(s);
      Writeln(s);
    end;
    Readln(k);
    case k of
      1: ViewData;
      2: FindData;
      3: AddData;
      4: DelData
    end
  until k = 5;
  
  Close(f);
  Close(ff);
end.
