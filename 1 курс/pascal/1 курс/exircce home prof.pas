const N = 20;
var
    arr: array[1..N] of byte;
    i, j, l, lmax: byte;
begin
    randomize;
    for i:=1 to N do begin
        arr[i] := random(100);
        write(arr[i]:3);
    end;
    writeln;
 
    lmax := 1;
    l := 1;
    for i:=2 to N do 
        if arr[i] > arr[i-1] then
            l := l + 1
        else begin
            if l > lmax then
                lmax := l;
            l := 1;
        end;
    writeln(lmax);
    if lmax = 1 then;
 
    l := 1;
    for i:=2 to N do 
        if arr[i] > arr[i-1] then
            l := l + 1
        else begin
            if l = lmax then begin
                for j:=i-l to i-1 do
                    write(arr[j]:3);
                writeln;
            end;
            l := 1;
        end;
end.