uses crt,graphabc;
var x,y:integer; i : real;
begin
hidecursor;
repeat
repeat
         i:=i+pi/100;
         x:=round(100*(-cos(i)));
         y:=round(10*(sin(i)));
         lockdrawing;
         ClearWindow;
         line(250,0,x+250,y+250);
         circle(x+250,y+250,50);
         redraw;
         sleep(10);
until i >= pi;
i:=0;
repeat
         i:=i+pi/100;
         x:=round(100*(cos(i)));
         y:=round(10*(sin(i)));
         lockdrawing;
         ClearWindow;
         line(250,0,x+250,y+250);
         circle(x+250,y+250,50);
         redraw;
         sleep(10);
until i >= pi;
If i >= pi then i := 0;
until keypressed;
end.