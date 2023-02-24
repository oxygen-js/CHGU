Const n=10;
Var a:array[1..n] of byte;
    i, seq:integer;

Procedure Perebor(k:integer);
Var i, count:integer;
begin
    If k > n then begin
        For i := 1 to n do begin 
          if a[i] = 1 then count += 1;
          if a[i] = 0 then count := 0;
          if count = 3 then begin
            seq += 1;
            count := 0;
          end;
          Write(a[i]:2);
        end;
        Writeln;
        Exit
    end;
    For i:=0 to 1 do begin
       a[k]:=i;
       Perebor(k+1)
    end
end;


begin
  seq := 0;
  Perebor(1);
  Writeln(seq);
end.