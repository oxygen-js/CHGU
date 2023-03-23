//Николаева Евгения Александровна кт-43-21, матричные операции
Program matr;
const N1=1000;
type Matrice=array[1..N1,1..N1] of real;
var
        A:matrice;
        I,J,N,t1,t2:integer;
        D:real;//переменная детерминанта
 
Function Det(A:Matrice;N:integer):real;
var
      B:matrice;
      I:integer;
      T,Mn,S:real;
 
       function minor(var C:matrice;A:Matrice;N,I,J:integer):real;//нахождение дополнительного минора
     var
                Im,Jm,Ia,Ja,Nm:integer; //Im - строки мин, Jm - столбцы мин, Ia - строки мат А, Ja - столбцы мат А, Nm - порядок (размерность) минора.

        begin
                Nm:=N-1; //порядок минора на единицу меньше порядка матрицы
                Im:=1; 
                Ia:=1;
                while Im <= Nm do
                        if Ia<>I then 
                        begin
                              Jm:=1; Ja:=1;
                                while Jm<=Nm  do
                                        if Ja<>J then
                                        begin
                                                C[Im,Jm]:=A[Ia,Ja];    
                                                Ja:=Ja+1; Jm:=Jm+1; //определяем какой элемент будет стоять перед минором
                                        end
                                else 
                                        Ja:=Ja+1;
                                Ia:=Ia+1; 
                                Im:=Im+1;
                        end
                        else 
                                Ia:=Ia+1;
        end;
 
begin
        if N=1 then 
                Det:=A[N,N]; //нашей функции передается число из массива
        if N=2 then 
                Det:=A[1,1]*A[2,2]-A[2,1]*A[1,2];
        if N>2 then
        begin
                S:=0; //сумма
                for I:=1 to N do
                begin
                        Mn:=Minor(B,A,N,I,1);//находим дополнительный минор
                        if (I mod 2)=1 then //если после деления на 2 равно единице
                        begin
                                T:=Det(B,N-1); 
                                S:=S+T*A[I,1];
                        end
                        else //если не равно выполняется
                        begin
                                T:=Det(B,N-1);
                                S:=S-T*A[I,1];
                        end;
                end;
                Det:=S;    
        end;
end; 
 
begin
       // Write('Введите размерность матрицы : '); 
       // readln(N);
       n:=3;
        for I:=1 to N do
        begin
              //  writeln('Введите эелементы строки',I:2);
                for J:=1 to N do 
                        //readln
                        A[I,J]:=random(10);
        end;
        
       // for i:=1 to n do begin
       //   for j:=1 to n do write(a[i,j]:3);
       //   writeln
       // end;
        t1:=milliseconds;
        D:=Det(A,N);
        t2:=milliseconds;
        writeln(t2-t1);
        //Writeln('Определитель равен: ',D:7:4);// вывод результата
       // readln;
end.