Const n = 9;

Type Data = Record
  all, stage: integer;
end;
  
Var
  Tree: Data;
  i: integer;
  
Procedure calculateDay(day: integer);
begin
  
end;
  
Begin 
  Tree.all := 0;
  Tree.stage := 0;
    
  For i := 1 to n do begin
    Tree.stage := Tree.stage + i;
    If i = 5 then
      Writeln('Stage #1 - ', Tree.stage);
    If i = 8 then
      Writeln('Stage #2 - ', Tree.stage);
    If i = 9 then
      Writeln('Stage #3 - ', Tree.stage);
  
    If (i = 5) or (i = 8) or (i = 9) then begin
      Tree.all := Tree.all + Tree.stage;
      Tree.stage := 0;
    end;
  end;
  
  Writeln('All day - ', Tree.all);
end.  
