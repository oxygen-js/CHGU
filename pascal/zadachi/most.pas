Const n=4;
Var a:array[1..n] of integer=(1,2,4,10);
b:array[1..n] of integer;
c:array[1..n] of integer;
    i,sm,sum,sm1,j,k,k1,val,z:integer;
      
function min(x, y: integer): integer;
begin
if x < y then min := x else min := y;
end;
function max(x, y: integer): integer;
begin
if x < y then max := y else max := x;
end;
begin
   sum:=0;
   k:=1000;
   k1:=0;
  write('ход 0 - левая сторона - ',a,' - правая сторона - ',b);
  writeln;
  for i:=1 to n do begin
    c[i]:=a[i];
    if sm+a[i]<=3 then begin
     k1:=max(k1,a[i]);
     sm:=a[i]+sm;
    b[i]:=a[i];
    c[i]:=0;
    
    end;
  end;
    sum:=sum+k1;
   
  
 writeln('ход 1 - левая сторона - ',c,' - правая сторона - ',b);
 writeln('Сумма ',sum);
 k:=1000;
 for i:=1 to n do begin
   if b[i]<>0 then
    k:=min(k,b[i]);
    end;
    
 for i:=1 to n do begin
   if k=b[i] then
     val:=i;
   end;
   
  for i:=1 to n do begin
    if b[i]=k then begin
     sum:=sum+b[i];
    c[val]:=k;
    b[i]:=0;
  end;
  end;
 writeln('ход 2 - левая сторона -  ',c,' - правая сторона - ',b);
 writeln('Сумма ',sum);
 sm:=0;
 for i:=1 to n do begin
    if c[i]<>0 then begin
    if sm+c[i]>3 then begin
      k1:=max(k1,c[i]);
    sm:=c[i]+sm;
    b[i]:=c[i];
    
    c[i]:=0;
    end;
    end;
  end;
  sum:=sum+k1;
 writeln('ход 3 - левая сторона - ',c,' - правая сторона -',b);
 writeln('Сумма ',sum);
 k:=1000;
 for i:=1 to n do begin
   if b[i]<>0 then
    k:=min(k,b[i]);
    end;
    
 for i:=1 to n do begin
   if k=b[i] then
     val:=i;
   end;
   
  for i:=1 to n do begin
    if b[i]=k then begin
    c[val]:=k;
    b[i]:=0;
  end;
  end;
 sum:=sum+k; 
 writeln('ход 4 - левая сторона - ',c,' - правая сторонаг - ',b);
writeln('Сумма ',sum); 
 sm:=0;
 k1:=0;
 for i:=1 to n do begin
    if c[i]<>0 then begin
    if sm+c[i]<=3 then begin
       k1:=max(k1,c[i]);
   
    sm:=c[i]+sm;
    b[i]:=c[i];
    c[i]:=0;
    end;
    end;
  end;
  sum:=sum+k1; 
 writeln('ход 5 - левая сторона -  ',c,' - правая сторона - ',b);
 writeln('Сумма ',sum);
 
 
end.