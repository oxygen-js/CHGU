var
  a,b: array[1..3, 1..3] of real;
  c: array[1..3, 1..3] of real;
  i, j, k: integer;

begin
  writeln('Первая матрица');
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      read(a[i, j]);
    end;
    writeln;
  end;
  writeln('Вторая матрица');
  for i := 1 to 3 do 
  begin
    for j := 1 to 3 do 
    begin
      read(b[i, j]);
    end;
    writeln;
  end;
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      c[i,j] := a[i,j]/b[i,j];
      write(' ',c[I,J]);
    end;
        writeln
    end;
  for i := 1 to 3 do
    begin
  if (c[I,1]=c[I,2]) and (c[I,2]=c[I,3]) then
    begin
    k:=k+1;
    end;
  end;
  if k = 3 then
   writeln('Матрицы подобны')
  else 
   write('Матрицы  не подобны');
end.