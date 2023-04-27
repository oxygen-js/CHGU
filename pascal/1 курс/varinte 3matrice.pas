{. «Ресторан1».
Имеются рецепты N блюд, в которых указаны какие продукты и в каком количестве необходимы
 для приготовления каждого блюда.
 Количество продуктов равно M. Имеется также стоимость одной единицы каждого продукта. 
 Определить стоимость самого дорогого и самого дешевого блюда.
}
Const n=20; 
      m=10;
Var Recept:array[1..n,1..m] of integer;
    PriceProduct:array[1..m] of integer;
    PriceEat:array[1..n] of integer;
    

program variante_3;
const n=10;
      m=5;
var U:array[1..N,1..M]of integer;
i,j,max,imax,min:integer;
begin
  
  for i:=1 to n do
  begin
    write('рецепты ',i,' : ');
    for j:= 1 to m do
    begin
      u[i,j]:=random(10,100);
      write(u[i,j]:4);
    end;
    writeln;
  end;
  writeln;
 max:=u[1,1];
 for i:=1 to n do
   for j:=1 to m do begin
     if(u[i,j]>max)then
       max:=u[i,j];
     end;
writeln; 
 min:=u[1,1];
 for i:=1 to n do
   for j:=1 to m do begin
     if(u[i,j]<min)then
       min:=u[i,j];
     end;   
     
     write(' самое дорогое ретцепты : ',max);
     writeln;
     write(' самая дешевая ретцепты : ',min) 
     
 end.