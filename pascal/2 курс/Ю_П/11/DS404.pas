const
  c = 5;     //Кол-во пользователей
  t = 50;    //Время
  s = 2;     //скорость послупления клиентов
  s2 = 20;   //время работы пользователя // можно сделать рандомно
var   
  m := lst((0, 0));
  P: array[1..c, 1..2] of integer;
  k : integer;
  f: integer;
begin
  m.Clear();
  f := 0;
  for var i := 1 to t do begin
    if i mod s = 1 then begin
      f := f + 1;
      m.Add((s2, f));
      writeln(i,' ', f);
    end;
    for var j := 1 to c do begin
      p[j, 1] := p[j, 1] - 1;
      if (p[j, 1] <= 0) and (m.Count > 0) then begin
        p[j, 1] := m[0].Item1;
        p[j, 2] := m[0].Item2;
        m.RemoveAt(0); // удаляем пользователя из очереди
      end;
    end;
  end;
  write('Пользователи: ');
  for var i := 0 to m.Count - 1 do begin
    write(m[i].item2, ' ');
  end;
  write('в очереди');
  writeln();
  writeln(m);
end.
  

    