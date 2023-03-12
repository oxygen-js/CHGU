var
  N, i, j, k: Integer;
  Xs, Ys, Xv, Yv, Xc, Yc, Ds, Dv, Dc, Dmin: Real;
  Vertex: array[1..6, 1..100] of Real;
begin
  Readln(N, Xs, Ys, Xv, Yv);
  Xc := (Xs + Xv) / 2;
  Yc := (Ys + Yv) / 2;
  for i := 1 to 6 do
    for j := 1 to N do
      Vertex[i, j] := (j - 1) * 60 + 30 * (i - 1);
  Dmin := MaxInt;
  for i := 1 to 6 do
    for j := 1 to N do
      for k := 1 to 6 do
        begin
          Ds := Sqrt(Sqr(Xs - Vertex[i, j]) + Sqr(Ys - Vertex[i, j]));
          Dv := Sqrt(Sqr(Xv - Vertex[k, N - j + 1]) + Sqr(Yv - Vertex[k, N - j + 1]));
          Dc := Sqrt(Sqr(Xc - Vertex[i, j]) + Sqr(Yc - Vertex[i, j]) + Sqr(Xc - Vertex[k, N - j + 1]) + Sqr(Yc - Vertex[k, N - j + 1]));
          if Ds + Dv + Dc < Dmin then
            Dmin := Ds + Dv + Dc;
        end;
  Writeln(Dmin:0:2);
end.
