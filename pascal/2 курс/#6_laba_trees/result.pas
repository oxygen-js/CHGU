const
  n = 9;
  Matrix: array[1..n, 1..n] of integer = 
  ( (1, 0, 0, 0, 0, 0, 0, 0, 0),
    (0, 1, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, 1, 0, 0, 0, 0, 0, 0),
    (0, 0, 0, 1, 0, 0, 0, 0, 0),
    (0, 0, 0, 0, 1, 0, 0, 0, 0),
    (0, 0, 0, 0, 0, 1, 0, 0, 0),
    (0, 0, 0, 0, 0, 0, 1, 0, 0),
    (0, 0, 0, 0, 0, 0, 0, 1, 0),
    (0, 0, 0, 0, 0, 0, 0, 0, 1));

type
  Data = Record
    sum_day_stage: integer;
    is_complete: boolean;
  end;

var
  Stages: array[1..3] of Data;
  i, j, k, all_day, stage: integer;

begin
  
  Stages[1].sum_day_stage := 0;
  stage := 1;
  
  for i := 1 to n do
  begin
    if (i = 6) or (i = 9) then stage += 1;
    for j := 1 to n do
    begin
      if Matrix[i,j] = 1 then 
      begin
        Stages[stage].sum_day_stage += j;
        all_day += j;
      end;
    end;
  end;
  
  for i := 1 to stage do
  begin
    Writeln('Этап №', i, ' : ', Stages[i].sum_day_stage);
  end;
  
  Writeln('Всего дней : ', all_day);
  
end.  