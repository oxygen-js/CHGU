var
  N, i, j, k: Integer;
  X_spider, Y_spider, X_victim, Y_victim, Xc, Yc, Ds, Dv, Dc, Dmin: Real;
  Vertex: array[1..6, 1..100] of Real;
begin
  Readln(N, X_spider, Y_spider, X_victim, Y_victim);
  Xc := (X_spider + X_victim) / 2;
  Yc := (Y_spider + Y_victim) / 2;
  for i := 1 to 6 do
    for j := 1 to N do
      Vertex[i, j] := (j - 1) * 60 + 30 * (i - 1);
      Writeln(Vertex);
  Dmin := MaxInt;
  for i := 1 to 6 do
    for j := 1 to N do
      for k := 1 to 6 do
        begin
          Ds := Sqrt(Sqr(X_spider - Vertex[i, j]) + Sqr(Y_spider - Vertex[i, j]));
          Dv := Sqrt(Sqr(X_victim - Vertex[k, N - j + 1]) + Sqr(Y_victim - Vertex[k, N - j + 1]));
          Dc := Sqrt(Sqr(Xc - Vertex[i, j]) + Sqr(Yc - Vertex[i, j]) + Sqr(Xc - Vertex[k, N - j + 1]) + Sqr(Yc - Vertex[k, N - j + 1]));
          if Ds + Dv + Dc < Dmin then
            Dmin := Ds + Dv + Dc;
        end;
  Writeln(Dmin:0:2);
end.
