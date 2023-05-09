//7.	Имеется массив, элементами которого являются целые числа. Составить программу линейной сложности для удаления из массива дубликатов.

const
  LEN = 100;

var
  max: integer;
  arr: array of integer = (1,1,2,3,4,4,4,5,6,7,8,8,8,9,9,10,10,10,11);

begin
  max := 0;
  Writeln('Начальный массив: ');
  for var i := 1 to arr.Length-1 do begin
    if arr[i] > max then
      max := arr[i];
    write(arr[i], ' ');
  end;

  Writeln(); Writeln();
  Writeln('Удаления дубликатов: ');
        
  var j := 1;
  for var i := 2 to arr.Length-1 do
  begin
    if  arr[i] <> arr[j] then
      j += 1;
    arr[j] := arr[i];
  end;
  
  
  for var i := 1 to arr.Length-1 do 
  begin
    if (arr[i] = max) then
    begin
      write(arr[i], ' ');
      break;
    end;
    write(arr[i], ' ');
  end;
  
end.

