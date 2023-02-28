const
  mn = ['+', '-', '*', '/'];

var
  s, s1, s2: string;
  n, m, k, j, i, t, p,x: integer;
  res: real;
  c: char;

begin
  write('Введите строку: '); readln(s);
  res := 0;
  for j := 1 to Length(s) do
    if not (s[j] in mn) then s1 := s1 + s[j]
    else break;
  Val(s1, n, k);
  c := s[j];
  for p := j + 1 to Length(s) do
    if not (s[p] in mn) then s2 := s2 + s[p]
    else break;
  Val(s2, m, k);
  case c of
    '+': res := n + m;
    '-': res := n - m;
    '*': res := n * m;
    '^': res := power(n, m);
    's': res := sin(x);
    '/': if m <> 0 then res := n / m else t := 1;
  End;
  s1 := ''; 
  s := s + '-';
  for i := p + 1 to Length(s) do
    if not (s[i] in mn) then s1 := s1 + s[i]
      else
    begin
      Val(s1, n, k);
      c := s[i - 2];
      if k = 0 then
        case c of
          '+': res := res + n;
          '-': res := res - n;
          '*': res := res * n;
          '^': res := power(res, n);
          's': res := res+sin(x);
          '/': if n <> 0 then res := res / n else t := 1;
        End;
      s1 := '';
    end;
  if t <> 1 then writeln(res)
  else writeln('На ноль делить нельзя!');
  readln;
end.