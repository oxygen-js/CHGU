// Вариант #7.	Составить программу вычисления числа размещений из N элементов по M

{ Выравнивание длин чисел; }
procedure Equel(var s1, s2: string; var l: integer);
var
  i, x1, x2: integer;
begin
  x1 := Length(s1);
  x2 := Length(s2);
  if x1 > x2 then begin
    l := x1;
    for i := 1 to l - x2 do 
      s2 := '0' + s2
  end
  else begin
    l := x2;
    for i := 1 to l - x1 do 
      s1 := '0' + s1
  end
end;


{ Сложение; }
function Plus(a, b: string): string;
var
  i, k, L: integer;
  x, x1, x2: integer;
  s, c: string;
  p: boolean;
begin
  Equel(a, b, L);
  p := False;
  s := '';
  for i := L Downto 1 do
  begin
    Val(a[i], x1, k);
    Val(b[i], x2, k);
    x := x1 + x2; 
    if p then 
      x := x + 1;
    if x > 9 then 
      p := True 
    else 
      p := False;
    x := x mod 10;
    Str(x, c);
    s := c + s
  end;
  if p then 
    s := '1' + s;
  Plus := s
end;


{ Вычитание; }
function Minus(a, b: string): string;
var
  i, k, L: integer;
  x, x1, x2: integer;
  s, c: string;
  p: boolean;
begin
  Equel(a, b, L);
  p := False;
  s := '';
  for i := L Downto 1 do
  begin
    Val(a[i], x1, k);
    Val(b[i], x2, k);
    if p then 
      x1 := x1 - 1;
    if x1 < x2 then 
    begin 
      x1 := x1 + 10; 
      p := True 
    end
    else 
      p := False;
    x := x1 - x2;
    Str(x, c);
    s := c + s
  end;
  while (s[1] = '0') and (Length(s) > 1) do 
    Delete(s, 1, 1);
  Minus := s
end;


{ Умножение числа на одну цифру; }
function MultiOne(a: string; b: integer): string;
var
  i, j: integer;
  s, s1: string;
  x: integer;
begin
  s := '';
  for i := Length(a) Downto 1 do
  begin
    x := StrToInt(a[i]);
    x := x * b;
    s1 := IntToStr(x);
    for j := 1 to (Length(a) - i) do 
      s1 := s1 + '0';
    s := Plus(s, s1)
  end;
  MultiOne := s
end;


{ Перемножение; }
function Multi(a, b: string): string;
var
  i, j: integer;
  s1, s: string;
begin
  s := '';
  for i := Length(b) Downto 1 do
  begin
    s1 := MultiOne(a, StrToInt(b[i]));
    for j := 1 to (Length(b) - i) do 
      s1 := s1 + '0';
    s := Plus(s, s1)
  end;
  Multi := s
end;



function Fact(N: string): string;
var
  s, c: string;
begin
  s := '1';
  c := '0';
  repeat
    c := Plus(c, '1');
    s := Multi(s, c)
  until c = N;
  Fact := s;
end;


var
  N, M, c, a, b, s: string;

begin
  write('N = '); readln(N);
  write('M = '); readln(M);
  s := '1';
  c := '0';
  repeat
    c := Plus(c, '1');
    a := Minus(N, c);
    b := Plus(a, '1');
    s := Multi(s, b);
  until c = M;

  writeln('Ответ = ', s);
end.
