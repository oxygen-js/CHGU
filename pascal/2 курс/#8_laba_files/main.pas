Var f1,f2: textfile;
    s:string;
    const Cap=['A'..'Z','А'..'Я'];
Begin
  AssignFile(f1,'file.txt');
  Reset(f1);
  AssignFile(f2, 'out.txt');
  Rewrite(f2);
  
  While Not EOF(f1) do
  begin
    Readln(f1,s);
    if (Length(s) > 0) And (s[1]<>'') And (s[1] in Cap) then 
     Writeln(f2, s);
  end;
  
  CloseFile(f1);
  CloseFile(f2);
  
  Writeln('Success'); 
end.    