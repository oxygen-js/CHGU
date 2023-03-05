var i,i1,i2,i3,i4,i5,i6,i7,i8,j,sm,i11,i22,i33,x,k:integer;
res:array[1..1,1..8] of byte;
works:array[1..1,1..8] of byte;
    a:array[1..8,1..8] of byte=((84,36,67,56,10,77,39,40),
(93,52,1,34,88,55,6,18),(22,20,21,30,92,36,98,15),
(77,18,21,55,73,28,75,95),(19,59,34,35,98,49,39,40),
(34,9,75,58,51,23,60,89),(58,40,40,98,58,97,19,64),
(37,87,0,7,98,37,19,25));

function min(x, y: integer): integer;
begin
if x < y then min := x else min := y;
end;

function max(x, y: integer): integer;
begin
if x > y then max := x else max := y;
end;

begin
  //1
 for i:=1 to 8 do 
     sm:=max(a[i,1],sm);
     works[1,1]:=sm;
     for i:=1 to 8 do 
     if works[1,1] = a[i,1] then 
      res[1,1]:=i;
   
  
  //2
  sm:=0;
  for i1:=1 to 8 do 
    if (i1<>res[1,1]) then 
     sm:=max(a[i1,2],sm);
     works[1,2]:=sm;
     for i:=1 to 8 do
     if works[1,2] = a[i,2] then 
      res[1,2]:=i;
     
     
  //3
  sm:=0;
  for i2:=1 to 8 do begin
    if (i2<>res[1,1]) and (i2<>res[1,2]) then 
     sm:=max(a[i2,3],sm);
     works[1,3]:=sm;
     for i:=1 to 8 do
     if works[1,3] = a[i,3] then 
      res[1,3]:=i;
   end;
   
  //4
  sm:=0;
  for i3:=1 to 8 do
    if (i3<>res[1,1]) and (i3<>res[1,2])and (i3<>res[1,3]) then begin
   sm:=max(a[i3,4],sm);
     works[1,4]:=sm;
     for i:=1 to 8 do
     if works[1,4] = a[i,4] then 
      res[1,4]:=i;
  end;
  
  //5
  sm:=0;
  for i4:=1 to 8 do
    if (i4<>res[1,1]) and (i4<>res[1,2])and (i4<>res[1,3]) 
    and (i4<>res[1,4]) then begin
   sm:=max(a[i4,5],sm);
     works[1,5]:=sm;
     for i:=1 to 8 do
     if works[1,5] = a[i,5] then 
      res[1,5]:=i;
  end;
  
  //6
  sm:=0;
  for i5:=1 to 8 do
    if (i5<>res[1,1]) and (i5<>res[1,2])and (i5<>res[1,3]) 
    and (i5<>res[1,4])and (i5<>res[1,5]) then begin
   sm:=max(a[i5,6],sm);
     works[1,6]:=sm;
     for i:=1 to 8 do
     if works[1,6] = a[i,6] then 
      res[1,6]:=i;
  end;
  
  //7
  sm:=0;
  for i6:=1 to 8 do
    if (i6<>res[1,1])and(i6<>res[1,2])and(i6<>res[1,3]) 
   and (i6<>res[1,4])and (i6<>res[1,5])and (i6<>res[1,6]) then begin
    sm:=max(a[i6,7],sm);
     works[1,7]:=sm;
     for i:=1 to 8 do
     if works[1,7] = a[i,7] then 
      res[1,7]:=i;
  end;
  
  //8
  sm:=0;
  for i7:=1 to 8 do
    if (i7<>res[1,1])and(i7<>res[1,2])and(i7<>res[1,3])and(i7<>res[1,7])
   and (i7<>res[1,4])and (i7<>res[1,5])and (i7<>res[1,6]) then begin
    sm:=max(a[i7,8],sm);
     works[1,8]:=sm;
     for i:=1 to 8 do
     if works[1,8] = a[i,8] then 
      res[1,8]:=i;
  end;
  
  x:=100;
  writeln('время выполнения: ',works[1]);
  writeln('расстановка: ',res[1]);
  for i:=1 to 8 do begin
    x:=min(works[1,i],x);
    end;
    writeln('минимальное кол-во часов: ',x)
              end.