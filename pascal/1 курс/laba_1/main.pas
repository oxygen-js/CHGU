// Вариант #11. 

var
  n: integer;
  Y: real;

function FACT_11(n: integer): real;
var
  F: real;
begin
  F := 0;
  for var i := 1 to n do 
    F := F + Sin(i);    
  FACT_11 := F;
end;

function FUN_11(n: integer): real;
var
  i: integer;
  F: real;
begin
  F := 1;
  for i := 1 to n do F := F * (i / FACT_11(n));
  FUN_11 := F;
end;



function FACT_13(n: integer): integer;
var
  F, step_i: integer;
begin
  F := 1;
  step_i := n + 2;
  for var i := step_i - n to step_i do
    F := F * i;
  FACT_13 := F;
end;

function FUN_13(n: integer): real;
var
  F: real;
begin
  F := 0;
  for var i := 1 to n do
    F := F + 1 / FACT_13(i);
  FUN_13 := F;
end;



function FACT_15(n: integer): real;
var
  F: real;
begin
  F := 1;
  for var i := 1 to n do
    F := F * n;
  FACT_15 := F;
end;

function FUN_15(n: integer): real;
var
  i: integer;
  F: real;
begin
  F := 1;
  for i := 1 to n do 
    F := F * (1 + 1 / FACT_15(n));
  FUN_15 := F;
end;


begin
  Writeln('Y = (11) * (13) / (15)');
  Write('Введите N - ');
  Readln(n);
  Y := FUN_11(n) * FUN_13(n) / FUN_15(n);
  Writeln('Ответ - ', Y);
end.