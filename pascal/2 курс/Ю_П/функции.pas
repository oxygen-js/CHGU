var
  n: integer;
  x, y: real;

function f8(n: integer): real;
var
  i: integer;
  p: real;
begin
  p := 1;
  for i := 1 to n do
    if odd(i) then p := p * (i + 1) / i
    else p := p * i / (i + 1);
  f8 := p;
end;

function f9(x: real; n: integer): real;
var
  i: integer;
  s, s1: real;
begin
  s1 := x;
  s := 0;
  for i := 1 to n do
  begin
    s1 := sin(s1);
    s := s + s1;
  end;
  f9 := s;
end;

function f10(n: integer): real;
var
  i : integer;
  p, s: real;
begin
  p := 1;
  for i := 1 to n do
  begin
    s := power(1 + 1 / power(i, i), n);
    p := p * s;
    n := n - 1;
  end;
  f10 := p;
end;

begin
  write(' n>0 n=');
  readln(n);
  writeln('Введите x: ');
  readln(x);
  writeln(f8(n));
  writeln(f9(x, n));
  writeln(f10(n));
  y := (f8(n) + f9(x, n) / f10(n));
  write('y=', y)
end.
