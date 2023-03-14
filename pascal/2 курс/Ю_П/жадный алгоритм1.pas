Var 
sm1,sm2,sm3,k,c,i,j,i1:integer;
res:array[1..1,1..14] of integer;
workers:array[1..1,1..14] of integer;

a:array[1..14,1..3] of integer=((16,10,29),
(50,26,14),(17,24,29),(10,33,35),(38,25,7),(22,15,8),
(29,16,49),(47,48,50),(17,18,22),(48,22,20),(20,34,31),
(42,6,32),(36,4,32),(49,42,16));

function min(x, y: integer): integer;
begin
if x < y then min := x else min := y;
end;

function max(x, y: integer): integer;
begin
if x > y then max := x else max := y;
end;

begin
     for i:=1 to 14 do
     if (a[i,1] = min(a[i,1],min(a[i,3],a[i,2]))) then begin
       res[1,i]:=a[i,1];
       sm1+=a[i,1];
       workers[1,i]:=1;
       end;
     for i:=1 to 14 do
     if (a[i,2] = min(a[i,2],min(a[i,1],a[i,3]))) then begin
       res[1,i]:=a[i,2];
       workers[1,i]:=2;
       sm2+=a[i,2];
       end;
    for i:=1 to 14 do
     if (a[i,3] = min(a[i,3],min(a[i,2],a[i,1]))) then begin
       res[1,i]:=a[i,3];
       workers[1,i]:=3;
       sm3+=a[i,3];
     end;
   
for i1:=1 to 14 do  
     writeln('часы бригад: ',res[1,i1]);
     writeln('Расстановка бригад: ',workers[1]);
     writeln('макc часов: ',max(sm1,max(sm2,sm3)));
     writeln(sm1);
     writeln(sm2);
     writeln(sm3);
end.