Uses GraphABC;
Const n=8;
Const Connect:array[1..n,1..n] of integer=
              ((0,1,0,0,0,0,0,0),   // 1
               (0,0,1,1,0,0,0,0),   // 2
               (0,0,0,0,0,0,0,0),   // 3
               (0,0,0,0,0,0,0,0),   // 4
               (0,0,0,0,0,1,1,0),   // 5
               (0,0,0,0,0,0,0,0),   // 6
               (0,0,0,0,0,0,0,1),   // 7
               (0,0,0,0,0,0,0,0));   //8
     
Type
  DataTree= record  
              k:integer;                        // количество подчиненных узлов
              Perehod:array[1..n] of integer;   // список подчиненных узлов
              Rez:real;                         // значение узла              
            end;
Var
  Tree:array[1..n] of DataTree;   //
  Node:set of byte;               //  
 
Var
  i,j,p,k, MaxLen:integer;
  Root:integer;          // номер корня
 sum, ssum:real;
 // ной длинны и суммы ветви дерева
Procedure LenTree(n,Len:integer;ssum:real);
Var i,nomer:integer;
begin  
  If Tree[n].k=0 then begin
    Tree[n].Rez:=ssum;
    If Len>MaxLen then begin
      MaxLen:=Len;
      end;
      Writeln('Длина ветви дерева: ',MaxLen, '. Сумма терминального элемента: ', ssum);
    Exit
  end;
  For i:=1 to Tree[n].k do begin
   nomer:=Tree[n].Perehod[i];
   LenTree(nomer,Len+1,Tree[nomer].Rez+ssum);
  end;
end;
// заполнения числами элементов дерева
Procedure Razdacha(p:integer);
Var m:real;
    i,n,j,k:integer;
begin
 
  // раздача элементам некоторых чисел
  For i:=1 to Tree[p].k do begin
     n:=Tree[p].Perehod[i];
     If Tree[p].k<>0 then
     Tree[p].Rez:=Random(100);
   end;
end;
 
// начало тела
Begin
  
  //построение дерева
  for i:=1 to n do begin
    p:=0;
    For j:=1 to n do
       If Connect[i,j]=1 then begin
           p:=p+1;
           Tree[i].Perehod[p]:=j
       end;    
    Tree[i].k:=p;
  end;  
 //Распечатка дерева
 For i:=1 to n do Writeln(Tree[i]);
 
  // определение номера корневого элемента
  Node:=[1..n];
  For i:=1 to n do
    For j:=1 to Tree[i].k do Node:=Node-[Tree[i].Perehod[j]];    
 
  For i:=1 to n do begin
    If i in Node then begin
       Root:=i;
  Writeln('корневой элемент=',Root);
  end;
  end;
   
 //заполнения элементов случайными числами
 For i:=1 to n do begin  
   If i in Node then Tree[i].Rez:=Random(100); // для корневого элемента
     Razdacha(i);                             // для остальных элементов 
 end;  
  // Распечатка терминальных элементов
// Writeln('Распечатка терминальных элементов');
// For i:=1 to n do    
 // If Tree[i].k=0 then Writeln(i,' ',Tree[i].Rez); 
  
 //Сумма ветвей деревьева
 For i:=1 to n do begin
    If i in Node then begin
      MaxLen:=0;
      ssum:=Tree[i].Rez;             // сумма для корневого элемента
      LenTree(i,1,ssum);
  end;
  end;    
 
  Writeln('Распечатка терминальных элементов');
 For i:=1 to n do    
  If Tree[i].k=0 then Writeln(i,' ',Tree[i].Rez); 
  Writeln('Распечатка всех элементов для тестирования');
   For i:=1 to n do  Writeln(i,' ',Tree[i].Rez);
     
end.  