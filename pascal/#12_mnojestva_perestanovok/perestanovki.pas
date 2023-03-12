//11.	На рынке действует M фирм, занимающихся перепродажами, и имеется N товаров. 
//При этом известны: матрица предложений (содержит цены продаж каждого товара каждой фирмы) и 
//матрица спроса (содержит цены покупки каждого товара, которые готовы заплатить каждая фирма за этот товар). 
//Найти оптимальный план цепочки перепродаж длиной K (K <> N).

type
  SetInt = Set of byte;

const
  m = 5; n = 5;

var
  spros: array[1..m, 1..n] of integer;
  predlozenie: array[1..m, 1..n] of integer; 
  pereprodajy: array[1..m , 1..n] of integer; 
  i, j, max: integer;
  chain, aBest: array[1..n] of integer;
  
procedure print(title: string; arrType: integer);
begin
  writeln(title); 
  Write('Т->'); for var i := 1 to n do Write(i:4);
  Writeln();
  for var i := 1 to n do
  begin
    Write('Ф', i, ' ':3);
    for var j := 1 to n do
    begin
      if (arrType = 0) then write(predlozenie[i, j], ' ');
      if (arrType = 1) then write(spros[i, j], ' ');
      if (arrType = 2) then write(pereprodajy[i, j], ' ');
    end;
    Writeln();
  end;
  Writeln('');
end;

procedure Perebor(k: integer; step: SetInt);
var
  i, L: integer;
begin
  if k > n then 
  begin
    L := 0;
    for i := 1 to n do L := L + pereprodajy[i, chain[i]];
    
    if L > max then
    begin
      max := L;
      aBest := chain;
    end;
    Exit
  end;
  for i := 1 to n do
    if i in step then
    begin
      chain[k] := i;
      Perebor(k + 1, step - [i])
    end
end;

begin
  for i := 1 to n do
  begin
    for j := 1 to n do 
    begin
      spros[i, j] := 100 + random(100);
      predlozenie[i, j] := 250 + random(200);
      pereprodajy[i, j] := predlozenie[i, j] - spros[i, j];
    end;
  end;

  print('Матрица Предложений', 0);
  print('Матрица Спроса', 1);
  print('Матрица Перепродаж', 2);
      
  Perebor(1, [1..n]);
  
  Writeln('Оптимальный план цепочки перепродаж: ');
  for i := 1 to n do Write(i,':', aBest[i], '   '); Writeln();
  
  for i := 1 to n do 
  begin
    Write(pereprodajy[i, aBest[i]]);
    if (i < n) then Write(' + ');
    if (i = n) then Write(' = ', max);
  end;
  
  Writeln();

end.