Program Cheburashka;
uses GraphABC;


procedure plitk(x1, y1, x2, y2: integer);
//var u:real;
//    i:byte;
//    x1,y1:integer;
begin

  Line(60, 0, 0, 60);
  Line(0, 60, 60, 120);
  Line(60, 120, 120, 60);
  Line(120, 60, 60, 0);
  
//circle(x,y,3);
//u:=0;
//for i:=1 to 4 do
// begin
//  x1:=x+round(3*cos(u));
//  y1:=y-round(3*sin(u));
//  line(x1,y1,x1+round(r*cos(u-pi/8)),y1-round(r*sin(u-pi/8)));
//  line(x1,y1,x1+round(r*cos(u-pi/8)),y1-round(r*sin(u-pi/8)));
//  line(x1,y1,x1+round(r*cos(u+pi/8)),y1-round(r*sin(u+pi/8)));
//  line(x1,y1,x1+round(r*cos(u+pi/8)),y1-round(r*sin(u+pi/8)));
//  u:=u+pi/2;
// end;
end;



Begin

  plitk();


End.


























//procedure plitk(x,y:integer);
//var u:real;
//    i:byte;
//    x1,y1:integer;
//begin
//circle(x,y,3);
//u:=0;
//for i:=1 to 4 do
// begin
//  x1:=x+round(3*cos(u));
//  y1:=y-round(3*sin(u));
//  line(x1,y1,x1+round(r*cos(u-pi/8)),y1-round(r*sin(u-pi/8)));
//  line(x1,y1,x1+round(r*cos(u-pi/8)),y1-round(r*sin(u-pi/8)));
//  line(x1,y1,x1+round(r*cos(u+pi/8)),y1-round(r*sin(u+pi/8)));
//  line(x1,y1,x1+round(r*cos(u+pi/8)),y1-round(r*sin(u+pi/8)));
//  u:=u+pi/2;
// end;
//end;
 
 
 //while y<=windowheight do
// begin
//  x:=r;
//  while x<=windowwidth do
//   begin
//    plitk(x,y,r);
//    x:=x+2*r;
//   end;
//  y:=y+2*r
// end;