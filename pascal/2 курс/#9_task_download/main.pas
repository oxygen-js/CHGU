 Const n = 20;
      MaxVes = 600;
      elem: array[1..n] of integer = 
      (12, 88, 70, 80, 95, 28, 65, 4, 17, 90, 71, 97, 28, 62, 60, 77, 3, 19, 4, 41);
    //  1   2   3   4   5   6   7  8   9  10  11  12  13  14  15  16  17 18  19 20
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
  
  
  for i := 0 to 1 do 
  begin
    if (k = 0) or (k >= 3) or (k <= 10) or (k >= 16) then stack[k] := i;
    if (k = 1) or (k = 2) or (k >= 11) then stack[k] := 1;
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

//    if (k = 1) or (k = 2) then
//    begin
//       stack[k] := 1;
//       break;
//    end;