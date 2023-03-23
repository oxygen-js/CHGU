var i,j,k,m,l,n,c,z,max_value,min_value,zn,val,o,p:integer;
res:array[1..1,1..8] of byte;
workers:array[1..1,1..8] of byte;
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
 for i:=1 to 8 do
  for j:=1 to 8 do
   for k:=1 to 8 do
    for m:=1 to 8 do
      for l:=1 to 8 do
        for n:=1 to 8 do
          for c:=1 to 8 do
            for z:=1 to 8 do
            begin
             if (i<>j)and (j<>k) and (k<>m) and (m<>l) and (l<>n) and 
                (n<>c)and (c<>z) and (i<>k) and (i<>m) and (i<>l) and 
                (i<>n)and (i<>c) and (i<>z) and (j<>m) and (j<>l) and 
                (j<>n)and (j<>c) and (j<>z) and (k<>l) and (k<>n) and
                (k<>c)and (k<>z) and (m<>n) and (m<>c) and (m<>z) and
                (l<>c)and (l<>z) and (n<>z) 
                
                then begin
            zn:=zn+1;
      writeln(a[i,1],' ',a[j,2],' ',a[k,3],' ',a[m,4],' ',a[l,5],' ',a[n,6],' ',
      a[c,7],' ',a[z,8]);
      
      //writeln(min(a[i,1],min(a[j,2],min(a[k,3],min(a[m,4],min(a[l,5],min(a[n,6],
      //min(a[c,7],a[z,8]))))))));
      //writeln;
      min_value:=min(a[i,1],min(a[j,2],min(a[k,3],min(a[m,4],min(a[l,5],min(a[n,6],
      min(a[c,7],a[z,8])))))));

      val:=max(val,min_value);
      
      if val = min(a[i,1],min(a[j,2],min(a[k,3],min(a[m,4],min(a[l,5],min(a[n,6],
      min(a[c,7],a[z,8]))))))) then begin
        workers[1,1]:=i;workers[1,2]:=j;workers[1,3]:=k;workers[1,4]:=m;workers[1,5]:=l;
        workers[1,6]:=n;workers[1,7]:=c;workers[1,8]:=z;
      res[1,1]:=a[i,1];res[1,2]:=a[j,2];res[1,3]:=a[k,3];res[1,4]:=a[m,4];res[1,5]:=a[l,5];
      res[1,6]:=a[n,6];res[1,7]:=a[c,7];res[1,8]:=a[z,8];
      end;
                     
      end;
     end;
      writeln('На 1 станке работник №: ',workers[1,1],' С производительностью: ',res[1,1]);
      writeln('На 2 станке работник №: ',workers[1,2],' С производительностью: ',res[1,2]);
      writeln('На 3 станке работник №: ',workers[1,3],' С производительностью: ',res[1,3]);
      writeln('На 4 станке работник №: ',workers[1,4],' С производительностью: ',res[1,4]);
      writeln('На 5 станке работник №: ',workers[1,5],' С производительностью: ',res[1,5]);
      writeln('На 6 станке работник №: ',workers[1,6],' С производительностью: ',res[1,6]);
      writeln('На 7 станке работник №: ',workers[1,7],' С производительностью: ',res[1,7]);
      writeln('На 8 станке работник №: ',workers[1,8],' С производительностью: ',res[1,8]);
      writeln;
     writeln('Максимальное значение линии: ',val);
     writeln('линия: ',res[1]);
              end.