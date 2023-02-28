type
  data = record
    number, next, T_ochered: integer;
  end;
const
  p = 1;//поток
const
  t = 10;//время исполнения 
const
  T0 = 60;//общее время
const
  kolvo_prog = T0 div p + 1;//количество программ, которое успеют выполнить за общее время
  
var
  ochered: array [0..kolvo_prog] of data;//массив, в котором будут содержаться данные по каждой программе(его приоритет, какой номер будет после, время стояния в очереди)
  count: integer;
  service: integer;//счетчик времени исполнения
  tail: integer;//в переменной хранится номер программы, которая стоит в конце очереди
  summa_T_ochered: integer;//общее время стояния в очереди
  razmer_ocheredi: integer;// размер очереди в данное время
  i, j: integer;
  average_T_ochered: real;//среднее время стояния в очереди
  CPU_free,k: boolean;//переменные, по которым можно будет узнать, свободен ли ЦП

{добавление в очередь}
procedure AddToOchered(var count: integer);
begin
  ochered[count].number := count;//заполняем данные про судно
  ochered[count].next := 0;
  ochered[count].T_ochered := 0;
  if count <> 1 then
    ochered[count - 1].next := count + 2{после каждого судна причал обслуживает судно с номером на 3 больше(+2 вместо +3 потому,
  что после того, как пришло 1 судно, очередь сдвигается, и ochered[0].next := 2, то есть после 1 судна в порт прибудет 2 судно)}
  else 
    ochered[count - 1].next := count;//после нулевого элемента следующим следует 1 судно, то есть оно будет первым
  tail := count;
end;


{сдвиг очереди}
procedure SdvigOcheredi();
begin
  ochered[0].next += 1;//показывает, с каким номером судно прибудет в порт после текущего
end;

begin
  ochered[0].number := 0;
  ochered[0].next := 1;
  ochered[0].T_ochered := 0;
  tail := 0;
  prichal_1_free := True; 
  count := 0;
  k := False;
  summa_T_ochered := 0;
  
  for i := 1 to T0 do
  begin
    if p > 1 then begin
      if i mod p = 1 then begin//через каждые p минут добавляем в очередь судно
        count += 1;
        k := True;//доп переменная указывает на то, что пришло новое судно (для того, чтобы потом делать только 1 причал занятым, а не все 3)
        AddToOchered(count);
      end;
    end
    else
    if p = 1 then begin
      count += 1;
      k := True;//доп переменная указывает на то, что пришло новое судно (для того, чтобы потом делать только 1 причал занятым, а не все 3)
      AddToOchered(count);
    end;
    {если на каком-то из 3 причалов судно обслужили полностью, то есть счетчик времени достиг времени обслуживания, то 
    этот причал становится свободным, а счетчик времени на нем обнуляется}
    if service_t1 = t then begin
      prichal_1_free := True;
      service_t1 := 0;
    end;
    
    {Если какой-то из 3 причалов занят, значит, на нем еще обслуживается судно, поэтому к счетчику времени на этом причале добавляем +1}
    if prichal_1_free = False then  
      service_t1 += 1;
    
    {Если какой-то из 3 причалов свободен и дополнительная логическая переменная равна истине(то есть пришло новое судно), то очередь сдвигается, 
    судно приплывает на этот свободный причал, и он становится занятым. Счетчик времени равен 1, так как началось обслуживание. k становится равным Ложь, 
    чтобы остальные причалы тоже не сделать занятыми}
    if prichal_1_free and k then begin
      Sdvigocheredi;
      if razmer_ocheredi > 0 then
        razmer_ocheredi -= 1;//как только судно из очереди приплывает на свободный причал, размер очереди уменьшается на 1
      prichal_1_free := False;
      service_t1 := 1;
      k := False;
    end
    
    {считаем, сколько времени судно стоит в очереди}
    for j := ochered[0].next to tail do
    begin
      if ochered[j].T_ochered = 0 then
        razmer_ocheredi += 1;
      ochered[j].T_ochered += 1;
      
    end
  end;
  
  {после выхода из цикла for считаем общее время стояния в очереди всех суден}
  for j := 1 to tail do
    summa_T_ochered += ochered[j].T_ochered;
  
  
  {находим среднее время стояния в очереди. делим общее время стояния в очереди на количество суден в порту}
  average_T_ochered := summa_T_ochered / (count - razmer_ocheredi);
  
  
  writeln('Общее время в очереди ', summa_T_ochered, ' минут');
  writeln('Среднее время стояния в очереди ', average_T_ochered, ' минуты');
  if razmer_ocheredi > 0 then begin
    write('Через ', T0, ' минут в очереди будут стоять ', razmer_ocheredi, ' судна c номерами ');
    for i := razmer_ocheredi downto 1 do
      write(ochered[kolvo_sudov - i].number, ' ');
    writeln;
  end
  else
  if razmer_ocheredi = 0 then 
    write('Через ', T0, ' минут в очереди судна стоять не будут');
end.