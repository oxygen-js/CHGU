const
  N = 8;
  Works: array[1..N, 1..N] of integer = (
        (7, 0, 47, 76, 8, 67, 93, 92),
        (36, 22, 72, 64, 88, 12, 7, 81),
        (1, 66, 98, 24, 52, 59, 96, 3),
        (60, 87, 92, 68, 56, 40, 43, 40),
        (30, 38, 83, 54, 35, 31, 92, 87),
        (4, 87, 26, 84, 45, 89, 23, 62),
        (81, 21, 1, 0, 29, 69, 39, 70),
        (8, 73, 36, 18, 92, 70, 35, 99, 62));

var
  best_work: array [1..N] of integer;
  list_machine: array [1..N] of integer;
  

function include(arr: array[1..N] of integer; find_el: integer): boolean;
var
  result: boolean;
  i: integer;
begin
  for i := 1 to N do 
  begin
    if (find_el <> arr[i]) then result := false
    else begin
      result := true;
      break;
    end;
  end;
  
  include := result;
end;


function find_best_work(arr: array[1..N] of integer): integer;
var
  i, max: integer;
begin
  max := 0;
  for i := 1 to N do 
  begin
    if (arr[i] > max) then max := arr[i];
  end;
end;


procedure find_max_power(arr: array[1..N, 1..N] of integer);
var i, j: integer;
begin
  for i := to N do
  begin
    for j := to N do
    begin
      best_work := find_best_work;
    end;
  end;
end;


BEGIN
  find_max_power(Works);
END.