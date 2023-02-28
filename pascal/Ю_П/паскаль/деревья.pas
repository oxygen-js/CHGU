Uses GraphABC;

const
  n = 10;

const
  matr_smejnosti: array[1..n, 1..n] of integer =
  ((0, 0, 0, 1, 1, 1, 0, 0, 0, 0),   // 1
               (0, 0, 0, 1, 1, 1, 0, 0, 0, 0),   // 2
               (0, 0, 0, 0, 0, 0, 0, 1, 1, 0),   // 3
               (1, 1, 0, 0, 0, 0, 0, 1, 1, 0),   // 4
               (1, 1, 0, 0, 0, 0, 0, 0, 0, 0),   // 5
               (1, 1, 0, 0, 0, 0, 0, 0, 0, 1),   // 6
               (0, 0, 0, 0, 0, 0, 0, 0, 0, 1),   // 7
               (0, 0, 1, 1, 0, 0, 0, 0, 0, 0),   // 8
               (0, 0, 1, 1, 0, 0, 0, 0, 0, 0),   // 9
               (0, 0, 0, 0, 0, 1, 1, 0, 0, 0));   // 10}

type
  DataTree = record  
    nodes_count: integer;     // количество подчиненных узлов
    nodes: array[1..n] of integer;// список подчиненных узлов
    FIO: string;// значение узла
    pol: string;
    uroven: integer;
  end;

var
  Tree: array[1..n] of DataTree;   //
  Node: set of byte;               //  

var
  i, j, counter, nodes_count: integer;
  c: string;
  Root: integer;          // номер корня

procedure Poisk(i: integer);
var
  k, m, l, count: integer;
  flag: boolean;
begin
  
  count := 0;
  for  k := 1 to n do
  begin
    if (Tree[k].uroven = Tree[i].uroven + 1) then begin
      for m := 1 to n do
      begin
        if (Tree[k].nodes[m] = i) then begin
          count += 1; if count = 1 then begin Writeln; Writeln('Прямые потомки: '); end; Write(Tree[k].FIO, ' ');
        end; end; end; end;
  if count = 0 then begin Writeln; writeln('Прямых потомков нет'); end;
  
  count := 0;
  for  k := 1 to n do
  begin
    if Tree[k].uroven = Tree[i].uroven + 2 then begin
      for m := 1 to n do
      begin
        count += 1; if count = 1 then begin Writeln; Writeln('Потомки во втором поколении: '); end; Write(Tree[k].FIO, ' ');
        break;
      end; end; end;
  if count = 0 then begin Writeln; writeln('Потомков во втором поколении нет'); end;
  
  
  count := 0;
  flag := False;
  for  k := 1 to n do
  begin
    if Tree[k].uroven = Tree[i].uroven - 1 then begin
      for m := 1 to n do
      begin
        if (Tree[k].nodes[m] = i) then begin
          count += 1; if count = 1 then begin Writeln; Writeln('Родители: ');  end; Write(Tree[k].FIO, ' '); flag := True;
          break;
        end; end; end; end;
  if count = 0 then begin Writeln; writeln('Родителей найти невозможно'); end;
  Writeln;
  
  count := 0;
  if flag = True then begin
    for  k := 1 to n do
    begin
      if (Tree[k].uroven = Tree[i].uroven) and (Tree[k].FIO <> Tree[i].FIO) then begin
        for m := 1 to n do
        begin
          if (Tree[k].nodes[m] = Tree[i].nodes[m]) and (Tree[k].nodes[m] <> 0) then begin
            count += 1; if count = 1 then begin Writeln; Writeln('Ближайшие родственники: '); end; Write(Tree[k].FIO, ' '); 
            break;
          end; end; end; end; end;
  if count = 0 then begin Writeln; writeln('Ближайших родственников нет'); end;
  Writeln; 
end;


begin
  for i := 1 to n do
  begin //находим номера связанных узлов и заполняем ими массив
    counter := 0;
    for j := 1 to n do 
      if matr_smejnosti[i, j] = 1 then begin //если значение элемента в матрице смежности равно 1, то смотрим, какой именно по номеру узел связан с данным узлом
        counter += 1;
        Tree[i].nodes[counter] := j
      end;    
    Tree[i].nodes_count := counter;
  end;  
  for i := 1 to n do Writeln(Tree[i]);  // Распечатка дерева
  
  Tree[1].FIO := '1'; 
  Tree[2].FIO := '2'; 
  Tree[3].FIO := '3';
  Tree[4].FIO := '4'; 
  Tree[5].FIO := '5';
  Tree[6].FIO := '6'; 
  Tree[7].FIO := '7'; 
  Tree[8].FIO := '8'; 
  Tree[9].FIO := '9'; 
  Tree[10].FIO := '10';
  
  (Tree[1].uroven, Tree[2].uroven) := (1, 1); 
  (Tree[3].uroven, Tree[4].uroven, Tree[5].uroven, Tree[6].uroven, Tree[7].uroven) := (2, 2, 2, 2, 2); 
  (Tree[8].uroven, Tree[9].uroven, Tree[10].uroven) := (3, 3, 3);
  
  Writeln; Writeln('Введите номер искомого человека');
  Writeln; 
  Readln(c);

  for i := 1 to n do
  begin
    if Tree[i].FIO = c then begin
      Writeln('Номер: ',Tree[i].FIO, ' Уровень: ', Tree[i].uroven);
      Poisk(i)
    end;
  end; 
end.  
