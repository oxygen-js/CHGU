program trying;

var n:integer;
    x:real;


function nine(n:integer):real;
 var i:integer;
     x,Sum:real;
begin
  Sum:=0;
  x:=1;
  for i:=1 to n do begin
    x:=sin(x);
    Sum:=Sum+x;
  end;  
  Nine:=Sum 
end;


begin
  
readln(n);
  writeln(nine(n))

end.
