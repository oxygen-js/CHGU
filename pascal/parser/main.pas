Type Data = Record
        nomer: integer;
        day, temp, speed, humidity, direction: string[50]
     end;
     
Var f: textfile;
    ff: File of Data;
    s: string;
    i, k, n: integer;
    Pogoda: Data;
Begin
    AssignFile(f, 'save_data/Data.txt');
    Reset(f);
    AssignFile(ff, 'save_data/Data.dta');
    Rewrite(ff);
    k:=0;
    
    While Not Eof(f) do begin
      k:=k+1;
      Pogoda.nomer := k;
      Readln(f,s);
      Pogoda.day := s;
      Readln(f,s);
      Pogoda.temp := s;
      Readln(f,s);
      Pogoda.humidity := s;
      Readln(f,s);
      Pogoda.direction := s;
      Readln(f,s);
      Pogoda.speed := s;
      
      Write(ff, Pogoda);
    end;
    
    Close(f);
    Close(ff);
    
    AssignFile(ff, 'save_data/Data.dta');
    Reset(ff);
    
    While Not Eof(ff) do begin
      Read(ff, Pogoda);
      Writeln(Pogoda);
    end;
    Close(ff);
end.