const n = 9;
  Connect: array[1..n, 1..n] of integer = 
  (
    (0, 1, 1, 1, 0, 0, 0, 0, 0),
    (0, 0, 0, 0, 0, 1, 0, 0, 0),
    (0, 0, 0, 0, 0, 1, 0, 0, 0),
    (0, 0, 0, 0, 1, 0, 0, 0, 0),
    (0, 0, 0, 0, 0, 1, 0, 0, 0),
    (0, 0, 0, 0, 0, 0, 1, 1, 0),
    (0, 0, 0, 0, 0, 0, 0, 0, 1),
    (0, 0, 0, 0, 0, 0, 0, 0, 1),
    (0, 0, 0, 0, 0, 0, 0, 0, 0));

type Data = Record
    day: real;                        // значение узла
    k: integer;                       // количество подчиненных узлов
    d: array[1..n - 1] of integer;    // Список подчиненных узлов
end;

var
  Tree: array[1..n] of Data;
  i, j, k: integer;

procedure Razdacha(p: integer);
var
  m: real;
  i, n: integer;
begin
  // скорее всего тут нужно будет суммировать
  m := Tree[p].day / Tree[p].k;
  for i := 1 to Tree[p].k do
  begin
    n := Tree[p].d[i];
    Tree[n].day := m;
  end;
end;

begin  
  Tree[1].day := 120;
  for i := 1 to n do
  begin
    k := 0;
    for j := 1 to n do
    begin
      if Connect[i, j] = 1 then begin
        k := k + 1;
        Tree[i].d[k] := j;
      end;
    end;
  end;
  
  for k := 1 to n - 1 do
  begin
    for i := 1 to n do
    begin
      if Tree[i].day <> 0 then begin
        Razdacha(i);
      end;
    end;
  end;
  
  for i := 1 to n do
  begin
    if Tree[i].k = 0 then Writeln(i, ' ', Tree[i].day);
  end;
  Writeln(Tree);
end.  