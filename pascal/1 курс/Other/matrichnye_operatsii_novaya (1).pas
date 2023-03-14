program fav; 
const n=3; 
var i,j,k:integer; 
A:array [1..n,1..n] of real; 
detA,det:real; 
pr:real; 
begin 
writeln('Westi a[i,j]'); 
for i:=1 to n do 
begin 
for j:=1 to n do 
    begin
    writeln('a[',i,'][',j,']');
    readln(a[i,j]); 
    end;
end; 
for i := 1 to n do 
    begin
      for j := 1 to n do 
        begin
          write(a[i, j]:0:2,' ');
        end;
      writeln;
end;
det:=(a[1,1]*a[2,2]*a[3,3])+(a[1,2]*a[2,3]*a[3,1])+(a[1,3]*a[2,1]*a[3,2])-(a[1,3]*a[2,2]*a[3,1])-(a[1,2]*a[2,1]*a[3,3])-(a[1,1]*a[2,3]*a[3,2]);
writeln('det=',det:0:2);
end.