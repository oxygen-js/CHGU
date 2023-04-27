var
 n:integer;
 i:integer;
 g:integer;
 sum:integer;
begin
 write('Введите n = ');readln(n);
 i:=1;
 g:=1;
 sum:=0;
while i<>n do 
  begin
   Sum:=sum +g;
   g:=g+2;
   i:=i+1;   
  end;
    write(Sum, ' ');
end.