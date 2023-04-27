{Дан список студентов (25 человек) и их оценки, полученные на сессии по 5 предметам.
 Определить вид стипендии, которая будет назначена каждому студенту.
 Стипендии назначаются по следующим правилам:
повышенная, если все оценки равны 5, 
обычная, если нет двоек; }

program var1;
const n=25;
      m=5;
var f:array[1..n,1..m]of integer;
    g:array[2..5]of integer;
    i,j,k,max:integer;
    p1,p2,p3:boolean;
begin
  for i:=1 to n do
    for j:= 1 to m do
    begin
      f[i,j]:=random(2,5);
      f[15,j]:=5;
      f[21,j]:=5;
    end;
 writeln;
 for i:=1 to n do
 begin
   write(i,' --> ');
   for j:=1 to m do
     write(f[i,j]:3);
     p1:=True; For k:=1 to 5 do p1:=p1 and (f[i,k]=5);     
     p2:=True; For k:=1 to 5 do p2:=p2 or (f[i,k]=2);
     If p1 then Write(' Повышенная');
     If p2 then Write(' нет стипендии'); 
     If not p1 and not p2 then Write(' обычная стипендия');      
     writeln;
   end;
writeln;
{for i:=2 to 5 do 
begin
  k:=g[i];
  if 
end;}


end.