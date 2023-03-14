var i:integer;
S1,p,X,S2,S,N,Y:real;
begin
   writeln('Количество учеников:');readln(X);
  writeln('Плата за обучение:');readln(S);
  writeln('% не сдали сессию:');readln(N);
  Y:=X;
 S1:=S;
 S2:=S;
for i:= 1 to 4 do
 begin
   S1:=S1*Y;
    X:=X-(X*(N/100));
    S2:=S2*X;
    writeln('2=',S2);
 end;
 p:= S2-S;
  writeln('Разница между суммами',p);
end.