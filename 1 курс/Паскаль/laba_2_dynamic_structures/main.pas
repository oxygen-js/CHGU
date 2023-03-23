{11.	Интернет-сервис предоставляет услуги доступа к БД. 
Средняя скорость поступлений заявок на доступ к информации составляет t заявок/мин. 
Время работы каждого пользователя с БД представляет собой случайную величину и составляет от 5 до 30 мин.
Система может одновременно обслуживать до 5 пользователей. 
Если количество пользователей больше 5, то последний пользователь становится в очередь.	
Сервис начинает работать в момент времени T0.  
Определить время ожидания доступа к БД очередного клиента через время Tn после начала работы сервиса}

const
  limit = 5;
  users_count = 150;
  average_req = 10;

type
  User_Type = Record
    num, time, next: integer;
  end;

var
  Tn: integer;
  T0: integer;
  flag_stack, flag: integer;
  service: array[1..limit] of User_Type;
  stack: array[1..average_req] of integer;
  all_users: array[1..users_count] of integer;


procedure create_list_users();
begin
  for var i := 1 to users_count do
    all_users[i] := i;
end;


//procedure send_stack();
//var
//  j: integer;
//begin
//  j := 1;
//  for var i := flag_stack to (flag_stack + average_req) do
//  begin
//    stack[j] := all_users[i];
//    j += 1;
//  end;
//  flag_stack += average_req;
//end;


procedure initial_stack();
var
  j: integer;
begin
  j := 1;
  for var i := flag_stack to (flag_stack + average_req) do
  begin
    stack[j] := all_users[i];
    j += 1;
  end;
  flag_stack += average_req;
end;


procedure send_service(index: integer; index_service: integer);
begin
    service[index].num := stack[index_service];
    service[index].time := Random(25) + 5;
    service[index].next := index_service + 1;
end;


function check_time(current_min: integer): integer;
var
  currentI: integer;
begin
  currentI := 0;
  
  for var i := 1 to limit do
  begin
    if current_min = service[i].time then
    begin
      currentI := i;
    end;
  end;
  
  check_time := currentI;
end;



begin
  T0 := 0;
  flag_stack := 1;
  flag := 1;
  
  Write('Начало работы сервиса (в минутах)');
  Readln(T0);
  
  Write('Введите время (в минутах) Tn - ');
  Readln(Tn);
  
  create_list_users();
  
  for var min := T0 to Tn do
  begin
    initial_stack();
    if min  check_time(min) then
    begin
      
    end;
  end;
end.
