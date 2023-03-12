const
  c = 10;
var
  slovo : array[1..c] of string := ('татарстан',
									 'диверсификация',
									 'субботник',
									 'анфилада',
									 'кодировщик',
									 'привратник',
									 'кататония',
									 'сигнализация',
									 'информатика',
									 'информация');
	s1, s2 : string;
	k1, k2 : integer;
begin
  s2 := '';
  k2 := 0;
  readln(s1);
  for var i := 1 to c do begin
    k1 := 0;
    for var j := 1 to s1.Length do begin
      if (s1[j] <> ' ') and (s1[j] <> slovo[i][j]) then begin
        k1 := k1 + 1;
      end;
    end;
    if k1 = 0 then begin
      k2 := k2 + 1;
      writeln(slovo[i]);
    end;
  end;
  if k2 = 0 then begin
      writeln('Подходящих слов не найдено в библиотеке');
    end;
end.									 