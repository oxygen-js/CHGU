
Var i,j,rezult,sm:integer;
a:array[1..14,1..3] of integer=((2,22,4),
(3,38,29),(47,12,50),(38,11,44),(33,13,18),(50,41,27),
(49,6,43),(32,27,35),(6,20,13),(21,20,3),(25,26,32),
(16,7,11),(18,26,38),(49,42,16));

begin
  sm:=1;
 for i:=1 to 14 do
 begin
   if (a[i,1]<=a[i,2]) and (a[i,1]<=a[i,3])
   then
     begin
     writeln(sm,' : ',1);
     rezult:=rezult + a[i,1];
   end;
     
   if (a[i,2]<=a[i,1]) and (a[i,2]<=a[i,3])
   then
     begin
     writeln(sm,' : ',2);
     rezult:=rezult + a[i,2];
    end;
    
   if (a[i,3]<=a[i,2]) and (a[i,3]<=a[i,1])
   then
     begin
     writeln(sm,' : ',3);
     rezult:=rezult + a[i,3];
     end;
    sm:=sm+1; 
   for j:=1 to 3 do
 end;
   writeln('Нимаеньшаяя сумма выполнения работ: ', rezult);
end.