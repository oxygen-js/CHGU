type
  SetInt = Set of byte;

const
  m = 5;

const
  n = 5;

var
  spros: array[1..n, 1..n] of integer;
  predlozenie: array[1..n, 1..n] of integer; 
  pereprodajy: array[1..n, 1..n] of integer; 
  i, j, max: integer;
  a, aBest: array[1..n] of integer;

procedure Perebor(k: integer; w: SetInt);
var
  i, L: integer;
begin
  if k > n then 
  begin
    L := 0;
    for i := 1 to n do
    begin
      L := L + pereprodajy[i, a[i]];
    end;
    
    if L > max then
    begin
      max := L;
      aBest := a;
    end;
    Exit
  end;
  for i := 1 to n do
    if i in w then
    begin
      a[k] := i;
      Perebor(k + 1, w - [i])
    end
end;

begin
  for i := 1 to n do
    for j := 1 to n do 
    begin
      spros[i, j] := 100 + random(100);
      predlozenie[i, j] := 250 + random(200);
      pereprodajy[i, j] := predlozenie[i, j] - spros[i, j];
    end;
    
    
  writeln('Матрица Предложений (содержит цены продаж каждого товара каждой фирмы)'); 
  for i := 1 to n do
  begin
    for j := 1 to n do 
    begin
      write(predlozenie[i, j], ' ');
    end;
    Writeln();
  end;
  Writeln('');
  
  writeln('Матрица Спроса (содержит цены покупки каждого товара, которые готовы заплатить каждая фирма за этот товар)');
  for i := 1 to n do
  begin
    for j := 1 to n do 
    begin
      write(spros[i, j], ' ');
    end;
    Writeln('');
  end;
  Writeln('');
    
  writeln('Матрица Перепродаж');  
  for i := 1 to n do
  begin
    for j := 1 to n do 
    begin
      write(pereprodajy[i, j], ' ');
    end;
    Writeln();
  end;
  Writeln('');
  
  write('Оптимальный план цепочки перепродаж: ');
  Perebor(1, [1..n]);
  for i := 1 to n do
    Write(aBest[i]:3);
  Writeln;
  Writeln('L = ', max);
  
  for i := 1 to n do
    Writeln('#',i, aBest[i]:3, ' ', pereprodajy[i, a[i]]:3);
end.