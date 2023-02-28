var x:integer;
p1:real;
begin
  writeln('Введите x:');readln(x);
  p1:=(Log(2+2*x)/Log(10)+tan(2*x-8))*(6-x);
  writeln('p1:',p1);

end.