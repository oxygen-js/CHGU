

var
  i, j, rezult1, rezult2, rezult3, sm, prov, rez: integer;
  a: array[1..14, 1..3] of integer = ((16, 10, 29),
  (50, 26, 14), (17, 24, 29), (10, 33, 35), (38, 25, 7), (22, 15, 8),
  (29, 16, 49), (47, 48, 50), (17, 18, 22), (48, 22, 20), (20, 34, 31),
  (42, 6, 32), (36, 4, 32), (49, 42, 16));

begin
  sm := 1;
  for i := 1 to 14 do
  begin
    
    if (a[i, 1] <= a[i, 2]) and (a[i, 1] <= a[i, 3])
    then
    begin
      if (rezult1 + a[i, 1] <= rezult2 + a[i, 2]) or (rezult1 + a[i, 1] <= rezult3 + a[i, 3])
       or (rezult1 <= rezult2) or (rezult1 <= rezult3) 
      then
      begin
        writeln(sm, ' : ', 1);
        rezult1 := rezult1 + a[i, 1];
        prov := a[i, 1];
        
      end;
    end;
    
    if prov <> a[i, 1] then 
      if (a[i, 2] <= a[i, 1]) or (a[i, 2] <= a[i, 3])
      then
      begin
        
        if (rezult2 + a[i, 2] <= rezult3 + a[i, 3] + a[i, 3]) then
          if (rezult2 + a[i, 2] <= rezult3 + a[i, 3])
          and (rezult2 + a[i, 2] <= rezult3 + a[i, 3] + a[i + 1, 3]) or (rezult2 <= rezult1) or (rezult2 <= rezult3)
          then
          begin
            writeln(sm, ' : ', 2);
            rezult2 := rezult2 + a[i, 2];
            prov := a[i, 2];
            
          end;
      end;
    
    if (prov <> a[i, 1]) and (prov <> a[i, 2]) then
    begin
      writeln(sm, ' : ', 3);
      rezult3 := rezult3 + a[i, 3];
    end;
    sm := sm + 1; 
  end;
  
  writeln('бригада1: ', rezult1);
  writeln('бригада2: ', rezult2);
  writeln('бригада3: ', rezult3);
  if (rezult1 >= rezult2) and (rezult1 >= rezult3) then
    rez := rezult1;
  if (rezult2 >= rezult1) and (rezult2 >= rezult3) then
    rez := rezult2;
  if (rezult3 >= rezult1) and (rezult3 >= rezult2) then
    rez := rezult3;
  writeln('Ответ: ', rez)
end.