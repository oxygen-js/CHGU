// Перебор множеств
Var 
a: array [1..6] of integer;
i,b,k: integer;
s:string; 
Procedure Perebor(k:integer);
Var i:integer;
begin
    If k>6 then begin
        For i:=1 to 6 do Write(a[i]:2);
        Writeln;
        Exit
    end;
    For i:=0 to 6 do begin
       a[k]:=i;
       Perebor(k+1)
    end
end;

begin
writeln('Введите номер билетика');
readln(s);
if (length(s)=6)   then
 val(s,b,k);
for i:=1 to 6 do
begin
a[i]:=b mod 10;
b:=b div 10;
end;
if (a[1]+a[2]+a[3]=a[4]+a[5]+a[6]) then
writeln('Билетик счастливый')
else
  if (a[1]=a[2]+a[3]+a[4]+a[5]+a[6]) then
    writeln('Билетик счастливый')
  else
  if (a[1]+a[2]=a[3]+a[4]+a[5]+a[6]) then
    writeln('Билетик счастливый')
  else
  if (a[1]+a[2]+a[3]=a[4]+a[5]+a[6]) then
    writeln('Билетик счастливый')
  else
  if (a[1]+a[2]+a[3]+a[4]=a[5]+a[6]) then
    writeln('Билетик счастливый')
  else
  if (a[1]+a[2]+a[3]+a[4]+a[5]=a[6]) then
    writeln('Билетик счастливый')
  else
writeln('Билетик несчастливый');
 
 
end.