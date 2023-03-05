//11.	На рынке действует M фирм, занимающихся перепродажами, и имеется N товаров. 
//При этом известны: матрица предложений (содержит цены продаж каждого товара каждой фирмы) и 
//матрица спроса (содержит цены покупки каждого товара, которые готовы заплатить каждая фирма за этот товар). 
//Найти оптимальный план цепочки перепродаж длиной K (K <> N).


//Перестановки
Const n=5;
Type SetInt=Set of byte;
Var a:array[1..n] of byte;

Procedure Perebor(k:integer;m:SetInt);
begin
   If k>n then begin
       For i:=1 to n do Write(a[i]);
       Writeln;
       Exit
   end;
   For i:=1 to n do
      If i in m then begin
         a[k]:=i;
         Perebor(k+1,m-[i])
      end

end;


Begin
   Perebor(1,[1..n]);
end.