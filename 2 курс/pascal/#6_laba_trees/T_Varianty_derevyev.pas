const maxn = 100;
var
  n, day, totaldays, i, j: integer;
  a: array[1..maxn, 1..maxn] of integer;
  b: array[1..maxn] of integer;

procedure readdata;
var
  i, j: integer;
begin
  readln(n);
  for i := 1 to n do
    for j := 1 to n do
      read(a[i, j]);
end;

procedure workdays;
var
  i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      if a[j, i] = 1 then
        b[i] := b[i] + b[j];
end;

begin
  readdata;
  for i := 1 to n do
    b[i] := 1;
  day := 1;
  workdays;
  for i := 1 to n do
    begin
      totaldays := totaldays + b[i];
      if b[i] > day then
        day := b[i];
    end;
  writeln(day);
  writeln(totaldays);
  for i := 1 to n do
    write(b[i], ' ');
end.