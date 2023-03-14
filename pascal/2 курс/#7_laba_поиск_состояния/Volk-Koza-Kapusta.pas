Type  
  Position=String[4];
var
  Step:integer;
  a:array[1..100] of Position;


Procedure Vivod;
Var i:integer;
begin   
   For i:=1 to Step do Writeln((a[i]));
   Writeln
end;

Function Zapret(s:Position):boolean;
begin
  Zapret:=((s[2]=s[3]) And (s[1]<>s[2])) Or
           (s[3]=s[4]) And (s[1]<>s[3])
end;

Function Povtor(k:integer;s:Position):boolean;
Var i:integer;
begin
   For i:=1 to k do
     If s=a[i] then begin
        Povtor:=True;
        Exit
     end;
   Povtor:=False
end;

Procedure Hod(i:integer;s:Position;
              Var ss:position;
              Var p:boolean);
begin
    ss:=s;
    If s[1]='0' then ss[1]:='1'
                else ss[1]:='0';
    p:=True;
    Case i of
    2:If s[2]<>s[1] then p:=False
                    else ss[2]:=ss[1];
    3:If s[3]<>s[1] then p:=False
                    else ss[3]:=ss[1];
    4:If s[4]<>s[1] then p:=False
                    else ss[4]:=ss[1];
    end
end;

Procedure Solution(k:integer;s:Position);
Var i:integer;
    ss:position;
    p:boolean;
begin
    a[k]:=s;
    For i:=1 to 4 do begin
      Hod(i,s,ss,p);
      If ss='1111' then begin
          a[k+1]:=ss;
          Step:=k+1;
          Vivod;
          Exit
      end;
      If p  And Not Povtor(k,ss) And Not Zapret(ss) then Solution(k+1,ss)
    end;
end;

begin
    Solution(1,'0000');
end.