program fuction;
var n:integer;
    y,x,v,w:real;

Function Fact(n:integer):integer;
Var i:integer;
       F:integer;
Begin
	F:=1;
	For i:=1 to n do F:=F*i;
	Fact:=F
End;

    
function one(n:integer):real;
Var x:real;
    i:integer;
begin
  x:=1;
  For i:=1 to n do
    x:=x*(1+1/power(i,n-i+1));
  One:=x  
end;

function two(n:integer):real;
Var Sum:real;
    i:integer;
begin
 Sum:=0;
 For i:=1 to n do begin
    x:=(i+1)/Fact(i);
    If i mod 2=0 then Sum := Sum-x
                 else Sum := Sum+x;  
 end; 
 Two:=Sum
end;

function five(n:integer):real;
Var Sum:real;
    i:integer;
begin
    Sum:=0;  
   For i:=1 to n do 
      Sum:=Sum+Sin(1+0.1*(i-1))/Fact(i);
   Five:=Sum   
end;

function Seven(n:integer):real;
Var Sum:real;
    i:integer;
begin
   Sum:=1;  
   For i:=1 to n do 
   //   Sum:=Sum+Sin(1+0.1*(i-1))/Fact(i);
   Seven:=Sum   
end;

begin
  n:=3;
  writeln(seven(n))
  //write('write the number n= ');
  //readln(n);
  //y:=five(n)/(one(n)+two(n));
  //writeln(y);
end.