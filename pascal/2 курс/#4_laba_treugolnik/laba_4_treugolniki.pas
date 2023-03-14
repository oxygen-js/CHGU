uses graphABC;

procedure trg(x1, y1, x2, y2, x3, y3, k: integer);
var
  xxs, yys, xx1, yy1, xx2, yy2, xx3, yy3: integer;
begin
  if k > 1 then
  begin
    //координаты середины стороны
    xxs := round((x1 + x2) / 2); 
    yys := round((y1 + y2) / 2);
    //вершины треугольника на стороне
    xx1 := round((x1 + xxs) / 2);
    yy1 := round((y1 + yys) / 2);
    xx2 := round((x2 + xxs) / 2);
    yy2 := round((y2 + yys) / 2);
    //координаты 3 вершины
    xx3 := abs(round(xxs + (xxs - x3) / 2));
    yy3 := abs(round(yys + (yys - y3) / 2));
    {рисуем уменьшенные треугольники}
    setbrushcolor(clRed);
    polygon(pnt(xx1, yy1), pnt(xx3, yy3), pnt(xx2, yy2), pnt(xx1, yy1));
    trg(xx1, yy1, xx3, yy3, xx2, yy2, k - 1); //вычисляем новые координаты
    trg(xx3, yy3, xx2, yy2, xx1, yy1, k - 1);
  end;
end;

var
  n, xc, yc, x1, y1, x2, y2, x3, y3, a: integer;
  h: real;

begin
  repeat
    write('Глубина рекурсии [1..8] n=');
    read(n);
  until n in [1..8];
  clearwindow;
  xc := windowwidth div 2;
  yc := windowheight div 2;
  a := 300;//начальная длина стороны
  h := a * sin(pi / 3);//высота треугольника
  x1 := xc - a div 2;//начальные координаты вершин
  y1 := yc + round(h / 3);
  x2 := xc;
  y2 := yc - round(2 * h / 3);
  x3 := xc + a div 2;
  y3 := y1;
  setbrushcolor(clRed);
  polygon(pnt(x1, y1), pnt(x2, y2), pnt(x3, y3), pnt(x1, y1));
  trg(x1, y1, x2, y2, x3, y3, n); //рисуем 3 треугольника на сторонах n раз
  trg(x2, y2, x3, y3, x1, y1, n);
  trg(x3, y3, x1, y1, x2, y2, n);
end.