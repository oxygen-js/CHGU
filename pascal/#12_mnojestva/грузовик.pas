Const n = 10;
      elem: array[1..n] of integer = 
      (1, 0, 1, 0, 0, 1, 0, 1, 0, 0);
      
Var i, dmBest: integer;
    stack, aBest: array[1..n] of byte;
    

Procedure Avto;
var i, Sum: integer;
begin
  Sum := 0;
  for i := 1 to n do
    Sum := Sum + elem[i] * stack[i];
  
  if (Sum > MaxVes) then Exit;
  if (MaxVes - Sum) < dmBest then 
  begin
    dmBest := MaxVes - Sum;
    aBest := stack;
  end;
end;

Procedure Perebor(k: integer);
var i: integer;
begin
  if k > n then
  begin
    Avto;
    Exit
  end;
  
  if dmBest = 0 then Exit;
  if stack[1] + stack[2] > 1 then Exit;
  if stack[3] > stack[4] then Exit;
  
  for i := 0 to 1 do 
  begin
    stack[k] := i;
    Perebor(k + 1);
  end;
  
end;

begin
  Writeln(elem);
  dmBest := MaxInt;
  Perebor(1);
 
  Writeln('dm = ', dmBest);
  Write(aBest);
end.