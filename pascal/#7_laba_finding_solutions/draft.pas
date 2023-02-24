Type
    Position = string;
var
  Step:integer;
  a: array[0..100] of Position;
  a2: array[0..100] of Position;
  
Procedure Vivod; 
Var i:integer;
begin
  for i:= 0 to Step do begin
    if i = 0 then writeln('011000')
    else if i = 2 then writeln('001000')
    else 
      if (i <> 4) then
      Writeln(a[i]);
  end;
  Writeln
end;

Function Zapret(s:Position):boolean; 
begin
  Zapret := ((s[1] = s[4]) and (s[1] <> s[6])) or
            ((s[1] = s[5]) and (s[1] <> s[6])) or
            ((s[6] = s[2]) and (s[1] <> s[6])) or
            ((s[6] = s[3]) and (s[1] <> s[6]))
      
end;

Function Povtor(k:integer; s:Position): boolean;
var i:integer;
begin
  for i:=1 to k do
    if s=a[i] then begin
      Povtor:= true;
      Exit
    end;
    Povtor := false;
end;

Procedure Hod(i:integer; s:Position; L: integer; 
              var ss:position;
              var p:boolean);
begin
  ss:=s;
  if s[L] = '0' then ss[L] := '1'
                else ss[L] := '0';
  p:= true;
  case i of
    1: if (L <> 1) then begin
         if (s[1] <> s[L]) then p := false 
                           else ss[1] := ss[L];
       end;
    2: if (L <> 2) then begin
         if (s[2] <> s[L]) then p := false 
                           else ss[2] := ss[L];
       end;
    3: if s[3] <> s[L] then p := false
                       else ss[3] := ss[L];
    4: if s[4] <> s[L] then p := false 
                       else ss[4] := ss[L];
    5: if s[5] <> s[L] then p := false 
                       else ss[5] := ss[L];
    6: if s[6] <> s[L] then p := false 
                       else ss[6] := ss[L];
    end
end;

Procedure Solution(k:integer; s:Position; L:integer); 
var i: integer;
    ss: position;
    p: boolean;
    x: boolean; 
begin
  
  a[k] := s;
  x := false;
  for i := 1 to 6 do begin
    Hod(i, s, L, ss, p);
    if ss='111111' then begin
      if not( ss in a) then
      a[k+1] := ss;
      Step := k + 1;
      Vivod;
      Exit
    end;
    if p and not Povtor(k, ss) and not Zapret(ss) then begin
      x := true;
      Solution(k+1,ss, 2);
    end;
  end;
  if not x then begin
    x := true;
    Solution(k, s, 1);
  end;
end;
begin 
  writeln('000000');
  Solution(0, '000000', 2);
end.