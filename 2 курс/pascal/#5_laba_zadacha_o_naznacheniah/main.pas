var
  i, j, rezult, sm: integer;
  a: array[1..14, 1..3] of integer = 
  ((17, 48, 46),     
  (4, 48, 46),      
  (47, 28, 7),
  (41, 10, 47),
  (14, 18, 45),
  (50, 23, 46),
  (12, 48, 8),
  (11, 14, 23),
  (9, 44, 48),
  (31, 9, 46),
  (27, 26, 11),
  (30, 26, 24),
  (18, 13, 27),
  (14, 22, 9));

begin
  sm := 1;
  for i := 1 to 14 do
  begin
    if (a[i, 1] <= a[i, 2]) and (a[i, 1] <= a[i, 3])
    then
    begin
      writeln(sm, ' : ', 1);
      rezult := rezult + a[i, 1];
    end;
    
    if (a[i, 2] <= a[i, 1]) and (a[i, 2] <= a[i, 3])
    then
    begin
      writeln(sm, ' : ', 2);
      rezult := rezult + a[i, 2];
    end;
    
    if (a[i, 3] <= a[i, 2]) and (a[i, 3] <= a[i, 1])
    then
    begin
      writeln(sm, ' : ', 3);
      rezult := rezult + a[i, 3];
    end;
    sm := sm + 1; 
    for j := 1 to 3 do
  end;
  writeln('Нимаеньшаяя сумма выполнения работ: ', rezult);
end.