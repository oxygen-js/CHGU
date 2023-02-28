const m = 5000000;
var x,y:array[1..m] of integer;
    i,t1,t2:integer;
    pr,s,kvx,s1,s2,kvy,koren,otv:real;
begin
  randomize;  
  for i:=1 to m do begin
    x[i]:=random(5000);
    y[i]:=random(5000);
  end; 
  s:=0;
  s1:=0;
  s2:=0;
  t1:=Milliseconds;
  //  числитель
  for i:=1 to m do begin
    pr:=x[i]*y[i]; //числитель
    s:=s+pr; 
    kvx:=x[i]*x[i];//возведение в квадрат в знаменателе x
    s1:=s1+kvx;
    kvy:=y[i]*y[i];//возведение в квадрат в знаменателе y
    s2:=s2+kvy;
  end;
   //возведение в квадрат в знаменателе x
//  for i:=1 to m do
//
//  begin
//    kvx:=x[i]*x[i];
//    s1:=s1+kvx;
//  end;
  //возведение в квадрат в знаменателе y
//  for i:=1 to m do begin
//    kvy:=y[i]*y[i];
//    s2:=s2+kvy;
//  end;
  koren:=sqrt(s1) * sqrt(s2);// корень из x y в знаменателе
  otv:=s/koren;
  t2:=Milliseconds;
//  writeln('числитель ',s);
//  writeln('значения вектора x в квадрате ',s1);
//  writeln('значения вектора y в квадрате ',s2);
//  writeln('корень из произведения ',koren);
  writeln('угол между N-мерными векторами  равен ',otv);
  writeln(t2-t1);
end.