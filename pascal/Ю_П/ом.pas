var
  i, j, n: integer;
  a: array[1..10, 1..10] of integer;

begin
  writeln('n= ');
  readln(n);
  randomize;
  for i := 1 to n do 
  begin
    for j := 1 to n do   
    begin
      a[i, j] := random(100);
      write(a[i, j], ' ');
    end;
    writeln;
  end;
  writeln;
  // Поиск локальных минимумов
  for i := 1 to n do
    for j := 1 to n do
      if ((i = 1) or (a[i, j] < a[i - 1, j])) and
              ((j = 1) or (a[i, j] < a[i, j - 1])) and
              ((i = n) or (a[i, j] < a[i + 1, j])) and
              ((j = n) or (a[i, j] < a[i, j + 1])) then
        writeln('локальный минимум ', a[i, j]);
  readln
end.