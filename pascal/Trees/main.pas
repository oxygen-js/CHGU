Const n = 9;
  Connect: array[1..n, 1..n] of integer = 
  (
    (0,1,1,1,0,0,0,0,0),
    (0,0,0,0,0,1,0,0,0),
    (0,0,0,0,0,1,0,0,0),
    (0,0,0,0,1,0,0,0,0),
    (0,0,0,0,1,0,0,0,0),
    (0,0,0,0,0,0,1,1,0),
    (0,0,0,0,0,0,0,0,1),
    (0,0,0,0,0,0,0,0,1),
  );
  
  Type Data = Record
    num: real;
    k: integer;
    d: array[1..n,n-1] of integer;
  end;
  
Var
  Tree:array[1..n] of Data;
  i, j, k : integer;
  
Procedure Razdacha(p: integer);
Var m: real;
    i, n : integer
begin
  m := Tree[p].num/Tree[p].k;
  For i:=1 to Tree[p].k do begin
    n:=Tree[p].d[i];
    Tree[n].num := m;
  end;
end;
  
Begin 
  Tree[1].num := 1;
  
  For i:=1 to n do begin
    k := 0;
    for j:= 1 to n do begin
      if Connect[i, j] == 1 then begin
        k:=k+1;
        Tree[i].d[k] := j
      end;
    end;
    Tree[i].k := k;
  end;
  
  For k:=1 to n-1 do begin
    For i:=1 to n do begin
      If Tree[i].num <> 0 then begin
        Razdacha(i);
      end;
    end;
  end;
  
  For i:=1 to n do begin
    If Tree[i].k == 0 then Writeln(i, ' ', Tree[i].num);
  end;
  Writeln(Tree);
end.  