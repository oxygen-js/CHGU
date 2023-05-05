//Динамические структуры. 7 вариант

const
  p = 2;//поступление через каждые
  t = 10;//время на проверку одного изделия
  T0 = 40;//общее время
  m = 3;//кол-во контроллеров

type
  ptr = ^Detal;
  Detal = record
    number: integer;
    next: ptr;
  end;

type
  DataControl = record
    free: boolean;
    time: integer;
  end;

var
  Controller: array of DataControl;
  Fproduct, Lproduct: ptr;
  i, j, num: integer;


procedure creat(var Fproduct: ptr; var Lproduct: ptr; n: integer);
var
  product: ptr;
begin
  if Fproduct = nil then begin
    new(product);
    product^.number := n;
    product^.next := nil;
    Fproduct := product;
    Lproduct := product; end
  else begin
    new(product);
    product^.number := n;
    product^.next := nil;
    Lproduct^.next := product;
    Lproduct := product; end;
end;


function count(Fproduct: ptr): integer;
var
  product: ptr;
  q: integer;
begin
  product := Fproduct;
  q := 0;
  while product <> nil do
  begin
    q := q + 1;
    product := product^.next; end;
  count := q;
end;

procedure print(Fproduct: ptr);
var
  product: ptr;
begin
  product := Fproduct;
  while product <> nil do
  begin
    write(product^.number, ' ');
    product := product^.next; end;
end;


procedure delete(var Fproduct: ptr);
var
  product: ptr;
begin
  product := Fproduct;
  Fproduct := product^.next;
  dispose(product);
end;
////////////////////////////////////////////////////////////////////////////////
begin
  Fproduct := nil;
  Lproduct := nil;
  num := 0;
  
  setLength(Controller, m);
  for i := 0 to (Length(Controller) - 1) do
  begin
    Controller[i].free := false;
    Controller[i].time := 0; end;
  
  for i := 1 to T0 do
  begin
    if (i mod p = 0) then begin
      num := num + 1;
      creat(Fproduct, Lproduct, num); end;
    if count(Fproduct) > 0 then
      for j := 0 to (Length(Controller) - 1) do
      begin
        if Controller[j].free = false then begin
          Controller[j].free := true;
          Controller[j].time := t + 1;
          delete(Fproduct);
          break; end;
      end;
    for j := 0 to Length(Controller) - 1 do
    begin
      if Controller[j].time <> 0 then
        Controller[j].time := Controller[j].time - 1
      else begin
        Controller[j].free := false; end; end;
  end;
  write('Через ', T0, ' минут в накопителе будет находиться деталь №: '); print(Fproduct);
end.
