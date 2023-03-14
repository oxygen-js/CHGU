//Задача коммивояжера
Const n=8;
Type SetInt=Set of byte;
Var a,aBest:array[1..n] of byte;
    r:array[1..n,1..n] of integer;
    i,j,Lmin,t1,t2:integer;

Procedure Perebor(k:integer;m:SetInt);
Var i,L:integer;
begin
   If k>n then begin
       L:=0;
       For i:=1 to n-1 do L:=L+r[a[i],a[i+1]];
       If L<Lmin then begin
            Lmin:=L;
            aBest:=a
       end;
       Exit
   end;
   For i:=1 to n do
      If i in m then begin
         a[k]:=i;
         Perebor(k+1,m-[i])
      end

end;


Begin
   For i:=1 to n do
      For j:=1 to n do
        r[i,j]:=1+Random(100);        
   For i:=1 to n do r[i,i]:=0;   
    
    For i:=1 to n do begin
      For j:=1 to n do Write(r[i,j]:4);      
      Writeln
    end;
    
    Lmin:=MaxInt;
    
    t1:=MilliSeconds;
    Perebor(1,[1..n]);
    t2:=MilliSeconds;
    Writeln('t=',t2-t1);
    
    
    For i:=1 to n do Write(aBest[i]:3);
    Writeln;
    Writeln('L=',Lmin)
end.