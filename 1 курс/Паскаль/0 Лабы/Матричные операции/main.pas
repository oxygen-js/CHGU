// 7.	Возведение в степень ^3

const
  SIZE = 3;

var
  matrix_1: array of array of integer := ((2, 2, 3),(4, 1, 1),(5, 1, 1));
  matrix_2: array of array of integer := ((2, 2, 3),(4, 1, 1),(5, 1, 1));
  
  
procedure copy_matrix(matrix: array of array of integer );
begin
  for var i := 0 to SIZE-1 do 
      matrix_1[i] := Copy(matrix[i]);
end;

begin  
  for var i := 0 to SIZE-2 do
  begin
    var matrix: array of array of integer := ((0, 0, 0),(0, 0, 0),(0, 0, 0));
    for var j := 0 to SIZE-1 do
      for var q := 0 to SIZE-1 do 
        for var k := 0 to SIZE-1 do
          matrix[j,q] += matrix_1[j,k] * matrix_2[k,q];
    copy_matrix(matrix);
  end;
  
  for var i := 0 to SIZE-1 do
  begin
    for var j := 0 to SIZE-1 do
    begin
      Write(matrix_1[i,j], ', ');
    end;
    Writeln();
  end;
end.
