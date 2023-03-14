Uses GraphABC;
Const n=5;
Var t:array of Point;
i,j,xc,yc,r: integer;
a:real;

Procedure Poly(i,j:integer);
begin
     SetLength(t,n);
     xc:=i*30;yc:=j*30;r:=16;
     For i:=0 to n-1do begin
         a:=2*Pi*i/n;
         t[i].X:=Round(xc+r*Cos(a));
         t[i].Y:=Round(yc+r*Sin(a));
     end;
     
     Polygon(t);
end;

begin
  For i:=1 to 20 do
  For j:=1 to 20 do
     Poly(i,j);
end.