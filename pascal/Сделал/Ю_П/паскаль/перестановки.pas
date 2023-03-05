Type SetInt=Set of byte;
const m=3;
const n=5;
      var
      spros:array[1..n,1..n] of integer;
      predlozenie: array[1..n,1..n] of integer; 
      vyruchka: array[1..n,1..n] of integer; 
      i,j,max:integer;
      a,aBest:array[1..n] of integer;
     
Procedure Perebor(k:integer;w:SetInt);
Var i,L:integer;
begin
   If k>n then 
   begin
       L:=0;
       For i:=1 to n do L:=L+vyruchka[i,a[i]];
       If L > max then
       begin
           max:=L;
           aBest:=a
       end;
       Exit
   end;
   For i:=1 to n do
      If i in w then
      begin
         a[k]:=i;
         Perebor(k+1,w-[i])
      end

end;
//Procedure Perebor(k:integer;w:SetInt);
//var i, j, l,k1, k2, count, Max, rezMax:integer;
//    Rez:array[1..n] of integer;
//    flag:array[1..n] of boolean;
//begin
//  while count<>5 do 
//  If w=[] then begin
//begin
//  L:=0;
//       For j:=1 to n do 
//         L:=L+vyruchka[i,a[i]];
//       If L > Max then 
//       begin
//            Max:=L;
//            aBest:=a;
//            k1 := i; k2 := j;
//       end;
//       Exit
//   end;
//   For i:=1 to n do
//      If i in w then
//      begin
//         a[k]:=i;
//         Perebor(k,w-[i]);
//      end;
//      flag[rezMax]:=true;
//    writeln(k1, ' фирма - ', k2, ' товар: ', max);
//  count += 1;
//end;
//end;

     
//Procedure Plan;
//var i, j, k1, k2, count, Min, Max, rezMax:integer;
//    Rez:array[1..n] of integer;
//    flag:array[1..n] of boolean;
//begin
//  while count<>5 do 
//begin
//  Max:=0;
//  For i:=1 to m do begin
//   
//    For j:=1 to n do
//        If (vyruchka[i,j]>Max) and (flag[j]=false) then 
//        begin
//            Max:=vyruchka[i,j]; rezMax:=j; k1 := i; k2 := j;
//        end;
//    end;
//    flag[rezMax]:=true;
//    writeln(k1, ' фирма - ', k2, ' товар: ', max);
//   count += 1;
//end;
//end;
     
     
     
     
begin
  for i:=1 to n do
    for j:=1 to n do 
    begin
      spros[i,j] := 100 + random(100);
      predlozenie[i,j] := 250 + random(200);
      vyruchka[i,j] :=  predlozenie[i,j] - spros[i,j];
    end;
  
  writeln('Матрица спроса'); writeln(spros); writeln;
  writeln('Матрица предложения'); writeln(predlozenie); writeln;   
  writeln('Матрица выручки'); writeln(vyruchka);
  writeln;
  writeln('Оптимальный план цепочки перепродаж:');
 // Plan;
  Perebor(1,[1..n]);
  writeln();
    For i:=1 to n do
       Write(aBest[i]:3);
    Writeln;
    Writeln('L=',max);
    For i:=1 to n do
    Writeln(i:3,aBest[i]:3,' ',vyruchka[i,a[i]]:3);
end.