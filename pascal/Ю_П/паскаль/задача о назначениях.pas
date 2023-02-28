
Var i,j,rezult,sm:integer;
a:array[1..14,1..3] of integer=((16,10,29),
(50,26,14),(17,24,29),(10,33,35),(38,25,7),(22,15,8),
(29,16,49),(47,48,50),(17,18,22),(48,22,20),(20,34,31),
(42,6,32),(36,4,32),(49,42,16));

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