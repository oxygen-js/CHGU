const n=5;
const m=5;
      var
      matriza1:array[1..n,1..n] of integer;
      matriza2:array[1..n,1..m] of integer;
      matriza:array[1..n,1..m] of integer;
      flag1:array[1..m] of boolean;
      flag2:array[1..m] of boolean;
Var i,j,k,i1,j1,p, Min:integer;
begin
  Writeln('Матрица предпочтения у мужчин: ');//создаем матрицу предпочтений 5 мужчин к 5 женщинам 
  for i:=1 to n do begin
    for j:=1 to n do begin
      matriza1[i,j]:=random(20)+1;
      write(matriza1[i,j]:4);
      end; 
   writeln();
  end;  
   Writeln('Матрица предпочтения у женщин: ');// создаем матрицу предпочтений 5 женщин к 5 мужчинам
  for i:=1 to n do begin
    for j:=1 to m do begin
      matriza2[i,j]:=random(20)+1;
      write(matriza2[i,j]:4);
    end; 
    writeln();
  end;  
  for i:=1 to n do begin
    for j:=1 to m do begin
      if j<=n then
      begin
      matriza[j,i]:= matriza1[j,i]+matriza2[i,j]; //создаем общую матрицу предпочтения (складываем предпочтения каждого мужчины к каждой женщине)
     end
     else
       matriza[i,j]:= matriza2[i,j];
     end; 
  end; 
   Writeln('Матрица предпочтения: ');
  for i:=1 to n do begin
    for j:=1 to m do begin
      Write( matriza[i,j]:4)
    end; 
    writeln();
  end; 
  Writeln('Несчастные пары: '); // оздаем несчастные пары с помощью поиска минимального элемента матрицы
    for k:=1 to n do begin
   Min:=40;
  for i:=1 to n do begin
    for j:=1 to n do begin
       If (matriza[i,j] <= Min) and (flag1[j]=false) and (flag2[i]=false) then begin // тут мы крч тип перебираем элементы и исключаем столбцы и строки в случае повторения
            Min:=matriza[i,j];
            i1:=i;
            j1:=j;
        end; 
    end;
  end; 
  flag1[j1]:=true;
  flag2[i1]:=true;
  Write('M: ',i1,' Ж: ',j1, ', Минимум ', Min);
   p:=p+Min;// по возрастающий от минимума выводим все пары  
   writeln()
   end;
   writeln (p)
end.
 
