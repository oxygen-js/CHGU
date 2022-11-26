uses GraphABC;
procedure plitk(x, y:integer; slant_right: boolean);
begin
  
  if slant_right then
  begin
    Line(x, y, x+60, y+60);
    Line(x+60, y-60, x, y);
    Line(x+60, y-60, x+120, y);
    Line(x+60, y+60, x+120, y);
  
    Line(x+15, y+15, x+75, y-45);
    Line(x+30, y+30, x+90, y-30);
    Line(x+45, y+45, x+105, y-15);
  end    
  else
  begin
    Line(x, y-60, x+60, y);
    Line(x+60, y, x+120, y-60);
    
    Line(x+75, y-15, x+15, y-75);
    Line(x+90, y-30, x+30, y-90);
    Line(x+105, y-45, x+45, y-105);
  end;

end;

var x,y:integer; slant_right: boolean;
begin
  x := -60;
  y := 0;
  slant_right := True;

  
  while y <= windowheight do
   begin
   
     while x <= windowwidth do
     begin        
      plitk(x, y, slant_right);
      x := x+120;
     end;
     
     if slant_right then
     begin
      slant_right := False;
      y := y+120;
      x := 0;
     end
     else
     begin
      slant_right := True;
      y := y;
      x := -60;
     end;
   end;
end.
