//*********** гирлядна ***************************гирляда***********************
Const n=10;
type tarr = array[1..n] of byte;
var
  a,c:tarr;
  l:=0;
 i:integer;
//******************************************************************************
Procedure  Ps(); 
var i,f,r: integer;
begin
  r:=0;
  f:=0;
  
  //проверяем на выполнения условия задачи 
  for i:= 4 to n do begin  
  if ((a[i]=0) and (a[i-1]=0) and (a[i-2]=0)) then r:=r+1;
   if ((a[1]=0) and (a[2]=0)) or ((a[n-1]=0) and (a[n]=0))then f:=f+1;
       end; 
   if (r<1) and (f<1) then begin
       
     for i:= 1 to n do begin
       Write(a[i]:2)
      end;
      Writeln;
       l:=l+1;
   end;  
 end;
//******************************************************************************
Procedure Pb(k:integer);
 //Write('*****Горят гирлядны***** ',  l);
Var i,j:integer;
 
begin
 If k>n then begin
      
       Ps(); 
        Exit
    end;
    
    For i:=0 to 1 do begin
       If i=0 then a[k]:=1;
       If i=1 then a[k]:=0;
       Pb(k+1)
    end;
    
end;
//******************************************************************************
begin
    Pb(1);
     Write('*****Горят гирлядны***** ',  l);
end.