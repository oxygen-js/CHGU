program matrice;
const n=5;
      m=5;
var U:array[1..5,1..5]of integer;
  i,j,s:integer;
  r:boolean;
begin
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      U[i,j]:=random(0,20);
      write(U[i,j]:4);
    end;
   writeln; 
  end;
  writeln;
  
s:=1;
for i:=1 to n do
  for j:=1 to m do
    s:=s+U[i,j];
    if (s=U[i,j]) then begin
      write('the number who repet is : ',s);
      end;
end.