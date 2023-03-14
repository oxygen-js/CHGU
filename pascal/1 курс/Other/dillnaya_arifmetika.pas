procedure Vir (var s1, s2 :string; var l :integer); //Выравнивание прибавлением ну-лей 
    var i, ls1, ls2: integer; 
    begin
    ls1:= length(s1); 
    ls2:= length(s2); 
     
    if (ls1 > ls2) then begin 
       
      l:= ls1; 
      for i:=1 to l - ls2 do 
        s2:= '0' + s2; 
       
    end 
    else begin 
       
      l:= ls2; 
      for i:=1 to l - ls1 do 
        s1:= '0' + s1; 
       
    end; 
     
  end; 
   
   
function P (a, b :string):string; //Сложение 
  var x, x1, x2: integer; 
  var i, k, l :integer; 
  var s, c :string; 
  var n :boolean; 
   
  begin 
     
    Vir(a,b,l); 
    n:= false; 
    s:= ''; 
     
    for i:=l downto 1 do begin 
       
      val(a[i],x1,k); 
      val(b[i],x2,k); 
      x:=x1+x2; 
       
      if n then x:=x+1; 
      if x>9 then n:=true else n:=false; 
      x:=x mod 10; 
       
      str(x,c); 
      s:= c + s; 
       
    end; 
     
    if n then s:= '1' + s; 
     
    P:= s 
     
  end; 
   
   
   
function U (a :string; g :integer) :string; //Умножение 
  var  c :string; 
  var i :integer; 
  
  begin 
     
    c:= a; 
     
    for i:=1 to g-1 do begin 
       
      a:= P(a,c); 
       
    end; 
     
    U:= a 
     
  end; 
   
   
function S (a :string; g :integer):string; //Степень 
  var i, c, k :integer; 
 
  begin 
     
    val(a, c, k); 
     
    for i:=1 to g-1 do begin 
       
      a:= U(a,c); 
       
    end; 
     
    S:= a 
     
  end;
  
Function Minus(a,b:string):string;
Var i,k,l:integer;
    x,x1,x2:integer;
    s,c:string;
    p:boolean;
begin
    Vir(a,b,l);
    p:=False;
    s:='';
    For i:=l Downto 1 do
    begin
  Val(a[i],x1,k);
  Val(b[i],x2,k);
  If p then x1:=x1-1;
  If x1<x2 then begin x1:=x1+10;p:=True end
           else p:=False;
  x:=x1-x2;
  Str(x,c);
  s:=c+s
    end;
    While (s[1]='0') and (Length(s)>1) do Delete(s,1,1);
    Minus:=s
end;



var k, N, kb, s3, j :integer; 
var s2, Su, F, c1, c2, c3, c4 :string; 
var s4,fkt :real;
  
begin 
     
  write('N: ');readln(N); 
   
  str(N,F); 
   
  Su:='0'; 
   
  
  for k:=1 to N do begin //с1=(k-1); с2=с1^3; с3=k!; с4=с2*с3
  c3:='1';
    for j:=1 to k do begin
      c3:=U(c3,j);
    end;
    str(k, s2); 
    c1:=Minus(s2,'1');
    c2:=S(c1,3);
    val(c3, s3, kb);
    c4:=U(c2,s3);     
    Su:= P(Su,c4); 
     
  end; 
   
  s4:=0;
   
  for k:=1 to N do begin 
  fkt:=1;
    for j:=1 to k do begin
      fkt:=fkt*j;
    end;
    s4:= s4 + fkt*power((k-1),3); 
  end; 
   
  write(#10, 'Su: ', Su); 
  write(#10, 's3: ', s4); 
   
end.

