type
  Data = Record
    nomer:integer;
    day, temp, speed, humidity, direction: string[50]
  end;

var
  f: textfile;
  ff: file of Data;
  s: string;
  i, k, n: integer;
  Pogoda: Data;

begin
  AssignFile(f, 'save_data/Data.txt');
  Reset(f);
  AssignFile(ff, 'save_data/Data.dta');
  Rewrite(ff);
  k := 0;
  
  while not Eof(f) do
  begin
    k := k + 1;
    Pogoda.nomer := k;
    Readln(f, s);
    Pogoda.day := s;
    Readln(f, s);
    Pogoda.temp := s;
    Readln(f, s);
    Pogoda.humidity := s;
    Readln(f, s);
    Pogoda.direction := s;
    Readln(f, s);
    Pogoda.speed := s;
    
    if Pogoda.day.Length > 1 then
      Write(ff, Pogoda);
  end;
  
  Close(f);
  Close(ff);
  
  AssignFile(ff, 'save_data/Data.dta');
  Reset(ff);
  
  while not Eof(ff) do
  begin
    Read(ff, Pogoda);
    Writeln(Pogoda);
  end;
  Close(ff);
end.