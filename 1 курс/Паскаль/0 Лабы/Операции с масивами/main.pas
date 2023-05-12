//7.	Имеется массив, элементами которого являются целые числа. Составить программу линейной сложности для удаления из массива дубликатов.

var
  Len: integer;
  arr, res: array of integer;
  size: integer;

begin
  Writeln('Генерация случайных целых чисел от 1 ДО: ');
  Readln(Len);
  
  size := Len - 1;
  
  arr := new integer[Len];
  res := new integer[Len];
  
  Writeln('Начальный массив случайных целых чисел: ');
  for var i := 0 to size do arr[i] := random(1, Len);
  for var i := 0 to size do write(arr[i], ' ');
  for var i := 0 to size do res[i] := 0;
  
  Writeln(); Writeln();
  Writeln('Удаления дубликатов: ');
  for var i := 0 to size do 
  begin
    res[arr[i] - 1] += 1;
  end;
  
  for var i := 0 to size do 
  begin
    if (res[i] <> 0) then
      write(i, ' ');
  end;
  
end.
