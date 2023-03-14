{8.	Справочный зал имеет M терминалов. Поток пользователей равномерно распределен во времени. 
Среднее количество пользователей равно P чел/сутки. Время работы одного пользователя на терминале 
составляет в среднем t минут. Определить, среднее время ожидания. 
(Например, m=5, p=140 чел/сутки, t=40 мин, Т0=24 часа).}
 

const m=3;               
      p=20;              
      tp=60 div p;       
      tn=15;             
      t0=60;             
var que: array of record //очередь
      num,               //номер объекта
      time,
      next:integer;      //ссылка на следующий объект
end;

var ma: array [1..m] of record //массив обслуживания
      num,               //номер объекта
      time: integer;     //когда объект становится на обслуживание
end;
var   mem,               //переменная для динамической памяти
      len,               //объектов в очереди     
      tail,              //хвост очереди
      i,j,x,n,t,sum,k: integer;
      f: boolean;
begin
  mem:=1;
  setlength(que,1);
  len:=0;
  tail:=0;
  sum:=0;
  k:=0;
  n:=1;
  t:=1;
  while (t<=t0) do begin
    //объект уходит
    for i:=1 to m do if ((ma[i].num<>0) and ((t-ma[i].time)=tn)) then begin
      if (len=0) then begin
        ma[i].num:=0;
        ma[i].time:=0;
      end
      else begin
        if (len=1) then begin
          ma[i].num:=que[tail].num;
          ma[i].time:=t;
          sum:=sum+t-que[tail].time;
          k:=k+1;
          tail:=0;
          len:=0;
        end
        else begin
          j:=tail;
          while (que[que[j].next].next<>0) do j:=que[j].next;
          ma[i].num:=que[que[j].next].num;
          ma[i].time:=t;
          sum:=sum+t-que[que[j].next].time;
          k:=k+1;
          que[j].next:=0;
          len:=len-1;
        end;
        
      end;
      
    end;
    //новый объект
    if (t mod tp = 1) then begin
      f:=false;
      for i:=1 to m do if (ma[i].num=0) then begin
        f:=true;
        x:=i;
        break;
      end;
      if (f) then begin
        ma[x].num:=n;
        n:=n+1;
        ma[x].time:=t;
      end
      else begin
        mem:=mem+1;
        setlength(que,mem);
        j:=mem-1;
        len:=len+1;
        que[j].num:=n;
        n:=n+1;
        que[j].time:=t;
        que[j].next:=tail;
        tail:=j;
      end;
    end;
    t:=t+1;
  end;
  write('Сейчас обрабатываюся номера: ');
  for i:=1 to m do if (ma[i].num<>0) then begin 
  write(ma[i].num,' ');
  end;
  writeln;
  if (len<>0) then write('В очереди стоят номера: ');
  j:=tail;
  sum:=sum+t-que[j].time; //добавляем к сумме последний элемент
  k:=k+1;
  while (que[j].next<>0) do begin
    write(que[j].num,' ');
    j:=que[j].next;
    sum:=sum+t-que[j].time; //добавляем к сумме времени в очереди оставшиеся элементы
    k:=k+1;
  end;
  if (len<>0) then write(que[j].num);
    writeln;
    writeln('Среднее время ожидания в очереди: ',sum/k,' минут');
end.