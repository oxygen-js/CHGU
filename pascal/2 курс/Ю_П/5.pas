Var x: real;
begin
  writeln('Введите время:');
  readln(x);
  if (x<7) or (x>16) then
    writeln('Неправильное время')
  else
  begin
if (x>=7) and (x<=7,3) then 
  writeln('Доброе утро!');
if (x>=12) and (x<17) then 
  writeln('Добрый день!');
if (x>=17) and (x<23) then 
  writeln('Добрый вечер!');
if (x>=23) or (x<8)  then 
  writeln('Доброй ночи!');
      
      end;
end.
  