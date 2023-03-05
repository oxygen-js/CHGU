uses graphABC;

var
  f: boolean;

procedure planety(r, x, y: integer; c: Color);
begin
  setpencolor(c);
  setbrushcolor(c);
  setbrushstyle(bsSolid);
  circle(x, y, r);
end;

procedure KeyPress(key: char);
begin
  if key <> #0 then f := false;
end;

var
  xc, yc, rs, rz, rl, r1, r2, x1, y1, x2, y2: integer;
  u1, u2: real;

begin
  xc := windowwidth div 2;
  yc := windowheight div 2;
  rs := 90;
  rz := 15;
  rl := 3;
  r1 := 170;
  r2 := 25;
  // круг1
  u1 := 20.5;
  // круг1
  u2 := 20.5;
  clearwindow(clWhite);
  lockdrawing;
  onkeypress := Keypress;
  f := true;
  r1 := 100;
  repeat
    clearwindow(clWhite);
    setbrushstyle(bsClear);
    setfontcolor(clWhite);
    u1 := u1 + 0.002;
    u2 := u2 - 0.002;
    x1 := xc + round(r1 * cos(u1));
    y1 := yc - round(r1 * sin(u1));
    planety(rz, x1, y1, clRed);
    x2 := xc + round(r1 * cos(u2));
    y2 := yc - round(r1 * sin(u2));
    planety(rz, x2, y2, clGreen);
    redraw
  until not f
end.