var 
 // s := 'сссссвввввююююззззсссс'.Println;
 s:='ввввввввююююююююююззсссссссссссссссссвввввюююююззсссссссc';
  m := lst((0,0));
  m2 := lst((0,0));
  c : integer;
  s2, ss, s3 : string;
begin
  foreach var ch in s do begin
    var i,j: integer;
    case ch of
      'с': (i,j) := (1, 0);
      'ю': (i,j) := (-1, 0);
      'з': (i,j) := (0, -1);
      'в': (i,j) := (0, 1);
    end;
    m.Add((m[^1].Item1+i, m[^1].Item2+j)); 
  end;
  write(m);
  writeln();
  c := s.Length;
  while c <> 0 do begin
    for var i := c downto 2 do begin
      if m[c] = m[i] then
        c := i;
      end;
      s2 := s[c] + s2;
    c := c - 1;
  end;
  
  foreach var ch in s2 do begin
    var i,j: integer;
    case ch of
      'с': (i,j) := (1, 0);
      'ю': (i,j) := (-1, 0);
      'з': (i,j) := (0, -1);
      'в': (i,j) := (0, 1);
    end;
    m2.Add((m2[^1].Item1+i, m2[^1].Item2+j)); 
  end;
  
  writeln(m2);
  
  ss := '';
  c := s2.Length;
  for var k := c downto 1 do begin
    //writeln(Abs(m2[k].Item1) - Abs(m2[k - 1].Item1), ' ', (Abs(m2[k].Item2) - Abs(m2[k - 1].Item2)));
    if Abs(m2[k].Item1) - Abs(m2[k - 1].Item1) = 1 then begin
      ss := ss + 'ю';
    end;
    if Abs(m2[k].Item1) - Abs(m2[k - 1].Item1) = -1 then begin
      ss := ss + 'с';
    end;
    if Abs(m2[k].Item2) - Abs(m2[k - 1].Item2) = 1 then begin
      ss := ss + 'з';
    end;
    if Abs(m2[k].Item2) - Abs(m2[k - 1].Item2) = -1 then begin
      ss := ss + 'в';
    end;
  end;
  
  writeln();
  
  writeln(ss);
  
  
end.