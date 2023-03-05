
uses crt,Utils;
const n = 20;
const max_val=989;
var a:array[1..n] of integer=(69,90,19,73,85,30,68,18,27,89,4,27,43,66,40,76,30,44,58,57);
 b:array[1..n] of integer;
 c:array[1..n] of integer;
 l1:array[1..n] of integer;
 l2:array[1..n] of integer;
 l3:array[1..n] of integer;
 l4:array[1..n] of integer;
 l5:array[1..n] of integer;
 h6:array[1..n] of integer;
 h1:array[1..n] of integer;
 h2:array[1..n] of integer;
 h3:array[1..n] of integer;
 h4:array[1..n] of integer;
 h5:array[1..n] of integer;
 h:array[1..n] of integer;
 h11:array[1..n] of integer;
 h22:array[1..n] of integer;
 h33:array[1..n] of integer;
 h44:array[1..n] of integer;
 h55:array[1..n] of integer;
 h66:array[1..n] of integer;
 j,s,sm1,sm2,sm3,sm4,sm5,k1,k2,k3,k4,k5,sm_v2,sm_gr,sm_f:integer;
 

procedure Perm(m: integer);
begin
  var i,j,sm,num,sm11,sm22,sm33,sm44,k,x,sm_nums:integer;
  if m=1 then
  //a.Println;     //когда max_val=200 привести "a.Println;" в действие
   
    
    for i:=1 to n do begin
      c[i]:=0;
     end;
     
   
     for i:=1 to n do begin
        for k:=1 to n do begin
          if not (k in c) then
          if (b[i]=a[k]) and (c[i]=0) then begin
            c[i]:=k;
          end;
          end
       end;
       
      
      
       for j:=1 to n do begin
       if (c[j]<>2) and (j>0) and (c[j]<>3) then begin // 1)
       if sm+a[j]<=max_val then begin     //
       sm+=a[j];
       l1[j]:=a[j];
           end
           else begin
             l1[j]:=0;
           end;
           end;
           end;
           
          
      sm1:=0;
      for i:=1 to n do begin
        sm1+=l1[i];
      end;
   
      
       
      for j:=1 to n do begin    
       if (c[j]<>1) and (j>0) and (c[j]<>3) then begin  // 2)
       if sm11+a[j]<=max_val then begin                     //
       sm11+=a[j];
       l2[j]:=a[j];
           end
           else begin
             l2[j]:=0;
             end;
           end;
           end;
       
       sm2:=0;
      for i:=1 to n do begin
        sm2+=l2[i];
      end;
       
       for j:=1 to n do begin
       if  (c[j]<>1) and (c[j]<>2) and (c[j]<>3) then begin // 3)
       if sm22+a[j]<=max_val then begin                            //
       sm22+=a[j];
       l3[j]:=a[j];
           end
           else begin
             l3[j]:=0;
             end;
           end;
           end;
     
      sm3:=0;
      for i:=1 to n do begin
        sm3+=l3[i];
      end;
     
     
     for j:=1 to n do begin
       if (c[j]<>3) and (j>0) and (c[j]<>4) and (c[j]<>1) then begin // 4)
       if sm33+a[j]<=max_val then begin     //
       sm33+=a[j];
       l4[j]:=a[j];
           end
           else begin
             l4[j]:=0;
           end;
           end;
           end;
           
          
      sm4:=0;
      for i:=1 to n do begin
        sm4+=l4[i];
      end;
      
      for j:=1 to n do begin
       if (c[j]<>3) and (j>0) and (c[j]<>4)and (c[j]<>1)and (c[j]<>2)then begin // 5)
       if sm44+a[j]<=max_val then begin     //
       sm44+=a[j];
       l5[j]:=a[j];
           end
           else begin
             l5[j]:=0;
           end;
           end;
           end;
           
          
      sm5:=0;
      for i:=1 to n do begin
        sm5+=l5[i];
      end;
      
      if max_val>=sm_gr then begin //если больше макс
        for i:=1 to n do begin
          if i<>1 then begin
            sm_f+=b[i];
            h[i]:=b[i];
          end;
        end;
     writeln('values: ',h);    
     writeln('сумма груза : ',sm_f);
     writeln('не взяты грузы: ');
     for i:=1 to n do begin
     if h[i]=0 then begin
     writeln('№ ',i,' ',b[i]:3);
     end
     else
       writeln('взят груз № ',i,' ',b[i]);
     end;
     writeln();
     writeln('Время выполнения программы в милисекундах = ',Milliseconds );
     Halt;
      end;
    
  
     
     k1:=max(sm1,k1);       //1
     
     k:=max(sm1,k);
    
     
  if k1=max_val then begin   
     writeln('ДОСТИГ МАКСИМАЛЬНЫЙ ГРУЗ, ПРОГРАММА ОСТАНОВЛЕНА');  //102
     writeln('values: ',l1);    
     writeln('сумма груза : ',k1);
     writeln('не взяты грузы: ');
     for i:=1 to n do begin
        if l1[i]=0 then begin
          for j:=1 to n do begin
            if (a[i]=b[j]) and (h6[j]<>j)and not(i in h6) then begin
              num:=j;
              h6[i]:=i;
              h66[i]:=j;
              writeln('№ ',num,' ',a[i]:3);
              end;
              
          end;
     end;
     end;
     
     writeln();
     writeln('взяты грузы : ');
     for i:=1 to n do begin
       if not (i in h66) then
         writeln('№',i,' ',b[i]);
     end;
     writeln();
     writeln('Время выполнения программы в милисекундах = ',Milliseconds );
     Halt;
     end;   
     
     k2:=max(sm2,k2);       //2
     if k2>s then begin          //2
     if k2<>0 then begin         //2
     if k2<max_val then begin
         for i:=1 to n do begin  //2
         
       end;
     sm_v2+=1;
     end;
    if sm_v2>=3 then begin      //время
     writeln('values: ',l2);    
     writeln('сумма груза: ',k2);
     writeln('не взяты грузы: ');
       for i:=1 to n do begin
        if l2[i]=0 then begin
          for j:=1 to n do begin
            if (a[i]=b[j]) and (h1[j]<>j)and not(i in h1)  then begin
              num:=j;
              h1[j]:=i;
              h11[i]:=j;
              writeln('№ ',num,' ',a[i]:3);
              end;
              
              end;
              end;
          
     end;
     writeln();
     writeln('взяты грузы : ');
     for i:=1 to n do begin
       if not (i in h11) then
         writeln('№',i,' ',b[i]);
     end;
     writeln();
     writeln('Время выполнения программы в милисекундах = ',Milliseconds );
     Halt;
     end; 
     end;
     end;
     s:=max(sm2,s);
     
     
    
  
  
     if k2=max_val then begin
     writeln('ДОСТИГ МАКСИМАЛЬНЫЙ ГРУЗ, ПРОГРАММА ОСТАНОВЛЕНА');   //200
     writeln('values: ',l2);    
     writeln('сумма груза : ',k2);
     writeln('не взяты грузы: ');
      for i:=1 to n do begin
        if l2[i]=0 then begin
          for j:=1 to n do begin
            if (a[i]=b[j]) and (h2[j]<>j) and not(i in h2) then begin
              num:=j;
              h2[j]:=i;
              h22[i]:=j;
              writeln('№ ',num,' ',a[i]:3);
            
          end;        
          end;  
     end;
     end;
     writeln();
     writeln('взяты грузы : ');
     for i:=1 to n do begin
       if not (i in h22) then
         writeln('№',i,' ',b[i]);
     end;
     writeln();
     writeln('Время выполнения программы в милисекундах = ',Milliseconds );
     Halt;
     end;
     
     
     k3:=max(sm3,k3);           //3
     
   
     
  if k3=max_val then begin
     writeln('ДОСТИГ МАКСИМАЛЬНЫЙ ГРУЗ, ПРОГРАММА ОСТАНОВЛЕНА');
     writeln('values: ',l3);    
     writeln('сумма груза: ',k3);
     writeln('не взяты грузы: ');
      for i:=1 to n do begin
        if l3[i]=0 then begin
          for j:=1 to n do begin
            if (a[i]=b[j]) and (h3[j]<>j) and not(i in h3) then begin
              num:=j;
              h3[j]:=i;
              h33[i]:=j;
            writeln('№ ',num,' ',a[i]:3);
          end;
         end;
     end;
     end;
     writeln();
     writeln('взяты грузы : ');
     for i:=1 to n do begin
       if not (i in h33) then
         writeln('№',i,' ',b[i]);
     end;
     writeln();
     writeln('Время выполнения программы в милисекундах = ',Milliseconds );
     Halt;
     end;
  
  k4:=max(sm4,k4);             //4
    
    
     
  if k4=max_val then begin
     writeln('ДОСТИГ МАКСИМАЛЬНЫЙ ГРУЗ, ПРОГРАММА ОСТАНОВЛЕНА');
     writeln('values: ',l4);    
     writeln('сумма груза: ',k4);
     writeln('не взяты грузы: ');
      for i:=1 to n do begin
        if l4[i]=0 then begin
          for j:=1 to n do begin
            if (a[i]=b[j]) and (h4[j]<>j)and not(i in h4) then begin
            num:=j;
            h4[j]:=i;
            h44[i]:=j;
            writeln('№ ',num,' ',a[i]:3);
          end;
          end;
     end;
     end;
     writeln();
     writeln('взяты грузы : ');
     for i:=1 to n do begin
       if not (i in h44) then
         writeln('№',i,' ',b[i]);
     end;
     writeln();
     writeln('Время выполнения программы в милисекундах = ',Milliseconds );
     Halt;
     end;
     
     k5:=max(sm5,k5);        //5
    
     
  if k5=max_val then begin
     writeln('ДОСТИГ МАКСИМАЛЬНЫЙ ГРУЗ, ПРОГРАММА ОСТАНОВЛЕНА');
     writeln('values: ',l5);    
     writeln('сумма груза: ',k5);
     write('не взяты грузы: ');
       for i:=1 to n do begin
        if l5[i]=0 then begin
          for j:=1 to n do begin
            if (a[i]=b[j]) and (h5[j]<>j)and not(i in h5) then begin
              num:=j;
            h5[j]:=i;
            h55[i]:=j;
            writeln('№ ',num,' ',a[i]:3);
          end;
          end;
     end;
     end;
     writeln();
     writeln('взяты грузы : ');
     for i:=1 to n do begin
       if not (i in h55) then
         writeln('№',i,' ',b[i]);
     end;
     writeln();
     writeln('Время выполнения программы в милисекундах = ',Milliseconds );
     Halt;
     end;
    
 
  
  for var z:=1 to m do
  begin
    Swap(a[z],a[m]); // ставим каждый на место последнего
    Perm(m-1);
    Swap(a[z],a[m]);
  end; 
  
end;

 

begin
  
  clrscr;
  for j:=1 to n do begin
    b[j]:=a[j];
    sm_gr+=a[j];
  end;
  Perm(n);

end.