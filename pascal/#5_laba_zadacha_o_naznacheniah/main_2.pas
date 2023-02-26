const
  N = 8;
    Works: array [1..N, 1..N] of integer = (
        ( 7,  0, 47, 76,  8, 67, 93, 92),
        (36, 22, 72, 64, 88, 12,  7, 81),
        ( 1, 66, 98, 24, 52, 59, 96,  3),
        (60, 87, 92, 68, 56, 40, 43, 40),
        (30, 38, 83, 54, 35, 31, 92, 87),
        ( 4, 87, 26, 84, 45, 89, 23, 62),
        (81, 21,  1,  0, 29, 69, 39, 70),
        (73, 36, 18, 92, 70, 35, 99, 62)
   );



var
  i: integer;
  best_work_machine: array [1..N] of integer;
  list_worker: array [1..N] of integer;
  

procedure find_max_power();
var
  index, max: integer;
begin  
  for var i := 1 to N do
  begin
    for var j := 1 to N do 
    begin
      if (best_work_machine[j] > 0) then continue;
      if (Works[i][j] > max) then
      begin
        max := Works[i][j];
        index := j;
        list_worker[j] := i;
      end;
    end;
    
    best_work_machine[index] := max;
   
    max := 0;
    index := 0;
  end;
end;


begin
  find_max_power();
  for var k := 1 to N do
    Writeln('Станок №', k, '; Рабочий №', list_worker[k], ' = ', best_work_machine[k], ' деталей/час');
end.