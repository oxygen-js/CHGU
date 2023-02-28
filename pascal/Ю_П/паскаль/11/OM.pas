var
  s1, s2 : string;
  i, j, k : integer;
begin
  s1 := 'aaaaaabtttttccccaaaaaabtttttccccaaaaaabtttttccccaaaaaabtttttcccc';
  s2 := s1[1];
  j := 1;
  k := 0;
  for i := 1 to s1.Length do begin
    if s1[i] = s2[j] then begin
      k := k + 1;
    end;
    if s1[i] <> s2[j] then begin
      s2 := s2 + k.ToString + s1[i];
      j := j + 2;
      k := 1;
    end;
  end;
  s2 := s2 + k;
  if s2.Length > s1.Length then
    writeln(s1)
  else 
    writeln(s2);
end.