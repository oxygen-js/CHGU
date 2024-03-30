{Имеются данные о цене на хлеб в течение 12 месяцев в шести городах России. Определить,
 в каком городе и в каком месяце наблюдается повышение цены на хлеб по сравнению с определенным месяцем.}
program variant_13;
const m=6;
      n=12;
var U:array[1..n,1..m] of integer;

 i,j,max,Imax,Jmax:integer;
begin
  //матричная печать
  for i:=1 to m do
  begin
    write('  г',i);
  end;
  writeln;
  write('  ----------------------');
  writeln;
  for i:=1 to n do
     begin       
        for j:=1 to m do 
          begin
              U[i,j]:=random(10,30);
               write(U[i,j]:4);
         end;
         writeln;
      end;
writeln;

 
 max:=0;
 for j:=1 to m do
 for i:=1 to n-1 do
  if u[i+1,j]-u[i,j]>Max then 
    begin    
      max:=u[i+1,j]-u[i,j];
      Imax:=i;
      Jmax := j;
   end;   
   
  write('наибольшее разность в месяц= ',Imax,': в городе ',Jmax,'=',max);
  end.