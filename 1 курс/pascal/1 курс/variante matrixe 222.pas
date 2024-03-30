{15. «Тестирование»
С помощью 7 тестов проверялась сообразительность 30 детей.
 Каждый ребенок за каждый тест получал оценки от 0 до 5. 
 Определить наиболее часто встречающуюся оценку. 
 Если таких оценок несколько, то распечатать их все.}
const
    L=30;
    M=7;
var
  U:array[1..L,1..M]of Integer;
  f:array[0..5] of integer;     // частота оценок
  
  i,j:integer;
  k,Max:integer;
begin
for i:= 1 to L do
begin
  for j:= 1 to M do
  begin
    U[i,j]:=random(6);
  end;
end;
Writeln;
Writeln;
for i:=1 to L do 
begin
  Write(i,' ');
  for j:=1 to M do write(U[i,j]:3);
  Writeln  
end;

for i:=1 to L do
  for j:=1 to M do
  begin
    k:=U[i,j];
    f[k]:=f[k]+1
  end;  

Writeln;      
For i:=0 to 5 do Writeln(i,' - ',f[i]:3);  

max:=0;
For i:=0 to 5 do
  If f[i]>Max then begin
    Max:=f[i];
  end;
Writeln;

For i:=0 to 5 do
 If f[i]=Max then
   Writeln('Max=',i,' --> ',Max);

end.