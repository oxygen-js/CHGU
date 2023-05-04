//7.	Имеется массив, элементами которого являются целые числа. Составить программу линейной сложности для удаления из массива дубликатов.

const
  LEN = 100;

var
  n: integer;
  pos: integer;
  arr: array[1..LEN] of integer;
  result_arr: array[1..LEN] of integer;
  
function not_find(n: integer): boolean;
var checked: boolean;
begin
  checked := true;
  for var i:=1 to pos do
  begin
    if (n = result_arr[i]) then
      checked := false
  end;
  not_find := checked;
end;

begin
  pos := 1;
  Writeln('Генерация случайных целых чисел от 1 ДО: ');
  Readln(n);
  
  Writeln('Начальный массив случайных целых чисел: ');
  for var i := 1 to LEN do arr[i] := random(n);
  for var i := 1 to LEN do write(arr[i], ' ');
  
  Writeln();Writeln();
  Writeln('Удаления дубликатов: ');
  for var i := 1 to LEN do 
  begin
    if (not_find(arr[i])) then 
    begin
        result_arr[pos] := arr[i];
        pos := pos + 1;
    end;
  end;

  for var i := 1 to LEN do 
  begin
    if (result_arr[i] <> 0) then
      write(result_arr[i], ' ');
  end;
  
end.

