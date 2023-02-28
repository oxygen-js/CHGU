const
  n = 10;

var
  a: array[1..n] of byte;
  i, seq: integer;

procedure Perebor(k: integer);
var
  i, count: integer;
begin
  if k > n then begin
    count := 0;
    for i := 1 to n do
    begin
     
      if a[i] = 1 then count += 1;
    end;
     if count = 3 then begin
     seq += 1;
     for i := 1 to n do
    
       
       Write(a[i]:2);
    Writeln;
    end;
    Exit
  end;
  for i := 0 to 1 do
  begin
    a[k] := i;
    Perebor(k + 1)
  end
end;


begin
  seq := 0;
  Perebor(1);
  Writeln(seq);
end.