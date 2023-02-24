const p = 120; //кол-во нормальных слов
Const n=13; //кол-во букв в слове
var
  wor:array[0..1200] of string;
  word1: string;
  word2: string;
  a:array[1..n] of boolean;
  i:integer;
  t1,t2:integer;
  f1,f2: text;
  words: array[1..p] of string;
  
Procedure Perebor(k:integer);
Var i:integer;
begin
  word2 := '';
    If k>n then begin
        For i:=1 to n do begin
        
            if a[i] = true then begin
              word2 := word2 + word1[i];
            end;
         end;
       for i:= 1 to p do begin
         
       if word2 = wor[i] then begin
            Writeln(word2);
          end;
       end;
       Exit
    end;
    For i:=0 to 1 do begin
       if i = 0 then a[k] := false;
       if i = 1 then a[k] := true;
       Perebor(k+1)
    end;
end;  

begin
  word1 := 'свидетельство';
  Assign(f1, 'IN.DAT2.txt');
//  Assign(f1, 'Sd.txt');
  reset(f1);
  i:=0;
  While not eof(f1) do
  Begin
  Readln(f1,wor[i]);
  i:=i+1;
  end;
    Close(f1);

  t1:=MilliSeconds;
  Perebor(1);
  t2:=MilliSeconds;
  Writeln(' t=',t2-t1);
end.