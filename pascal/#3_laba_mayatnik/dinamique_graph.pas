uses GraphABC;
var x1,x2,r,y:integer;
begin
setWindowSize (700,200);
centerwindow;
r:=20;
x1:=r;
x2:=windowwidth-r;
y:=windowheight div 2;
lockdrawing;
while x2-x1>=2*r do
 begin
  clearwindow;
  setbrushcolor(clRed);
  circle (x1,y,r);
  setbrushcolor(clBlue);
  circle (x2,y,r);
  sleep(10);
  x1:=x1+2;
  x2:=x2-2;
  redraw;
 end;
while x1>=r do
 begin
  clearwindow;
  setbrushcolor(clGreen);
  circle (x1,y,r);
  setbrushcolor(clPurple);
  circle (x2,y,r);
  sleep(10);
  x1:=x1-2;
  x2:=x2+2;
  redraw;
 end;
end.
