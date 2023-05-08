//7.	Имеется массив, элементами которого являются целые числа. Составить программу линейной сложности для удаления из массива дубликатов.

const
  LEN = 100;

var
  n, S, slow, stack: integer;
  arr: array[1..LEN] of integer;

begin
  Writeln('Генерация случайных целых чисел от 1 ДО: ');
  Readln(n);
  
  Writeln('Начальный массив случайных целых чисел: ');
  for var i := 1 to LEN do arr[i] := random(1, n);
  for var i := 1 to LEN do write(arr[i], ' ');
  
  Writeln(); Writeln();
  Writeln('Удаления дубликатов: ');
  
  slow := arr[1];
  var j := 1;
  while j < n do
  begin
    stack := arr[slow];
    if slow = 
    arr[slow] := slow;
    slow := stack;
    j += 1;
  end;
  
  for var i := 1 to LEN do 
  begin
    write(arr[i], ' ');
  end;
  
end.

