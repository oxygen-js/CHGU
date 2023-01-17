uses GraphABC;
const
    min = 1;    
procedure Lineto1(x, y : integer; L, u : reaL);
var
  test1, test2: integer;
begin
    test1 := Round(x + l * cos(u));
    test2 := Round(y - l * sin(u));
    Line(x, y, test1, test2);
end;
 
procedure Draw(x, y : integer; L, u : reaL);
 
begin
    if L > min then 
    begin
        Lineto1(x, y, L, u);
        x := Round(x + L * cos(u));
        y := Round(y - L * sin(u));
        Draw(x, y, L*0.45, u - 14*pi/30);
        Draw(x, y, L*0.45, u + 14*pi/30);
        Draw(x, y, L*0.7, u + pi/500);
    end;
end;
 
begin
 
   CLearWindow;
    Draw(360, 460, 140, pi/2)   
end.