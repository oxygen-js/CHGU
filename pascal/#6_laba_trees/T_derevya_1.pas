// В корне дерева находится некоторое число. 
// При переходе к подчиненным узлам это число делится на количество подчиненных узлов. 
// Определить значения терминальных элементов.

Uses GraphABC;
Const n=9;//сколько узлов
Const Connect:array[1..n,1..n] of integer=//двумеренная матрица
              ((0,1,1,1,1,0,0,0,0),   // 1 //1-есть переход,0-нет перехода
               (0,0,0,0,1,0,0,0,0),   // 2
               (0,0,0,1,0,0,0,0,0),   // 3
               (0,0,0,0,0,0,1,0,0),   // 4
               (0,1,0,0,0,1,0,0,0),   // 5
               (0,0,0,0,0,0,0,1,1),   // 6
               (0,0,0,0,0,0,0,0,1),   // 7
               (0,0,0,0,0,0,0,0,0),   // 8
               (0,0,0,0,0,0,0,1,0));   // 9


      
Type
  DataTree= record  
              k:integer;                        // количество подчиненных узлов
              Perehod:array[1..n] of integer;   // список подчиненных узлов// расположение однерки запоминается
              Rez:real;                         // значение узла               
            end;
Var
  Tree:array[1..n] of DataTree;   //
  Node:set of byte;               //  
  
Var 
  i,j,p,k, MaxLen:integer;
  Root:integer;          // номер корня
  
{Procedure Schet(k:integer);
Var i,nomer:integer;
begin
      If Tree[k].k=0 then Exit;
      For i:=1 to Tree[k].k do begin
        nomer:=Tree[k].Perehod[i];  
        Tree[nomer].Rez:=Tree[k].Rez/Tree[k].k;       
        Schet(nomer)
      end;  
end;}

// Определение длины максимально длинной ветви дерева
Procedure LenTree(n,Len:integer);
Var i:integer;
begin  
  If Tree[n].k=0 then begin
    If Len>MaxLen then MaxLen:=Len;
    Exit
  end;
  For i:=1 to Tree[n].k do begin
      LenTree(Tree[n].Perehod[i],Len+1)
  end;
end;

Procedure Razdacha(p:integer);
Var m:real;
    i,n:integer;
begin
  m:=Tree[p].Rez/Tree[p].k;
  For i:=1 to Tree[p].k do begin
     n:=Tree[p].Perehod[i];
     Tree[n].Rez:=m
  end;
      
end;




Begin //основной текст программы
  for i:=1 to n do begin //просмотр строки матрицы
    p:=0;//счетчик подчиненных узлов
    For j:=1 to n do //просмотр колонки матрицы
       If Connect[i,j]=1 then begin //просматриваем матрицу
           p:=p+1;
           Tree[i].Perehod[p]:=j
       end;    
    Tree[i].k:=p;
  end;  
 // Распечатка дерева
 For i:=1 to n do Writeln(Tree[i]);
  
   //определение номера корневого элемента
  { Node:=[1..n];
  For i:=1 to n do
    For j:=1 to Tree[i].k do Node:=Node-[Tree[i].Perehod[j]];    
  
  For i:=1 to n do 
    If i in Node then Root:=i;
  Writeln('корневой элемент=',Root);  }
  
  Tree[1].Rez:=45;    // значение корневого узла //любое

   For k:=1 to n do begin
     For i:=1 to n do
       If Tree[i].Rez<>0 then begin
         Razdacha(i)
       end;
   end;
  
  
  // Распечатка дерева

  
  // распечатка терминальных элементов
  For i:=1 to n do    
    If Tree[i].k=0 then Writeln(i,' ',Tree[i].Rez);// у кого ноль стоит
    
   
end.  
