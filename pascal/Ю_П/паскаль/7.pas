var
  s, j, s2: string;
  i, k: integer;

function a(s: string): boolean;
var
  i: integer;
begin
  a := true;
  for i := 1 to length(s2) do
  begin
    if length(s2) <> 5 then
    begin
      a := false;
      break;
    end;
    if s2[i] <> s2[length(s2) - i + 1] then
    begin
      begin
        a := false;
        break;
      end
    end;
  end;
end;

begin
  k := 0;
  write('Введите фразу: ');
  readln(s);
  s2 := '';
  for i := 1 to length(s) do
  begin
    if s[i] <> ' ' then
    begin
      s2 := s2 + s[i];
    end 
    else 
    begin
      if a(s2) then 
        k := k + 1;
      s2 := '';
    end;
  end;
  if s2 <> '' then
  begin
    if a(s2) then 
      k := k + 1;
    s2 := ''; 
  end;
  writeln('Симметричных пятибуквенных слов: ', k);
end.