var N1,N2,T1,T2:integer;
p1,p2:real;
begin
  writeln('Введите число N1:');readln(N1);
  writeln('Введите число N2:');readln(N2);
  writeln('Введите число T1:');readln(T1);
  writeln('Введите число T2:');readln(T2);
   p1:=N1/T1;
   p2:=N2/T1;
   If p1<p2 Then
     begin
   writeln('Большая эффективность общения у Лены');
   end
  else 
    begin
   writeln('Большая эффективность общения у Кати');
  end;
   end.