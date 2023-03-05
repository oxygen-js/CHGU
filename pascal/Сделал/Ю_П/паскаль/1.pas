var N1,N2:integer;
p1,p2:real;
begin
  writeln('Введите число N1:');readln(N1);
  writeln('Введите число N2:');readln(N2);
  p1:=(N1+N2);
  p2:=(N1/p1)*100;
  writeln('% полученных валентинок:',p2);
  writeln('p1: ',p1);
end.