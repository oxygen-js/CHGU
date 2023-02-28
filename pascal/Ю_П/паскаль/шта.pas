var
  s: string;
  i, l: byte;

begin
  readln(s);
  l := length(s);
  if l < 2 then exit;
  i := 1;
  while i <= l do
  begin
    if s[i] = ' ' then
    begin
      for i := 1 to l div 2 do 
        if s[i] <> s[l - i + 1] then 
        begin
          writeln('это не палиндром');
          exit;
        end;
    end
    else
      i := i + 1;
  end;
  writeln(s);
  if l < 2 then exit;
  
  
  writeln('это палиндром');    
end.
