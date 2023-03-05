var p,k,i,j,sum,max,min:integer;
    a1: array[1..10,1..30] of integer;
    a2: array[1..10] of integer;
    
begin
randomize;
for i:=1 to 10 do
    for j:=1 to 30 do
    a1[I,J]:= random(9);
for i:=1 to 10 do
begin
    for j:= 1 to 30 do
    write(' ',a1[I,J]);
    writeln
end;
for i:=1 to 10 do
begin
sum:=0;
for j:=1 to 30 do
sum:=sum+a1[i,j];
a2[i]:=sum;
end;
writeln('',a2);
max:=a2[1];
min:=a2[1];
for i:=1 to 10 do
if a2[i]> max then
  begin
    max:=a2[i];
    p:=i
  end
else
 if a2[i]< min then
   begin
 min:=a2[i];
 k:=i
 end;
 writeln(' Проработал больше часов:',p);
 writeln(' Проработал меньше часов:',k);
end.