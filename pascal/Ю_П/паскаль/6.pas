var i:integer;
S1,p,X,X1,S2,S,N,Y:real;
begin
  writeln('Количество учеников:');readln(X);
  writeln('Плата за обучение:');readln(S);
  writeln('% не сдали сессию:');readln(N);
  X1:=0;
  Y:=X-X1;
for i:= 1 to 4 do
 begin
    X1:=X1+(Y*(N/100));
    Y:=X-X1;
    S2:=S2+S*Y;
    writeln('X1=',X1);
    writeln('Y=',Y);
    writeln('S2=',S2);
 end;
 S1:= (S*X)*4;
 p:= S1-S2;
  writeln('Разница между суммами: ',p);
end.