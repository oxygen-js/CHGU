const
  P = 1;     //процессор
  Vi = 25;   //Время исполнения
  t = 60;    //Время
  Ti = 5;    //время поступления на обработку i-ой программы

var   
  C: array[1..P, 1..2] of integer;
  O := lst((Vi, 1)); //возвращает список, заполненный указанными значениями
  g, i, j, f: integer;
  cout,srsumm :real;
begin
  f := 0;
  for i := 1 to t do begin  //один круг цикла равен 1 минуте
    if g <= 0 then begin
      O.Add((O[^1].Item1, O[^1].Item2 + 1));  
      g := Ti;
      for j := 1 to P do begin
        if C[j, 1] <= 0 then begin
          f := f + 1;
          C[j, 1] := Vi;
          C[j, 2] := f;
          break;
        end;
      end;
    end;
    for j := 1 to P do begin
      if C[j, 1] > 0 then
        C[j, 1] := c[j, 1] - 1;
    end;
    g := g - 1;
  end;
  for i := 1 to P do begin
    if (C[i, 1] < Vi) then
      writeln('Процессор ', i, ' выполняет ', C[i, 2],' приоритетные программы')
    else
      writeln('Процессор ', i, ' готовится выполнить ', C[i, 2],' программ')
  end;
  
 writeln;
    srsumm := t/C[i, 2];
    writeln ('среднее время загрузки ',srsumm);
     writeln;
    
  Write('Программы ');
  for i := f to O.Count - 2 do
  begin
    Write(O[i].Item2, ' ');
  end;
  Write('в очереди');
end.
  