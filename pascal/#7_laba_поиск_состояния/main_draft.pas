CONST N = 6;

type
  Position = String[N];

var
  Step: integer;
  chain: array[0..100] of Position;


procedure Vivod;
var
  i: integer;
begin
  for i := 0 to Step do Writeln((chain[i]));
  Writeln
end;


function Zapret(s: Position): boolean;
begin
  Zapret := (s[1] <> s[6]) And (s[2] <> s[5]) And (s[3] <> s[4]);
end; 


function Povtor(k: integer; s: Position): boolean;
var
  i: integer;
begin
  for i := 1 to k do
    if s = chain[i] then begin
      Povtor := True;
      Exit
    end;
  Povtor := False
end;


procedure Hod(i: integer; s: Position; var ss: position; var isNext: boolean);
begin
  ss := s;
  
  if (s[1] = '0') And (s[N - (i - 1)] = '0') then 
    begin
      ss[1] := '1';
      ss[N - (i - 1)] := '1';
    end;
  
  isNext := True;
  
  case i of
    2:
      if s[2] <> s[N - (i - 1)] then isNext := False
      else 
        begin
          ss[2] := ss[1];
          ss[N - (i - 1)] := ss[1];
        end;
    3:
      if s[3] <> s[N - (i - 1)] then isNext := False
      else 
        begin
          ss[3] := ss[1];
          ss[N - (i - 1)] := ss[1];
        end;
  end
end;

procedure Solution(k: integer; s: Position);
var
  i: integer;
  ss: position;
  isNext: boolean;
begin
  chain[k] := s;
  for i := 1 to N do
  begin
    Hod(i, s, ss, isNext);
    if ss = '111111' then begin
      chain[k + 1] := ss;
      Step := k + 1;
      Vivod;
      Exit
    end;
    if isNext And not Povtor(k, ss) And not Zapret(ss) then Solution(k + 1, ss)
  end;
end;

begin
  Solution(0, '000000');
end.