const
  P = 1;     //процессор
  t = 20;    //Время
  Ti = 5;    //время поступления
  Vi = 3;   //Время исполнения

var
  C: array[1..P, 1..2] of integer;
  O := lst((Vi, 1)); //возвращает список, заполненный указанными значениями
  g, i, k, j, prior, count, a, f: integer;
  cout, srsumm: real;

begin
  g := 0;
  k:=0;
  f := 0;
  count := 0;
  for i := 1 to t do
  begin  //один круг цикла = 1 минуте
    prior := random(3); //приоритеты устанавливаются рандомно
    writeln('Приоритет ',i,' программы: ', prior);
    if (prior = 1) then 
    begin
      a:=a+1;
      //если выпадает число 1 то на обработку идёт приоритетная программа, если другое, то это либо фоновая программа, либо ожидание
      if g <= 0 then 
      begin
         g := Ti;
        //O[^1].Item1, C[j, 1]  - время исполнения
        //O[^1].Item2 = 2
        O.Add((O[^1].Item1, O[^1].Item2 + 1));  
       // g := Ti;
        for j := 1 to P do 
          begin 
          if C[j, 1] <= 0 then 
            begin
            count := count + 1; //счётчик - сколько программ было выполнено
            C[j, 1] := Vi;
            C[j, 2] := count;
            ////////////////
              writeln('  /////////////////'); 
            writeln('O[^1].Item1: ',O[^1].Item1);
            writeln('O[^1].Item2: ',O[^1].Item2 );
            ////////////////
             writeln('  /////////////////'); 
            writeln('C[j, 1]: ',C[j, 1]);
            writeln('C[j, 2]: ',C[j, 2] );
              writeln('  /////////////////'); 
            break;
          end;
           
        end;
          g := g - 1;///////////////
      end;
    end;
    for j := 1 to P do
    begin 
      if C[j, 1] > 0 then
        C[j, 1] := c[j, 1] - 1;
    end;
    g := g - 1;
  end;
   writeln;
  for i := 1 to P do 
  begin
    if (C[i, 1] < Vi) then
      writeln('Процессор выполняет ', C[i, 2], ' приоритетные программы')
    else
      writeln('Процессор ', i, ' готовится выполнить ', C[i, 2], ' программ')
  end;
  
  srsumm := t/count;
  writeln('Среднее время обработки для приоритетной программы ', srsumm);
    k:= C[i, 2];
    
   // Writeln('a: ' , a);
    Writeln('Всего программ в очереди: ', a - k);
 // writeln('  /////////////////');
end.


