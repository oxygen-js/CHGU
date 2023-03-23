const
    N = 1000;
var
    a,b: array[1..N] of integer;
    var start_time, end_time : integer;
    i,j,M: byte;
    f: boolean;
begin
  start_time := MilliSeconds();
    randomize;
    for i:=1 to N do begin
        a[i] := random(10);
        write(a[i]:2);
    end;
    writeln;
 
    b[1] := a[1];
    M := 1;
    for i:=2 to N do begin
        f := true;
        for j:=1 to M do
            if a[i] = b[j] then 
                f := false;
        if f = true then begin
            M := M + 1;
            b[M] := a[i];
        end;
    end;
    end_time := MilliSeconds();
 
    for i:=1 to M do
		write (b[i]:2);
	writeln;
	WriteLn(end_time - start_time, ' мс');
end.