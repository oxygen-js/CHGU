const N = 20;
var
    arr: array[1..N] of integer;
    i, j, l, max: integer;
begin
    
    for i:=1 to N do begin
        arr[i] := i;//random(100);
        //write(arr[i]:3);
    end;
    //arr[1] := 12;
    //arr[n] := 1;    
    writeln(arr);
    writeln;
    
     max := 1;
     l:=1;
     for i:=2 to N do 
        if arr[i] > arr[i-1] then
            l := l + 1
        else begin
            if l > max then
                max := l;
            l := 1;
        end;
    writeln(max);
    
    
     l := 1;
     for i:=2 to N do 
        if arr[i] > arr[i-1] then
            l := l + 1
        else begin
            if l = max then begin
                for j:=i-l to i-1 do
                    write(arr[j]:3);
                writeln;
            end;
            l := 1;
        end;
   
      
end.