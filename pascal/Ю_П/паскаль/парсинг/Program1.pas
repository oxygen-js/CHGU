Type  DataTr=Record
        Name,DName:string[50];
      end;
      
Var f1:textfile;
    F2:File of DataTr;
    s:string;
    i,k,k1,k2:integer;
    Tr:DataTr;
Begin
    AssignFile(f1,'kuh.txt');    
    Reset(f1);
    AssignFile(f2,'DBTr.dta');
    Rewrite(f2);    

    While Not Eof(f1) do begin
      Readln(f1,s);   
      Tr.Name:=s;
      Readln(f1,s);
      Tr.DName:=s;
      Readln(f1,s);
      Write(f2,Tr);      
    end;
    
    Close(f1);
    Close(f2);
end.   
